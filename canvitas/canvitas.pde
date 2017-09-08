int counter0 = 0;
int counter1 = 0;
int counter2 = 0;
int counter3 = 0;
int counter4 = 0;
int counter5 = 0;
float radians = 1.0472;

void setup(){
  size(720,480);
  smooth();
}


void draw(){
background(255);
stroke(0,100);
noFill();
ellipse(width/2, height/2, 50,50);
ellipse(width/2, height/2, 100,100);
ellipse(width/2, height/2, 150,150);
ellipse(width/2, height/2, 200,200);


stroke(255);
fill(#D00DFC,100);
arc(width/2, height/2, counter0,counter0, 0, radians,PIE);
fill(#FF0307,100);
arc(width/2, height/2, counter1,counter1, radians, radians*2,PIE);
fill(#ADADAD,100);
arc(width/2, height/2, counter2,counter2, radians*2, radians*3,PIE);
fill(#F9FA00,100);
arc(width/2, height/2, counter3,counter3,radians*3, radians*4,PIE);
fill(#FA9600,100);
arc(width/2, height/2, counter4,counter4,radians*4, radians*5,PIE);
fill(#955403,100);
arc(width/2, height/2, counter5,counter5,radians*+5, radians*6,PIE);
}

void keyPressed(){
  if (key == 'a'){
    counter0 += 10;
  } else if(key == 'b'){
    counter0 -= 10;
  }
  
  if (key == 'c'){
    counter1 += 10;
  } else if(key == 'd'){
    counter1 -= 10;
  }
  
  if (key == 'e'){
    counter2 += 10;
  } else if(key == 'f'){
    counter2 -= 10;
  }
  
  if (key == 'g'){
    counter3 += 10;
  } else if(key == 'h'){
    counter3 -= 10;
  }
  
  if (key == 'i'){
    counter4 += 10;
  } else if(key == 'j'){
    counter4 -= 10;
  }
  
  if (key == 'k'){
    counter5 += 10;
  } else if(key == 'l'){
    counter5 -= 10;
  }
}