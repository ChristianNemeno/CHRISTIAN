;TITLE uppercase conversion of characters TOUPPER. ASM
;COMMENT |
;    Objective: To convert lowercase letters to 
;   corresponding uppercase letters. 
;    Input: Requests a character string from keyboard. 
;| Output: Prints the input string in uppercase. 

; CHRISTIAN A NEMENO
; PROGRAM 3.7
;Filename: Prog37.asm
;Programmer Name: Christian A. Nemeno
;Program Description: convert lowercase letters to uppercase
;Date created : November 8, 2024


MODEL SMALL 
.STACK 100H 
.DATA 

name_prompt DB 'Please type your name: ',0 
out_msg DB 'Your name in capitals is: ',0 
in_name DB 31 DUP (?)

header DB 'Filename: Prog37.asm',13,10
	db  'Programmer Name: Christian A. Nemeno',13,10
	db  'Program Description: uppercase conversion of characters TOUPPER. ASM',13,10
	db  'Date created : November 8, 2024',13,10,10,'$'
.CODE
INCLUDE IO.MAC
main PROC
    mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h
    .STARTUP
    PutStr  name_prompt ; request character string 
    GetStr  in_name,31  ; read input character string 
    nwln
    PutStr  out_msg
    mov     BX,OFFSET in_name ; BX := address of in_name
process_char:
    mov     AL, [BX]    ; move the char. to AL 
    cmp     AL,0        ; if it is the NULL character
    je      done        ; conversion done 
    cmp     AL,'a'      ; if (char < 'a') 
    jl      not_lower_case ; not a lowercase letter
    cmp     AL,'z'         ;if (char > 'z') 
    jg      not_lower_case ;not a lowercase letter 
lower_case:
    add     AL,'A'-'a' ; convert to uppercase
not_lower_case:
    PutCh   AL ; write the character
    inc     BX ; BX points to next char.
    jmp     process_char ; go back to process next char. 
    
done:
    nwln
main ENDP
     END main

