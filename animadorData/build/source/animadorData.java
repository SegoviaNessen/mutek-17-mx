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

public class animadorData extends PApplet {

float data = 0;
float dataSpeed = 2;
public void setup(){
  
}


public void draw() {
  background(255);
  fill(255,0,0);

  arc(width/2, height/2, data , data , 0, QUARTER_PI, PIE);
  data = data + dataSpeed;

  if (data > 150 || data < 0){
    dataSpeed = dataSpeed * -1.0f;
  }

}
  public void settings() {  size(720,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "animadorData" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
