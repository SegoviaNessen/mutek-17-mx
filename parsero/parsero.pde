String[] textLines;
String myData [][];

void setup( ) {
  size(640,200 , P3D);
  smooth();

  textLines = loadStrings("eMotions_UNO.csv");

  myData = new String [textLines.length][6];

  for(int i = 0; i< textLines.length; i++){
    myData[i] = textLines[i].split(",");
  }
    println(myData[1][0]);
}

void draw( ) {
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
