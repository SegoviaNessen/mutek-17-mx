/////
/////
/////
import de.looksgood.ani.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

//variable para animadores
AniSequence valencia, eng, joy;

//variables de audio
Minim minim;
AudioOutput out;
Oscil wave, mod; //señal para valencia

float vol;//volumen valencia Var1 docu

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
  time = millis(); // almacena el tiempo que corre desde que se lanza el software
  Ani.init(this);
  
  valencia = new AniSequence(this);
  eng = new AniSequence(this);
  joy = new AniSequence(this);
  
  valencia1();
  eng1();
  joy1();
  
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil(120,0.5f, Waves.SINE);
  mod = new Oscil(129,0.5f, Waves.SINE);
  
  wave.patch(out);
  mod.patch(out);
  
}

void draw() {
  background(0);


  vol = map(radV, 0, HALF_PI, 0,1);
  wave.setAmplitude(vol);
  mod.setAmplitude(vol);
  //speed = rad++;

  //println(animation.getRepeatCount() );

  fill(0,255,0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+ HALF_PI);
  arc(0, 0, 150, 150, 0, radV, PIE);
  popMatrix();
  
  fill(255,0,0,125);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+ HALF_PI);
  arc(0, 0, 150, 150, 0, radE, PIE);
  popMatrix();
  
  fill(0,0,255,125);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+ HALF_PI);
  arc(0, 0, 150, 150, 0, radJ, PIE);
  popMatrix();
  
  // cheaca la diferencia entre el tiempo actual y el almacenado
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
  valencia.add(Ani.to(this,2,"radV",HALF_PI));
  valencia.add(Ani.to(this,4,"radV",HALF_PI));
  valencia.add(Ani.to(this,2,"radV",0.0));
  valencia.add(Ani.to(this,34,"radV",0.0));
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