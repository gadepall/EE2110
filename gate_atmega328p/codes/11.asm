.include "/home/alarm/m328Pdef.inc"
ldi r16,0b00000001
ldi r17,0b11111100
out DDRB,r16
out DDRD,r17
ldi r16, 36;No.
ldi r17, 0b00000010;2
ldi r20, 0b00000100
loop:;repeated sub --> Division
sub r16,r17; No.-2
IN r18,SREG;move sreg Valuesto r18 
MOV r19,r18;move r18 values to r19
AND r18,r17;consider only Z flag
cp r18,r17;{compare r18 and r17}
breq Even;if Z=1 then even 
AND r19,r20;mask in only N flag
cp r19,r20;compare r19,r20
breq Odd;if N=1 =>negative no.=>odd
rjmp loop
; to display 'E' on seven segment
Even:
ldi r16,0b00000000
out PortB, r16
ldi r16,0b00011000
out PortD,r16
Start1:
rjmp Start1
; to display 'O' on seven segment
odd:
ldi r16,0b00000001
out PortB, r16
ldi r16,0b00000000
out PortD,r16
Start2:
rjmp Start2
