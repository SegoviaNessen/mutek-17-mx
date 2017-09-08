import de.looksgood.ani.*;

Ani animation;

float rad = 0.007;
float counter = 0;
float speed;
void setup() {
  size(720, 480);
  frameRate(30);
  
  Ani.init(this);
  
  animation = new Ani(this,5,"rad", 2);
  
  animation.setPlayMode(Ani.YOYO);
  animation.repeat();
}

void draw() {
  background(0);
  
  //speed = rad++;

  //println(animation.getRepeatCount() );

  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  arc(0, 0, 150, 150, 0, .2, PIE);
  popMatrix();
}