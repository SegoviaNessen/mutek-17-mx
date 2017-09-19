String filename = "eMotions_UNO.csv";
String[] rawData;
float[] anger;

int margin, graphHeight;
float xSpacer;

PVector[] positions;

void setup() {
  size(800, 300);
  processData();

}

void draw() {
  background(0);
  fill(200);
  for (int i = 0; i<positions.length; i++){
    ellipse(positions[i].x, positions[i].y, 15,15);
  }
   
}

void processData() {
  rawData = loadStrings(filename);
  anger = new float[rawData.length -1];
  positions = new PVector[rawData.length-1];
  for (int i = 1; i < rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    anger[i-1] = float(thisRow[0]);
  }
  float overallMin = min(anger);
  float overallMax = max(anger);
  //println(overallMin + " " + overallMax);
  margin = 50;
  graphHeight = (height-margin) - margin;
  xSpacer = (width -margin - margin)/(anger.length - 1);
  
  for(int i = 0; i < anger.length; i++ ){
    float adjAnger = map(anger[i], overallMin, overallMax, 0, graphHeight);
    float yPos = height -margin -adjAnger;
    float xPos = margin + (xSpacer * i);
    positions[i] = new PVector(xPos, yPos);
  }
}

