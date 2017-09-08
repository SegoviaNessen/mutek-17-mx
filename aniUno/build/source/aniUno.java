import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.looksgood.ani.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class aniUno extends PApplet {



Ani animation;

float rad = 0.007f;
float counter = 0;
float speed;
public void setup() {
  
  frameRate(30);

  Ani.init(this);

  animation = new Ani(this,5,"rad", 2);

  animation.setPlayMode(Ani.YOYO);
  animation.repeat();
}

public void draw() {
  background(0);

  //speed = rad++;

  //println(animation.getRepeatCount() );

  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  arc(0, 0, 150, 150, 0, .2f, PIE);
  popMatrix();
}
  public void settings() {  size(720, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "aniUno" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
