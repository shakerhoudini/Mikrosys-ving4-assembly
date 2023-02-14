
//init
# include <AVR128DB48def.inc>

//Immediate, last verdien 3 inn i r17 og 5 inn i r18:
ldi r17, 3
ldi r18, 5

//Register Direct. Kopier innholdet i r18 til r0:
mov r0, r18

//I/O Direct. Kopier innholdet i r17 til PORTB:
sts 0x420, r17

//I/O Direct. Kopier innholdet i PORTB til r0:
lds r0, 0x420

//Data Direct. Lagre verdien i r18 til første minneposisjon i SRAM (0x0100 – SRAM_START):
sts 0x0100, r18

//Data Direct. Last verdien i første minneposisjon i SRAM inn i r1:
lds r1, 0x0100

// Data Indirect. Lagre verdien i r18 på adressen til X-pekeren med postinkrement:
st X+, r18

//Data Indirect. Last verdien i minneposisjonen X peker på inn i r16:
ld r16, X

//Lagre r16 på stakken:
push r16

//Last inn verdien 99 i r16:
ldi r16, 99

//Last r16 tilbake fra stakken:
pop r16
