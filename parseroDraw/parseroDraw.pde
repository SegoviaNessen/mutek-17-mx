String filename = "eMotions_UNO.csv";
String[] rawData;
float[] anger;

void setup() {
  size(800, 300);
  processData();

}

void draw() {
  
   
}

void processData() {
  rawData = loadStrings(filename);
  anger = new float[rawData.length -1];
  for (int i = 1; i < rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    anger[i-1] = float(thisRow[0]);
  }
}

