.include "/home/rudrashishpal/m328Pdef.inc"


ldi r16, 0b00000001 ;load the values 01
ldi r17, 0b00000010 ;and 02
;at r16 and r17 resp

clr r26       ; Clear X low byte
ldi r27, $60  ; Set X high byte to $60

st X+,r16     ;store r16 and r17 value 
st X, r17     ;at data space $60 and $61

ldi r27, $60  ; Set X high byte to $60
clr r26

ld r0,X+     ;Load r0 with data space loc. 
			 ;60(X post inc)
ld r1,X      ;Load r1 with data space 
			 ;loc. $61

add r0, r1  ;add stored in r0

lsl r0
lsl r0

ldi r16 , 0b00111100
out DDRD, r16
out PortD ,r0
Start:
   rjmp Start




