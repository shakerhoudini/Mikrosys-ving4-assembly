//Oppgave 2 

#include <AVR128DB48def.inc>

	; 127 + 129
ldi r16, 127
ldi r17, 129
add r16, r17  ; Satt SREG-flagget C, fordi summen er større enn 8-biters verdiområdet

; 80 + 48
ldi r18, 80
ldi r19, 48
add r18, r19  ; Ingen flagg ble satt i SREG, fordi summen er mindre enn 8-biters verdiområdet

; 128 + 40
ldi r20, 128
ldi r21, 40
add r20, r21  ; Satt SREG-flagget V, fordi summen overstiger 8-biters verdiområdet

; 254 + 255
ldi r22, 254
ldi r23, 255
add r22, r23  ; Satt SREG-flaggene C og V, fordi summen overstiger 8-biters verdiområdet
