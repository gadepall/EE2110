.include "/home/alarm/m328Pdef.inc"
.SET as =0xF00


ldi r16,0b00100000
out DDRB,r16


k:
ldi r16,4
ldi r17,3

add r16,r17

sts as,r16
lds r16,as

cpi r16,7
breq loop
jmp k


loop:
ldi r16,0b00100000
out PORTB,r16
