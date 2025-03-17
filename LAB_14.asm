.INCLUDE "M32DEF.INC"
 LDI R20,HIGH(RAMEND);initialize stack pointer
 OUT SPH,R20
 LDI R20,LOW(RAMEND)
 OUT SPL,R20
 LDI R20,0xFF ;Port B as output
 OUT DDRa,R20
 LDI R20,0x06 ;load step sequence
 L1: OUT PORTa,R20 ;PORTB = R20
 LSR R20 ;shift right
 BRCC L2 ;if not carry skip next
 ORI R20,0x8
 L2: RCALL DELAY ;wait
 RJMP L1

; Delay subroutine
delay:
    ; Nested loops to create a time delay
    LDI R17, 255       ; Outer loop counter
D1:
    LDI R18, 20    ; Middle loop counter
D2:
    LDI R19, 1       ; Inner loop counter
D3:
    NOP                ; No operation (do nothing, just wait)
    NOP                ; Additional NOPs for longer delay
    NOP
    NOP
    NOP
    NOP
    DEC R19            ; Decrement inner loop counter
    BRNE D3            ; Branch to D3 if R19 is not zero
    DEC R18            ; Decrement middle loop counter
    BRNE D2            ; Branch to D2 if R18 is not zero
    DEC R17            ; Decrement outer loop counter
    BRNE D1            ; Branch to D1 if R17 is not zero
    RET
