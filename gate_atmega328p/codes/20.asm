.include "/home/mamidela_harsha/Documents/embedded_program/m328Pdef.inc"
ldi r17, 0b11111100 
out DDRD, r17 ;declaring pins as output
ldi r17, 0b00000001
out DDRB,r17
;ldi r29,0xe9
;rcall disp
clr r16;
clr r0;
loopshow:

mov r30,r16
inc r16;
andi r30,0x0f
cpi r30,10;
breq addsix;
l:
inc r0;

cpi r16,0x99;
breq loopans
rjmp loopshow;

addsix:
ldi r17,6;
add r16,r17;
rjmp l

loopans:
mov r29,r0;
call disp;
rjmp loopans 



disp:
	mov r17,r29
	
	andi r17, 0xF0
	swap r17
	mov r16,r17
	call display
	call delay
	;ldi r29,0xe9
	mov r17,r29
	andi r17, 0x0F
	mov r16,r17
	call display
	call delay
	;ret
	rjmp disp	
		;nop
	
	
display:
   cpi r16, 0x00
	brne display1
	l0:
	ldi r18, 0b00000000
	out portd, r18
	ldi r18, 0b00000001
	out portb, r18
	ret
	
display1:	
	cpi r16, 0x01
brne display2
	l1:
	push r16
	ldi r16, 0b11100111
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret
	display2:
	cpi r16, 0x02
	brne display3
	l2:
	push r16
	ldi r16, 0b10010000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display3:
	cpi r16, 0x03
	brne display4
	l3:
	push r16
	ldi r16, 0b11000000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display4:
	cpi r16, 0x04
	brne display5
	
l4:
	push r16
	ldi r16, 0b01100100
	out portd, r16
	ldi r16, 0b11000000
	out portb, r16
	pop r16
	ret
	display5:
	cpi r16, 0x05
	brne display6
	l5:
	push r16
	ldi r16, 0b01001000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display6:
	cpi r16, 0x06
	brne display7
	l6:
	push r16
	ldi r16, 0b00001000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display7:
	cpi r16, 0x07
	brne display8
	l7:
	push r16
	ldi r16, 0b11100000
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret
	display8:
	cpi r16, 0x08
	brne display9
	l8:
	push r16
	ldi r16, 0b00000000
	out portd, r16
	ldi r16, 0b11000000
	out portb, r16
	pop r16
	ret
	display9:
	cpi r16, 0x09
	brne display10
	call l9
	l9:
	push r16
	ldi r16, 0b01000000
	out PORTD, r16
	ldi r16, 0b00000000
	out PORTB, r16
	pop r16
	ret
	display10:
	cpi r16, 0x0a
	brne display11
	call la
	la:
	push r16
	ldi r16, 0b00100000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display11:
	cpi r16, 0x0b
		brne display12
	lb:
	push r16
	ldi r16, 0b00001100
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display12:
	cpi r16, 0x0c
		brne display13
	lc:
	push r16
	ldi r16, 0b00011000
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret
	display13:
	cpi r16, 0x0d
	brne display14
		ld:
	push r16
	ldi r16, 0b10000100
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

	display14:
	cpi r16, 0x0e
		brne display15
	le:
	push r16
	ldi r16, 0b00011000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	display15:
	cpi r16, 0x0f
	breq lf
	lf:
	push r16
	ldi r16, 0b00111000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret
	ret


	
	delay:
	push r20
	push r21
	push r22
	LDI R20, $54
	LDI R21, $00
	LDI R22, $00
	
	D0:
	DEC R22
	BRNE D0
	DEC R21
	BRNE D0
	DEC R20
	BRNE D0
	pop r20
	pop r21
	pop r22
	RET
