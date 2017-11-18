/////
/////
/////
import de.looksgood.ani.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import processing.serial.*;

//variable para animadores
AniSequence valencia, eng, joy;

//variable para leds
Serial port;
boolean status = false;
float rele0,rele1,rele2;

//variables de audio
Minim minim;
AudioOutput out;
Oscil wave, mod; //señal para valencia
Oscil tri,Tmod; //señal para engagement
Oscil sq,Smod; //señal mpara joy

float vol;//volumen valencia Var1 docu
float volE;//volumen para engagement
float volJ; //volumen para joy

////variables para contador de tiempo
int time;
int wait = 1000; // para contar por segundo.
int contador0 = 0; // primer contador evento valencia Var1 docu

////variables para mmovimiento
float radV = 0.0; //valencia pos
float radE = 0.0; //engagement pos
float radJ = 0.0; //joy pos

void setup(){
  //size(2048,1080);//2K
  size(720,480);
  frameRate(15);
  
  println(Serial.list());
  port = new Serial(this, Serial.list()[1],9600);

  
  time = millis(); // almacena el tiempo que corre desde que se lanza el software
  Ani.init(this);
  
  valencia = new AniSequence(this);
  eng = new AniSequence(this);
  joy = new AniSequence(this);
  
  valencia1();
  eng1();
  joy1();
 
  ///SE ENCARGA DE TODA LA PARTE DEL AUDIO 
  minim = new Minim(this);
  out = minim.getLineOut();
  Summer sum = new Summer();
  wave = new Oscil(120,0.5f, Waves.SINE);
  wave.patch(sum);
  mod = new Oscil(129,0.5f, Waves.SINE);
  mod.patch(sum);
  tri = new Oscil(700,0.5, Waves.TRIANGLE);
  tri.patch(sum);
  Tmod = new Oscil(820,0.5f, Waves.TRIANGLE);
  Tmod.patch(sum);
  sq = new Oscil(1500,0.5, Waves.SQUARE);
  sq.patch(sum);
  Smod = new Oscil(1520,0.5f, Waves.SQUARE);
  Smod.patch(sum);
  
  sum.patch(out);
  
  
}

void draw() {
  background(0);

/////// VALENCIA
  vol = map(radV, 0, HALF_PI, 0,1);
  wave.setAmplitude(vol);
  mod.setAmplitude(vol);
  if(radV < QUARTER_PI){
    status = false;
    port.write("B");
  } if (radV >= QUARTER_PI){
      status = true;
      port.write("A");
    }

/////ENGAGEMENT 
  volE = map(radE, 0, HALF_PI, 0,1);
  tri.setAmplitude(volE);
  Tmod.setAmplitude(volE);
  if(radE < QUARTER_PI){
    status = false;
    port.write("D");
  } if (radE >= QUARTER_PI){
      status = true;
      port.write("C");
    }

  //////JOY
  volJ = map(radJ, 0, HALF_PI, 0,1);
  sq.setAmplitude(volJ);
  Smod.setAmplitude(volJ);
  if(radJ < QUARTER_PI){
    status = false;
    port.write("F");
  } if (radJ >= QUARTER_PI){
      status = true;
      port.write("E");
    }

////GRÀFICA VALENCIA
  fill(0,255,0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+ HALF_PI);
  arc(0, 0, 150, 150, 0, radV, PIE);
  popMatrix();
  
////GRÁFICA ENGAGEMENT
  fill(255,0,0,125);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+ HALF_PI);
  arc(0, 0, 150, 150, 0, radE, PIE);
  popMatrix();

////GRÀFICA JOY
  fill(0,0,255,125);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+ HALF_PI);
  arc(0, 0, 150, 150, 0, radJ, PIE);
  popMatrix();
  
  // checa la diferencia entre el tiempo actual y el almacenado
  if(millis() - time >= wait){
    contador0 ++;
    println(contador0);
   time = millis();
  }
  //controla los eventos de variable 1 docu
  if(contador0 == 13){
    eng.start();
  }
  if(contador0 == 19){
    valencia.start();
    
  }
  if(contador0 == 20){
    joy.start();
  }
}


// valencia Var1 docu
void valencia1(){
  valencia.beginSequence();
  valencia.add(Ani.to(this,2,"radV",HALF_PI+PI));
  valencia.add(Ani.to(this,3,"radV",HALF_PI+PI));
  valencia.add(Ani.to(this,2,"radV",0.0));
  valencia.add(Ani.to(this,35,"radV",0.0));
  valencia.add(Ani.to(this,2,"radV",QUARTER_PI+PI));
  valencia.add(Ani.to(this,2,"radV",QUARTER_PI+PI));
  valencia.add(Ani.to(this,2,"radV",0.0));
  valencia.add(Ani.to(this,7,"radV",0.0));
  valencia.add(Ani.to(this,2,"radV",HALF_PI));
  valencia.add(Ani.to(this,7,"radV",HALF_PI));
  valencia.add(Ani.to(this,2,"radV",0.0));
  valencia.endSequence();
  
}
//Engagement Var1 docu
void eng1(){
  eng.beginSequence();
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,1,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,1,"radE",HALF_PI+PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",QUARTER_PI+PI));
  eng.add(Ani.to(this,2,"radE",QUARTER_PI+PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,7,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,7,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,15,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,7,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,4,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  eng.add(Ani.to(this,2,"radE",HALF_PI));
  eng.add(Ani.to(this,7,"radE",HALF_PI));
  eng.add(Ani.to(this,2,"radE",0.0));
  
  eng.endSequence();
  
}

// Joy Var1 docu
void joy1(){
  joy.beginSequence();
  joy.add(Ani.to(this,1,"radJ",TWO_PI));
  joy.add(Ani.to(this,2,"radJ",0.0));
  joy.add(Ani.to(this,31,"radJ",0.0));
  joy.add(Ani.to(this,2,"radJ",HALF_PI+PI));
  joy.add(Ani.to(this,2,"radJ",HALF_PI+PI));
  joy.add(Ani.to(this,2,"radJ",0.0));
  joy.add(Ani.to(this,63,"radJ",0.0));
  joy.add(Ani.to(this,2,"radJ",QUARTER_PI+PI));
  joy.add(Ani.to(this,2,"radJ",0.0));
  joy.add(Ani.to(this,11,"radJ",0.0));
  joy.add(Ani.to(this,1,"radJ",HALF_PI));
  joy.add(Ani.to(this,2,"radJ",0.0));
  joy.add(Ani.to(this,2,"radJ",HALF_PI));
  joy.add(Ani.to(this,2,"radJ",HALF_PI));
  joy.add(Ani.to(this,2,"radJ",0.0));
  
  joy.endSequence();
  
}


///////AUDIO