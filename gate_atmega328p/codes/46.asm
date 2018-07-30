; prob 46
; Anees Ahmed

.include "m328Pdef.inc"

ldi r16, 0b00000000 ; declaring pin 5 as input
out DDRD, r16       ;

cbi DDRD, 5

ldi r16, 0b00100000 ; declaring pin 13 as output
out DDRB, r16       ;

mainloop:
in r16, PinD
andi r16, 0b00100000
out PortB, r16
rjmp mainloop
