    ldi r16, 0x05
	ldi r17 ,0x05
	loop:
	add r16,r17
	dec r17 
	brne loop
	ldi r18 ,0x03
	add r16,r18
