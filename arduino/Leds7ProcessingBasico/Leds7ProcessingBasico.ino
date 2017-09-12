int led0 = 3;
int led1 = 4;
int led2 = 5;
int led3 = 6;
int led4 = 7;
int led5 = 8;
int led6 = 9;



int rele = 2;

boolean estado0 = LOW;
boolean estado1 = LOW;
boolean estado2 = LOW;
boolean estado3 = LOW;
boolean estado4 = LOW;
boolean estado5 = LOW;
boolean estado6 = LOW;



void setup() {
  Serial.begin(9600);
  
  pinMode(led0,OUTPUT);
  pinMode(led1,OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(led3,OUTPUT);
  pinMode(led4,OUTPUT);
  pinMode(led5,OUTPUT);
  pinMode(led6,OUTPUT);
  
  
  pinMode(rele,OUTPUT);

}

void loop() {

  if(Serial.available()>0)
    {
      byte dato = Serial.read();
      if (dato == 65)
      {
        estado0 = !estado0;
      }
      digitalWrite(led0,estado0);
      digitalWrite(rele,estado0);
    

     if (dato == 66)
      {
        estado1 = !estado1;
      }
      digitalWrite(led1,estado1);

      if (dato == 67)
      {
        estado2 = !estado2;
      }
      digitalWrite(led2,estado2);
      
      if (dato == 68)
      {
        estado3 = !estado3;
      }
      digitalWrite(led3,estado3);

      if (dato == 69)
      {
        estado4 = !estado4;
      }
      digitalWrite(led4,estado4);

      if (dato == 70)
      {
        estado5 = !estado5;
      }
      digitalWrite(led5,estado5);

      if (dato == 71)
      {
        estado6 = !estado6;
      }
      digitalWrite(led6,estado6);
     
    }

}
