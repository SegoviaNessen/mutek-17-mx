import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class canvitas extends PApplet {

int counter0 = 0;
int counter1 = 0;
int counter2 = 0;
int counter3 = 0;
int counter4 = 0;
int counter5 = 0;
float radians = 1.0472f;

public void setup(){
  
  
}


public void draw(){
background(255);
stroke(0,100);
noFill();
ellipse(width/2, height/2, 50,50);
ellipse(width/2, height/2, 100,100);
ellipse(width/2, height/2, 150,150);
ellipse(width/2, height/2, 200,200);


stroke(255);
fill(0xffD00DFC,100);
arc(width/2, height/2, counter0,counter0, 0, radians,PIE);
fill(0xffFF0307,100);
arc(width/2, height/2, counter1,counter1, radians, radians*2,PIE);
fill(0xffADADAD,100);
arc(width/2, height/2, counter2,counter2, radians*2, radians*3,PIE);
fill(0xffF9FA00,100);
arc(width/2, height/2, counter3,counter3,radians*3, radians*4,PIE);
fill(0xffFA9600,100);
arc(width/2, height/2, counter4,counter4,radians*4, radians*5,PIE);
fill(0xff955403,100);
arc(width/2, height/2, counter5,counter5,radians*+5, radians*6,PIE);
}

public void keyPressed(){
  if (key == 'a'){
    counter0 += 10;
  } else if(key == 'b'){
    counter0 -= 10;
  }

  if (key == 'c'){
    counter1 += 10;
  } else if(key == 'd'){
    counter1 -= 10;
  }

  if (key == 'e'){
    counter2 += 10;
  } else if(key == 'f'){
    counter2 -= 10;
  }

  if (key == 'g'){
    counter3 += 10;
  } else if(key == 'h'){
    counter3 -= 10;
  }

  if (key == 'i'){
    counter4 += 10;
  } else if(key == 'j'){
    counter4 -= 10;
  }

  if (key == 'k'){
    counter5 += 10;
  } else if(key == 'l'){
    counter5 -= 10;
  }
}
  public void settings() {  size(720,480);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "canvitas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
