/* Example sketch to control a 28BYJ-48 stepper motor with ULN2003 driver board and Arduino UNO. More info: https://www.makerguides.com */
// Include the Arduino Stepper.h library:
#include <Stepper.h>
#include <RTClock.h>

RTClock rtclock (RTCSEL_LSE); // initialise
// Define number of steps per rotation:
const int stepsPerRevolution = 2048;

const int secondsInDay = 86400;
const int secondsInWeek = secondsInDay * 7;
const int secondsPerTick = secondsInWeek / stepsPerRevolution;

int secondCount = 0;

Stepper myStepper = Stepper(stepsPerRevolution, PB12,  PB14, PB13, PB15);

void step() {
  secondCount++; 
}

void setup() {
  // Set the speed to 5 rpm:
  myStepper.setSpeed(10);
  rtclock.attachSecondsInterrupt(step);// Call SecondCount
}
void loop() {
  if (secondCount >= secondsPerTick) {
    secondCount  = 0;
    myStepper.step(1);
  }
}
