.include "m328Pdef.inc"
.ORG 0
	RJMP MAIN 

.ORG 0X02; address of INT0 interrupt
;.ORG 0X04; address of INT1 interrupt
	JMP TOGGLE

MAIN:
	LDI R16,HIGH(RAMEND)
	OUT SPH,R16
	LDI R16,LOW(RAMEND)
	OUT SPL,R16
	LDI R16,1<<ISC01 | 1<<ISC00           
;	LDI R16,1<<ISC11 | 1<<ISC10
	sts EICRA, R16
;PORTD,3 for int1	
	SBI PORTD,2      
	LDI R16,0B11111111
	OUT DDRB,R16
;for setting int1 use 0x02
	LDI R16, 0X01                         
	OUT EIMSK,R16                                            
JUMP: 
	RJMP JUMP

TOGGLE:
	LDI R17,0XFF
	OUT PORTB,R17
	RCALL DELAY
	LDI R17,0X00
	OUT PORTB,R17
	RETI

DELAY:
	LDI R16,0XFF
	L1:LDI R17,0XFF
	L2:ldi r18,0X0F
		L3:
			DEC R18
			BRNE L3		
			DEC R17
			BRNE L2
			DEC R16
			BRNE L1
			RET
  
