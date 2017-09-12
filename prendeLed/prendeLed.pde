import processing.serial.*;

Serial port;

int rquad = 40;
int xquad = 200;
int yquad = 200;

boolean overRect = false;

int red = 100;
int green = 100;
int blue = 100;

boolean status = false;
String texto = "LED OFF";

void setup(){
  println(Serial.list());
  port = new Serial(this, Serial.list()[2],9600);
  
  size(800,400);
  
}

void draw(){
  background(255);
  
  if(mouseX > xquad-rquad && mouseY < xquad + rquad
      && mouseY > yquad-rquad && mouseX < yquad+rquad)
      {
        overRect = true;
        stroke(255,0,0);
      }
     else
     {
       overRect = false;
       stroke(0);
     }
     
     fill(red,green,blue);
     rectMode(RADIUS);
     rect(xquad,yquad,rquad,rquad);
     
}


void mousePressed(){
  if(overRect == true)
  {
    status = !status;
    port.write("A");
    
    if (status == true)
    {
      red = 255;
      green = 0;
      blue = 0;
    }
    if (status == false)
    {
      red = 100;
      green = 100;
      blue = 100;
    }
  }
}

