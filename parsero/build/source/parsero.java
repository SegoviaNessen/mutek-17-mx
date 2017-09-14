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

public class parsero extends PApplet {

String[] textLines;
String myData [][];

public void setup( ) {
  
  

  textLines = loadStrings("eMotions_UNO.csv");

  myData = new String [textLines.length][6];

  for(int i = 0; i< textLines.length; i++){
    myData[i] = textLines[i].split(",");
  }
    println(myData[1][0]);
}

public void draw( ) {
  background(255);
  translate(20,height/2);

  stroke(128);
  fill(255,128);

  /*for (int i = 0; i < textLines.length; i++){
    String[] currentLine = split(textLines[i],",");
    for(int j = 0; j < currentLine.length; j++){
      println(currentLine[j]);

    }
    println("---");
  }*/
}
  public void settings() {  size(640,200 , P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "parsero" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
