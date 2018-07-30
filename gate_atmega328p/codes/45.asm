.include "/home/alarm/m328Pdef.inc"

ldi r16,0b00000011
out DDRB,r16
ldi r16,0b11111100
out DDRD,r16

eor r17,r17 ;treat like accumulator
ldi r18,0xF0
sub r17,r18

mov r19,r17
lsl r19
lsl r19
out PORTD,r19

mov r19,r17
swap r19
lsr r19
lsr r19
out PORTB,r19
