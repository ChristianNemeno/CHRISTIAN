; TITLE     Add individual digits of a number   ADDIGITS.ASM 
; COMMENT |
;            Objective: To find the sum of individual digits of
;                       a given number. Shows character to binary
;                       conversion of digits.
;                Input: Requests a character from keyboard.
; |             Output: Prints the sum of the individual digits.

; CHRISTIAN A. NEMENO
; PROGRAM 3.8
;Filename: Prog38.asm
;Programmer Name: Christian A. Nemeno
;Program Description: Add individuals digits of a number
;Date created : November 8, 2024


.MODEL SMALL
.STACK 100H
.DATA
number_prompt   DB  'Please type a number (<11 digits): ',0
out_msg         DB  'The sum of individual digits is: ',0
number          DB  11 DUP (?)
header DB 'Filename: Prog38.asm',13,10
	db  'Programmer Name: Christian A. Nemeno',13,10
	db  'Program Description: Add individual digits of a number',13,10
	db  'Date created : November 8, 2024',13,10,10,'$'
.CODE
INCLUDE io.mac
main    PROC
    mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h
        .STARTUP
        PutStr  number_prompt   ; request an input number
        GetStr  number,11       ; read input number as a string
        nwln
        mOv     BX, OFFSET number   ; BX := address of number
        sub     DX,DX           ; DX := 0 -- DL keeps the sum
repeat_add:
        mov     AL, [BX]        ; move the digit to AL
        cmp     AL,0            ; if it is the NULL character
        je      done            ; sum is done
        and     AL, 0FH         ; mask off the upper 4 bits
        add     DL, AL          ; add the digit to sum
        inc     BX              ; increment BX to point to next digit
        jmp     repeat_add      ; and jump back
done:
        PutStr  out_msg
        PutInt  DX              ; write sum
        nwln
main    ENDP
        END main