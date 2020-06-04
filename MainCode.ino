#include <Servo.h>

Servo REDservo;
Servo GREENservo;
Servo BLUEservo;
Servo CONTROL_GATEservo;

void setup() {
  Serial.begin(9600);

  REDservo.attach(9);
  GREENservo.attach(10);
  BLUEservo.attach(11);
  CONTROL_GATEservo.attach(6);

  //
  CONTROL_GATEservo.write(110);
  REDservo.write(120);
  BLUEservo.write(120);
  GREENservo.write(120);

}

char rx_byte = 0;
String rx_str = "";
int result;

void loop()
{
  rx_byte = Serial.read();

  if (rx_byte == 'R')
  {
    CONTROL_GATEservo.write(110);
    CONTROL_GATEservo.write(180);
    REDservo.write(60);
    delay(4000);
    REDservo.write(120);
    delay(100);
    CONTROL_GATEservo.write(110);
  }

  else if (rx_byte == 'G')
  {
    CONTROL_GATEservo.write(110);
    CONTROL_GATEservo.write(180);
    GREENservo.write(60);
    delay(4000);
    GREENservo.write(120);
    delay(100);
    CONTROL_GATEservo.write(110);
  }

  else if (rx_byte == 'B')
  {
    CONTROL_GATEservo.write(110);
    CONTROL_GATEservo.write(180);
    BLUEservo.write(60);
    delay(4000);
    BLUEservo.write(120);
    delay(100);
    CONTROL_GATEservo.write(110);
  }

  else if (rx_byte == 'X')
  {
    CONTROL_GATEservo.write(110);
    CONTROL_GATEservo.write(180);
    delay(1000);
    CONTROL_GATEservo.write(110);
  }

  rx_str = "";
}
