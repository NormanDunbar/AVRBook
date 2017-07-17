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
    // Turn on D13 LED.
    PORTB =  (1 << PB5);
    _delay_ms(1000);

    // Turn off D13 LED.
    PORTB= 0x00; //Turns OFF All LEDs
    _delay_ms(1000); //1 second delay
  }
}