;Question 6
.include "/home/alarm/m328Pdef.inc"

main:
	ldi r16, 0x00
	out sreg, r16
	ldi r16, low(RAMEND)
	out SPL, r16
	ldi r16, high(RAMEND)
	out SPH, r16

	ldi r16, 0xfc
	out ddrd, r16
	ldi r16, 0x01
	out ddrb, r16

Q2:
	CLC
	.DEF A = R16
	.DEF B = R17

	LDI A, 0x07
	CALL RLC
	MOV B, A
	CALL RLC
	CALL RLC
	ADD A, B

	MOV R15, A
	call dispReg

start: rjmp start

RLC: ROL A
	IN R20, SREG
	SBRC R20, 0
	ORI A, 0x01
	SBRS R20, 0
	ANDI A, 0xFE
	RET

dispReg:
	call display
	call delay
	swap r15
	call display
	swap r15
	call delay
	ret

display:
	mov r16, r15

	andi r16, 0xf0
	swap r16

	cpi r16, 0x00
	breq lo0
	cpi r16, 0x01
	breq lo1
	cpi r16, 0x02
	breq lo2
	cpi r16, 0x03
	breq lo3
	cpi r16, 0x04
	breq lo4
	cpi r16, 0x05
	breq lo5
	cpi r16, 0x06
	breq lo6
	cpi r16, 0x07
	breq lo7
	cpi r16, 0x08
	breq lo8
	cpi r16, 0x09
	breq lo9
	cpi r16, 0x0a
	breq loa
	cpi r16, 0x0b
	breq lob
	cpi r16, 0x0c
	breq loc
	cpi r16, 0x0d
	breq lod
	cpi r16, 0x0e
	breq loe
	cpi r16, 0x0f
	breq lof

	ret

lo0: call l0
	ret
lo1: call l1
	ret
lo2: call l2
	ret
lo3: call l3
	ret
lo4: call l4
	ret
lo5: call l5
	ret
lo6: call l6
	ret
lo7: call l7
	ret
lo8: call l8
	ret
lo9: call l9
	ret
loa: call la
	ret
lob: call lb
	ret
loc: call lc
	ret
lod: call lde
	ret
loe: call le
	ret
lof: call lf
	ret

l0:
	push r16
	ldi r16, 0b00000000
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret

l1:
	push r16
	ldi r16, 0b11100111
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret

l2:
	push r16
	ldi r16, 0b10010000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

l3:
	push r16
	ldi r16, 0b11000000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

l4:
	push r16
	ldi r16, 0b01100100
	out portd, r16
	ldi r16, 0b11000000
	out portb, r16
	pop r16
	ret

l5:
	push r16
	ldi r16, 0b01001000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

l6:
	push r16
	ldi r16, 0b00001000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

l7:
	push r16
	ldi r16, 0b11100000
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret

l8:
	push r16
	ldi r16, 0b00000000
	out portd, r16
	ldi r16, 0b11000000
	out portb, r16
	pop r16
	ret

l9:
	push r16
	ldi r16, 0b01000000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

la:
	push r16
	ldi r16, 0b00100000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

lb:
	push r16
	ldi r16, 0b00001100
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

lc:
	push r16
	ldi r16, 0b00011000
	out portd, r16
	ldi r16, 0b00000001
	out portb, r16
	pop r16
	ret

lde:
	push r16
	ldi r16, 0b10000100
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

le:
	push r16
	ldi r16, 0b00011000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
	ret

lf:
	push r16
	ldi r16, 0b00111000
	out portd, r16
	ldi r16, 0b00000000
	out portb, r16
	pop r16
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
	pop r22
	pop r21
	pop r20
	RET
