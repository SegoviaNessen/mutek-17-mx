float data = 0;
float dataSpeed = 2;
void setup(){
  size(720,480);
}


void draw() {
  background(255);
  fill(255,0,0);

  arc(width/2, height/2, data , data , 0, QUARTER_PI, PIE);
  data = data + dataSpeed;

  if (data > 150 || data < 0){
    dataSpeed = dataSpeed * -1.0;
  }

}
