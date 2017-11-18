//// variables para encender los releés
int rele = 2;
int rele0 = 3;
int rele1 = 4;


boolean estado0 = LOW;
boolean estado1 = LOW;
boolean estado2 = LOW;




void setup() {
  Serial.begin(9600);
  pinMode(rele,OUTPUT);  
  pinMode(rele0,OUTPUT);
  pinMode(rele1,OUTPUT);
  }

void loop() {
//se encienden los relés via datos en pares
  if(Serial.available()>0)
    {
      byte dato = Serial.read();

      //primer relè
      if (dato == 65)
      {
        estado0 = HIGH;
      }
      
      digitalWrite(rele,estado0);   

     if (dato == 66)
      {
        estado0 = LOW;
      }
      
      digitalWrite(rele,estado0);


      ////segundo rele

      if (dato == 67)
      {
        estado1 = HIGH;
      }
      digitalWrite(rele0,estado1);
      
      if (dato == 68)
      {
        estado1 = LOW;
      }
      digitalWrite(rele0,estado1);


      //tercer relè

      if (dato == 69)
      {
        estado2 = HIGH;
      }
      digitalWrite(rele1,estado2);

      if (dato == 70)
      {
        estado2 = LOW;
      }
      digitalWrite(rele1,estado2);

   //fin de releès
     
    }

}
