int led = 9;
int rele = 2;
boolean estado = LOW;


void setup() {
  Serial.begin(9600);

  pinMode(led,OUTPUT);
  pinMode(rele,OUTPUT);

}

void loop() {

  if(Serial.available()>0)
    {
      byte dato = Serial.read();
      if (dato == 65)
      {
        estado = !estado;
      }
      digitalWrite(led,estado);
      digitalWrite(rele,estado);
    }

}
