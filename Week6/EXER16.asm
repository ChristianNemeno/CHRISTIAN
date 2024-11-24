;FILENAME EXER16.ASM
;PROGRAMMER NAME : CHRISTIAN A. NEMENO
;DATE 9/20/2024

; DESCRIPTION : This assembly language will continuously get character input and
; and determine if input is 'y' or 'Y' to display good morning mesage
; else display good afternoon message.

.MODEL small
.STACK 100h
.DATA
    TimePrompt DB 'Is it after 12 noon (Y/N) ? $'
    GoodMorningMessage LABEL BYTE
        DB 13,10,'Good morning, world!',13,10,'$'
    GoodAfternoonMessage LABEL BYTE
        DB 13,10,'Good afternoon, world!',13,10,'$'

.CODE

ProgramStart:
    mov ax, @data

    mov ds,ax                   ;set DS to point to data segment
    mov dx,OFFSET TimePrompt    ;point to the time prompt 
    mov ah,9                    ;DOS print string
    int 21h                     ;display time prompt

    mov ah,1                    ;DOS get character function
    int 21h                     ;get single character response

    cmp al,'y'                  ;typed lowercase 'y' for after noon? 
    jz IsAfternoon              ;jz = jump if zero. Yes, its afternoon

    cmp al, 'Y'                 ; typed uppercase 'Y' for afternoon?
    jnz isMorning               ;no, its before noon


IsAfternoon:
    mov dx, OFFSET GoodAfternoonMessage ; point to the afternoon greeting

    jmp DisplayGreeting                 ; point to the afternoon greeting

isMorning:
    mov  dx, OFFSET GoodMorningMessage      ; point to before noon greeting

DisplayGreeting: 
    mov ah,9                    ; DOS print string function
    int 21h                     ; display the greeting 

    mov ah,4Ch                  ; DOS terminate program function 
    int 21h                     ; terminate program

END ProgramStart
