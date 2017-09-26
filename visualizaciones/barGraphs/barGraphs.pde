


String filename = "prueba2.csv";
String[] time;
String[] rawData;
float [] value;

void setup( ) {

  size(700,200);

  processData();

}

void draw( ) {
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

void processData( ) {
  rawData = loadStrings(filename);
  value = new float[rawData.length];

  for(int i = 1; i < value.length; i++){
    String[] thisRow = split(rawData[i], ",");
    value[i] = float(thisRow[0]);

  }

  println(value);

  float ovMin = min (value);
  float ovMax = max (value);
  //println(ovMax);
}
