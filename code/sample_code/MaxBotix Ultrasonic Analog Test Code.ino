

const int sonarPin = 6;
const int ledPin   = 13;
long distance, pause;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void changeState(int state) {
  distance = analogRead(sonarPin)/2;
  digitalWrite(ledPin,state);
  pause = distance * 15;
  if (pause > 1500) {
  	pause = 1500;
  }
  delay((int) pause); 
}

void loop() {
  changeState(1);
  changeState(0);
}
