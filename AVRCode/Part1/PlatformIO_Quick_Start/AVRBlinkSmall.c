// This must also be done before anything else.
#ifndef F_CPU
#define F_CPU 16000000UL // 16 MHz clock speed
#endif

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
  // SETUP goes here.
  // Makes D13 aka PB5 (PORTB, Pin5) an output pin
  DDRB = (1 << PB5); 

  // And here is what Arduino calls loop.
  while(1) //infinite loop
  {
    // Toggle on D13 LED.
    PINB =  (1 << PB5);
    _delay_ms(1000);
  }
}
