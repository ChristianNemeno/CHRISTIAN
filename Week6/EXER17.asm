;FILENAME EXER17.ASM
;PROGRAMMER NAME : CHRISTIAN A. NEMENO
;DATE 9/20/2024

; Description: This assembly language program will get string input and 
; display back string/

.MODEL small
.STACK 100h
.DATA
MAXIMUM_STRING_LENGTH EQU 1000
StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
InputPrompt DB 'Enter text: $'


.CODE 
ProgramStart:

    mov ax,@data
    mov ds,ax           ;set DS to point to the data segment

    mov dx, OFFSET InputPrompt
    mov ah,9
    int 21h

    mov ah,3fh          ; DOS read from handle function
    mov bx,0            ; standard input handle
    mov cx, MAXIMUM_STRING_LENGTH ; read up to maximum numer of characters

    mov dx,OFFSET StringInput   ; store the string here
    int 21h                     ; get the string

    and ax,ax                   ;were any character read?
    jz Done                     ;no, so youre done 
    mov cx,ax                   ;you can use it as a counter

    push cx                     ;save the string length
    mov bx, OFFSET StringInput

    pop cx                     ;get back the string length
    mov ah,40h                  ;DOS write form handle function
    mov bx,1                    ;standard output handle
    mov dx , OFFSET StringInput ;prepare to print the string
    int 21h                     ; print the string

Done: 
    mov ah,4ch                  ; DOS terminate program function
    int 21h                     ; terminate the program

END ProgramStart

