/////
/////
/////
import de.looksgood.ani.*;
import ddf.minim.*;
import processing.serial.*;

//variable para animadores
AniSequence valencia,valencia1,valencia2, eng, eng1,eng2, joy,joy1,joy2;
Ani animation; //fondo
float rad = 0.007; // vel rot
float radians = .5;//sep


//variable para leds
Serial port;
boolean status = false;
float rele0,rele1,rele2;

//variables de audio
Minim minim;
AudioPlayer player; //señal para valencia
AudioPlayer player0; //señal para engagement
AudioPlayer player1; //señal mpara joy
AudioPlayer player3; //señal para fondo

float vol;//volumen valencia Var1 docu
float volE;//volumen para engagement
float volJ; //volumen para joy

////variables para contador de tiempo
int time;
int wait = 1000; // para contar por segundo.
int contador0 = 0; // primer contador evento valencia Var1 docu

////variables para movimiento
float radV = 0.0; //valencia pos
float radE = 0.0; //engagement pos
float radJ = 0.0; //joy pos

////variables texto
PFont f;

void setup(){
  //size(2048,1080);//2K
  //size(1280,1024);
  size(720,480);
  background(0);
  frameRate(15);
  smooth();
   //printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 12);
  textFont(f);
  //textAlign(CENTER,CENTER);
  println(Serial.list());
  port = new Serial(this, Serial.list()[1],9600);

  
  time = millis(); // almacena el tiempo que corre desde que se lanza el software
  Ani.init(this);
  
  valencia = new AniSequence(this);
  valencia1 = new AniSequence(this);
  valencia2 = new AniSequence(this);
  eng = new AniSequence(this);
  eng1 = new AniSequence(this);
  eng2 = new AniSequence(this);
  joy = new AniSequence(this);
  joy1 = new AniSequence(this);
  joy2 = new AniSequence(this);
  
  animation = new Ani(this,5,"rad",2);
  animation.setPlayMode(Ani.YOYO);
  animation.repeat();  
  
  valencia1();
  valencia2();
  valencia3();
  eng1();
  eng2();
  eng3();
  joy1();
  joy2();
  joy3(); 
 
  ///SE ENCARGA DE TODA LA PARTE DEL AUDIO 
  minim = new Minim(this);
  player = minim.loadFile("chillido.mp3");
  player0 = minim.loadFile("dos.mp3");
  player1 = minim.loadFile("reversa.mp3");
  player3 = minim.loadFile("fondo.mp3");
  
  player.loop();
  player0.loop();
  player1.loop();
  player3.loop();
  
  
}

void draw() {
  noStroke();
  fill(0,125);
  rect(0,0,width,height);
  
  

/////// VALENCIA
  vol = map(radV, 0, HALF_PI, -60,-10);
  player1.setGain(vol);
  
  if(radV < QUARTER_PI){
    status = false;
    port.write("B");
    
   
  } if (radV >= QUARTER_PI){
      status = true;
      port.write("A");
   
    }
    

/////ENGAGEMENT 
  volE = map(radE, 0, HALF_PI, -60,0);
  player.setGain(volE);
  
  if(radE < QUARTER_PI){
    status = false;
    port.write("D");
  } if (radE >= QUARTER_PI){
      status = true;
      port.write("C");
     
  }

  //////JOY
  volJ = map(radJ, 0, HALF_PI, -60,0);
  player0.setGain(volJ);
 
  if(radJ < QUARTER_PI){
    status = false;
    port.write("F");
  } if (radJ >= QUARTER_PI){
      status = true;
      port.write("E");
      
  }
  
  pushMatrix();
  translate(10,10);
  fill(248,252,5);
  rect(0,0,50,25);
  fill(255);
  text("joy",75,15);
  String joyVal = str(radV);
  text( joyVal,0,70);
  fill(255,0,0);
  rect(250,0,50,25);
  fill(255);
  text("engagement",325,15);
  String engVal = str(radE);
  text( engVal,250,70);
  fill(0,0,255);
  rect(500,0,50,25);
  fill(255);
  text("valence",575,15);
  String valVal = str(radJ);
  text( valVal,500,70);
  popMatrix();

  
////GRÁFICA FONDO
  stroke(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  for (float i = 0; i < TWO_PI; i+= 0.7){
  noFill();
  arc(0, 0, 150,150, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 100,100, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 50,50, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 200,200, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 250,250, (radians + i)- 0.2,radians+ i, OPEN);
  }
 
  popMatrix();
////GRÀFICA VALENCIA
  fill(248,252,5);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radV);
  arc(0, 0, radV*45, radV*45, 0, QUARTER_PI, PIE);
  
 
  popMatrix();
  
////GRÁFICA ENGAGEMENT
  fill(255,0,0,125);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radE);
  arc(0, 0, radE*45, radE*45, 0,QUARTER_PI, PIE);
  popMatrix();

////GRÀFICA JOY
  fill(0,0,255,125);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radJ);
  arc(0, 0, radJ*45, radJ*45, 0, QUARTER_PI, PIE);
  popMatrix();
  
  // checa la diferencia entre el tiempo actual y el almacenado
  if(millis() - time >= wait){
    contador0 ++;
    println(contador0);
   time = millis();
  }
  
   //menciona la prueba
   pushMatrix();
   translate((width/2)-75, height-90);
   fill(255);
  if(contador0 <= 150 ){
  text("variable 1",50,0);
  text("los que no conoce sobre mutek",-10,40);
  }
  if(contador0 >= 151 && contador0 <= 228){
  text("variable 2",50,0);
  text("conoce mutek, no ha asistido",-10,40);
  }
  if(contador0 >= 229 && contador0 <= 290){
  text("variable 3",50,0);
  text("conoce mutek y  ha asistido",-10,40);
  }
    popMatrix();
  
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
  if(contador0 == 150){
    
    eng1.start();
  }
  if(contador0 == 181){
    valencia1.start();
  }
  if(contador0 == 192){
    joy1.start();
  }
  if(contador0 == 240){
    valencia2.start();
  }
  if(contador0 == 229){
    eng2.start();
  }
  if(contador0 == 275){
    joy2.start();
  }
  if(contador0 == 290){
    contador0 = 0;
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
void valencia2(){
  valencia1.beginSequence();
  valencia1.add(Ani.to(this,2,"radV",HALF_PI+PI));
  valencia1.add(Ani.to(this,1,"radV",HALF_PI+PI));
  valencia1.add(Ani.to(this,1,"radV",0.0));
  
  valencia1.add(Ani.to(this,1,"radV",QUARTER_PI+PI));
  
  valencia1.add(Ani.to(this,2,"radV",0.0));
  valencia1.add(Ani.to(this,23,"radV",0.0));
  valencia1.add(Ani.to(this,1,"radV",HALF_PI));
 
  valencia1.add(Ani.to(this,2,"radV",0.0));
  valencia1.add(Ani.to(this,6,"radV",0.0));
  valencia1.add(Ani.to(this,1,"radV",TWO_PI));
  valencia1.add(Ani.to(this,4,"radV",TWO_PI));
  valencia1.add(Ani.to(this,2,"radV",0.0));
  valencia1.endSequence();
  
}

void valencia3(){
  valencia2.beginSequence();
  valencia2.add(Ani.to(this,2,"radV",PI+0.9));
  
  valencia2.add(Ani.to(this,1,"radV",0.0));
  
  valencia2.add(Ani.to(this,4,"radV",0.0));

  valencia2.add(Ani.to(this,2,"radV",HALF_PI));
 
  valencia2.add(Ani.to(this,2,"radV",0.0));
  valencia2.add(Ani.to(this,23,"radV",0.0));
  valencia2.add(Ani.to(this,1,"radV",TWO_PI));
  valencia2.add(Ani.to(this,2,"radV",TWO_PI));
  valencia2.add(Ani.to(this,2,"radV",0.0));
  valencia2.endSequence();
  
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

void eng2(){
  eng1.beginSequence();
  eng1.add(Ani.to(this,1,"radE",HALF_PI+0.12));
  eng1.add(Ani.to(this,5,"radE",HALF_PI-0.2));
  eng1.add(Ani.to(this,2,"radE",0.0));
  eng1.add(Ani.to(this,32,"radE",0.0));
  eng1.add(Ani.to(this,1,"radE",HALF_PI+PI));
  eng1.add(Ani.to(this,4,"radE",HALF_PI+PI));
  eng1.add(Ani.to(this,2,"radE",0.0));
  eng1.add(Ani.to(this,5,"radE",0.0));
  eng1.add(Ani.to(this,2,"radE",QUARTER_PI+PI));
  
  eng1.add(Ani.to(this,2,"radE",0.0));
  eng1.add(Ani.to(this,4,"radE",0.0));
  eng1.add(Ani.to(this,2,"radE",HALF_PI));
  
  eng1.add(Ani.to(this,2,"radE",0.0));
  eng1.add(Ani.to(this,2,"radE",0.0));
  eng1.add(Ani.to(this,2,"radE",HALF_PI));
 
  eng1.add(Ani.to(this,1,"radE",0.0));
  
  eng1.add(Ani.to(this,1,"radE",HALF_PI));
  eng1.add(Ani.to(this,7,"radE",HALF_PI+0.3));
  
  eng1.add(Ani.to(this,2,"radE",HALF_PI-0.6));
  
  eng1.add(Ani.to(this,2,"radE",0.0));
 
  
  eng1.endSequence();
  
}

void eng3(){
  eng2.beginSequence();
  eng2.add(Ani.to(this,1,"radE",HALF_PI+2));
  
  eng2.add(Ani.to(this,2,"radE",0.0));
  eng2.add(Ani.to(this,7,"radE",0.0));
  eng2.add(Ani.to(this,2,"radE",HALF_PI+PI));
  
  eng2.add(Ani.to(this,2,"radE",0.0));

  eng2.add(Ani.to(this,1,"radE",QUARTER_PI+PI));
 
  eng2.add(Ani.to(this,2,"radE",0.0));

  eng2.add(Ani.to(this,3,"radE",HALF_PI));
  
  eng2.add(Ani.to(this,2,"radE",0.0));
  eng2.add(Ani.to(this,4,"radE",0.0));
  eng2.add(Ani.to(this,1,"radE",HALF_PI));
 
  eng2.add(Ani.to(this,1,"radE",0.0));
  eng2.add(Ani.to(this,9,"radE",0.0));  
  eng2.add(Ani.to(this,1,"radE",HALF_PI));
  eng2.add(Ani.to(this,2,"radE",0.0));
  eng2.add(Ani.to(this,5,"radE",0.0));
  
  eng2.add(Ani.to(this,2,"radE",HALF_PI-0.6));
  eng2.add(Ani.to(this,2,"radE",HALF_PI-2.6));
  eng2.add(Ani.to(this,2,"radE",HALF_PI));
  
  eng2.add(Ani.to(this,2,"radE",0.0));
 
  
  eng2.endSequence();
  
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

void joy2(){
  joy1.beginSequence();
  joy1.add(Ani.to(this,1,"radJ",TWO_PI));
  joy1.add(Ani.to(this,2,"radJ",0.0));
 
  joy1.endSequence();
  
}

void joy3(){
  joy2.beginSequence();
  joy2.add(Ani.to(this,2,"radJ",TWO_PI+PI));
  joy2.add(Ani.to(this,1,"radJ",0.0));
  joy2.add(Ani.to(this,2,"radJ",HALF_PI+PI));
  joy2.add(Ani.to(this,1,"radJ",0.0));
  joy2.endSequence();
  
}