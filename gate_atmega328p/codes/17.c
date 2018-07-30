#include <avr/io.h>
#include <avr/interrupt.h>
//#define F_CPU 4000000UL
#include <util/delay.h>
 
//Interrupt Service Routine for INT0
ISR(INT0_vect)
{
	unsigned char i;
 	PORTB = 0b11111111;
	_delay_ms(2500);	
}	
int main(void)
{
	DDRD = 1<<PD2;	
	// Using PD2 for interupt INT0
	PORTD = 1<<PD2;	
	// Enable PD2 pull-up resistor
 	DDRB = 0b00000011;		
		
	EIMSK = 1<<INT0;
	// Enable INT0
	EICRA = 1<<ISC01 | 1<<ISC00;
	// Trigger INT0 on rising edge
	sei();				
	//Enable Global Interrupt
     while(1)
    {
		PORTB = 0x11111100;
    }
    }
