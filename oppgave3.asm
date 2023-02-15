//Oppg 3

ldi r17, 0b00001000		; bitmask for led

sts 0x420, r17			; set led as output
ldi r17, 0				; turn led off on out register
sts 0x424, r17			; 0x424 - PORTB.OUT register 

ldi r17, 0b00000100		; bitmask for button

sts 0x422, r17			; set button as input by setting dirclr to high at pos 3
push r17				; push bitmask to stack

ldi r17,0b00001000		; load bitmask for pulluppen
sts 0x432, r17			; enable pulluppen via register

pop r17					; return r17 as button bitmask from stack

//loop
start:
    inc r16				; increment r16, (clock i guess?)


	lds r15, 0x428		; load state PORTB.IN from memory

	and r15,r17			; do r15 &= r17;

	cp r15, r17			; compare r15 with r17
	brne switch			; if not equal go to switch statement

    rjmp start			; jump to start
nop

switch:
	push r17			; push button bitmask on stack

	ldi r17, 0b00001000 ; load ledmask
	sts 0x427,r17		; set pin 2 high on out toggle pin by loading
						; bitmaks to outtgl to memory

	pop r17				; load back button bitmask from stack

	rjmp delayLoop		; enter delayLoop
nop

delayLoop:
    ldi r18, 250
inner_loop1:
    ldi r19, 100
inner_loop2:
    ldi r20, 40
inner_loop3:
    dec r20
    brne inner_loop3
    dec r19
    brne inner_loop2
    dec r18
    brne inner_loop1

    rjmp start			; go back to start, normal program
nop
