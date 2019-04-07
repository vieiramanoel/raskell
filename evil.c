#include <stdio.h>
#include "prototypes.h"


extern int c_wiringPiSetup(void) {
  return wiringPiSetup();
};

extern void c_pinMode(int pin, int mode) {
  return pinMode(pin, mode);
}

extern void c_digitalWrite(int pin, int mode) {
  return digitalWrite(pin, mode);
}