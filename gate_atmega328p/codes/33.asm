.include "/usr/share/avra/m328Pdef.inc"

ldi r16, 0b11111100
OUT DDRD, r16
ldi r16, 0b00000001
OUT DDRB, r16
lp:
;Instructions of Problem
CLR r16
clr r19
MOV r19 , r16
MOV r18 , r19
INC r19
add r19,r19 ; Add low byte
add r18,r18 
;For displaying value of registor r18
clr r22
mov r22,r18
call mainloop
call wait
clr r22
 mov r22,r19
 call mainloop
 call wait
 rjmp lp
mainloop:
