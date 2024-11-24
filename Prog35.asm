; Program 3.5 Conversion to hexadecimal by character manipulation

;TITLE Hex equivalent of characters HEX1CHAR.ASM
;COMMENT |
;        Objective: To print the hex equivalent of ASCII character code.
;        Input: Requests a character from keyboard.
;        Output: Prints the ASCII code of the input character in hex. 

; CHRISTIAN A NEMENO
; PROGRAM 3.5
;Filename: Prog35.asm
;Programmer Name: Christian A. Nemeno
;Program Description: Conversion to hexadecimal by character manipulation
;Date created : November 8, 2024

.MODEL SMALL
.STACK 100H
 
.DATA
char_prompt DB 'Please input a character: ', 0
out_msg1    DB 'The ASCII code of "', 0
out_msg2    DB '" in hex is ', 0
query_msg   DB 'Do you want to quit (Y/N): ', 0

header DB 'Filename: Prog35.asm',13,10
	db  'Programmer Name: Christian A. Nemeno',13,10
	db  'Program Description: Conversion to hexadecimal by character manipulation',13,10
	db  'Date created : November 8, 2024',13,10,10,'$'
.CODE
.486
INCLUDE io.mac
 
main PROC
    mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h
    .STARTUP
 
read_char:
    PutStr char_prompt
    GetCh AL            ; Get character input from the user
    nwln
    PutStr out_msg1
    PutCh AL            ; Print the character itself
    PutStr out_msg2
 
    ; Print the ASCII code in hexadecimal
    mov AH, AL          ; Copy AL to AH to preserve the original character
    shr AL, 4           ; Shift AL to get the upper nibble (4 bits)
    mov CX, 2
print_upper_nibble:
    cmp AL, 9
    jg A_to_F
    add AL, '0'         ; Convert to ASCII
    jmp skip
A_to_F:
    add AL, 'A' - 10    ; Convert to ASCII (for hex values A-F)
skip:
    PutCh AL            ; Print the upper nibble
    mov AL, AH          ; Move the original byte back into AL
    and AL, 0FH         ; Mask the upper nibble
    ; Print the lower nibble (remaining 4 bits)
    cmp AL, 9
    jg A_to_F2
    add AL, '0'
    jmp skip2
A_to_F2:
    add AL, 'A' - 10
skip2:
    PutCh AL            ; Print the lower nibble
    nwln
 
    ; Ask if the user wants to quit
    PutStr query_msg
    GetCh AL            ; Get input for quit confirmation
    nwln
    cmp AL, 'Y'         ; Check if the user pressed 'Y'
    jne read_char       ; If not 'Y', loop and ask again
 
done:
    ret
main ENDP
 
END main