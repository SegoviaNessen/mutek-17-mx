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

public class barGraphs extends PApplet {




String filename = "prueba2.csv";
String[] time;
String[] rawData;
float [] value;

public void setup( ) {

  

  processData();

}

public void draw( ) {
  background(255);
  fill(0);
  stroke(255);
  for(int i = 0; i < value.length; i++){
    float multiplier = 1;
    float rectWidth = width / (value.length);
    float yPos = height -(value[i]* multiplier);

    rect((rectWidth*i),yPos, rectWidth, yPos);
  }


}

public void processData( ) {
  rawData = loadStrings(filename);
  value = new float[rawData.length];

  for(int i = 1; i < value.length; i++){
    String[] thisRow = split(rawData[i], ",");
    value[i] = PApplet.parseFloat(thisRow[0]);

  }

  println(value);

  float ovMin = min (value);
  float ovMax = max (value);
  //println(ovMax);
}
  public void settings() {  size(700,200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "barGraphs" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
