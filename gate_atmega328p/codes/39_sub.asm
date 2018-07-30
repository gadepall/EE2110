.include "/home/alarm/m328Pdef.inc"

ldi r16, 0b11111100
out DDRD, r16
ldi r16, 0b00000001
out DDRB, r16

clc ;clear carry flag
ldi r16, 0b00000001  ;load 1 in r16
ldi r17, 0b01000000  ;load 2^6 in r17
sub r16, r17         ;do r16 = r16 - r17
brcs  dis_one        ;if carry flag is set display one 
rcall dis_zero      ;else display zero 

dis_one:
ldi r16, 0b11100100
out PortD, r16
ldi r16, 0b00000001
out PORTB, r16
rjmp dis_one

dis_zero:
ldi r16, 0b00000000
out PortD, r16
ldi r16, 0b00000001
out PortB, r16
rjmp dis_zero
