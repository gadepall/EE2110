.include "/usr/share/avra/m328Pdef.inc"

ldi r16, 0b11111100
OUT DDRD, r16
ldi r16, 0b00000001
OUT DDRB, r16
ldi r21 ,0b11111010

clr r30 
ldi r31,0b00001001
st Z,r21
;ldi r30, 7
ld r4,Z 
com r4
mov r22,r4
call mainloop
;start:
;rjmp start
 
mainloop:
ldi r17,0b11110000
and r17, r22
lsr r17
lsr r17
lsr r17
lsr r17
mov r16, r17
call loop1

call wait

ldi r18,0b00001111
and r18, r22
mov r16, r18
call loop1
ret


loop1:
cpi r16, 0
breq zero
cpi r16, 1
breq one
cpi r16, 2
breq two
cpi r16, 3
breq three
cpi r16, 4
breq four
cpi r16, 5
breq five
cpi r16, 6
breq six
cpi r16, 7
breq seven
cpi r16, 8
breq eight
cpi r16, 9
breq nine
cpi r16, 10
breq a
cpi r16, 11
breq b
cpi r16, 12
breq c
cpi r16, 13
breq d
cpi r16, 14
breq e
cpi r16, 15
breq f


cpi r16, 0
breq zero
zero:
rjmp disp_zero
cpi r16, 1
breq one
one:
rjmp disp_one
cpi r16, 2
breq two
two:
rjmp disp_two
cpi r16, 3
breq three
three:
rjmp disp_three
cpi r16, 4
breq four
four:
rjmp disp_four
cpi r16, 5
breq five
five:
rjmp disp_five
cpi r16, 6
breq six
six:
rjmp disp_six
cpi r16, 7
breq seven
seven:
rjmp disp_seven
cpi r16, 8
breq eight
eight:
rjmp disp_eight
cpi r16, 9
breq nine
nine:
rjmp disp_nine

cpi r16, 10
breq a
a:
rjmp disp_a
cpi r16, 11
breq b
b:
rjmp disp_b
cpi r16, 12
breq c
c:
rjmp disp_c
cpi r16, 13
breq d
d:
rjmp disp_d
cpi r16, 14
breq e
e:
rjmp disp_e
cpi r16, 15
breq f
f:
rjmp disp_f



disp_zero:
	ldi r17, 0b00000000
    OUT PortD, r17
    ldi r17, 0b00000001
    OUT PortB, r17
    ret

disp_one:
	ldi r17, 0b11100100
    OUT PortD, r17
    ldi r17, 0b00000001
    OUT PortB, r17
    ret

disp_two:
	ldi r17, 0b10010000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17
    ret

disp_three:
	ldi r17, 0b11000000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17    
    ret

disp_four:
	ldi r17, 0b01100100
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17   
    ret		

disp_five:
	ldi r17, 0b01001000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17 
    ret

disp_six:
	ldi r17, 0b00001000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17   
    ret
		
disp_seven:
	ldi r17, 0b11100000
    OUT PortD, r17
    ldi r17, 0b00000001
    OUT PortB, r17   
    ret						

disp_eight:
	ldi r17, 0b00000000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17 
    ret
		
disp_nine:
	ldi r17, 0b01000000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17    
    ret

disp_a:
	ldi r17, 0b00100000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17    
    ret

disp_b:
	ldi r17, 0b00001100
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17    
    ret

disp_c:
	ldi r17, 0b00011000
    OUT PortD, r17
    ldi r17, 0b00000001
    OUT PortB, r17    
    ret
		
disp_d:
	ldi r17, 0b10000100
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17    
    ret		

disp_e:
	ldi r17, 0b00011000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17    
    ret				
		
disp_f:
	ldi r17, 0b00111000
    OUT PortD, r17
    ldi r17, 0b00000000
    OUT PortB, r17   
    ret	



wait:
	push r20
	push r21
	push r22
	
	ldi r20, 0x60
	ldi r21, 0x00
	ldi r22, 0x00
	
w0:
	dec r22
	brne w0
	dec r21
	brne w0
	dec r20
	brne w0
	
	pop r22
	pop r21
	pop r20
	ret
	
