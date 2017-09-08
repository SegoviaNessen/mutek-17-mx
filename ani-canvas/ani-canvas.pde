import de.looksgood.ani.*;


float rad = 0.007 ;

float radians = .5;

Ani animation;

void setup( ) {
  size(720,480);

  Ani.init(this);

  animation = new Ani(this,5,"rad", 2);

  animation.setPlayMode(Ani.YOYO);
  animation.repeat();
}

void draw ( ) {
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
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
