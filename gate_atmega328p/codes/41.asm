.include "/home/alarm/m328Pdef.inc"
ldi r16, 0x14
shift:
	rol r16
	brcc shift
start:
	rjmp start
