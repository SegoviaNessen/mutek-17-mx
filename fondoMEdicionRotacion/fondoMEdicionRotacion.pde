float radians = .5;
float rotSpeed = 0.002;

void setup(){
  size(720,480);
}

void draw(){
  background (255);
  
  rotSpeed ++;
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSpeed/0.0174533);
  for (float i = 0; i < TWO_PI; i+= 0.7){
  noFill();
  arc(0, 0, 150,150, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 100,100, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 50,50, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 200,200, (radians + i)- 0.2,radians+ i, OPEN);
  arc(0, 0, 250,250, (radians + i)- 0.2,radians+ i, OPEN);
  }
  popMatrix();
}