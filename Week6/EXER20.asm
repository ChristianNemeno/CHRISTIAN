;FILENAME EXER20.ASM
;PROGRAMMER NAME : CHRISTIAN A. NEMENO
;DATE 9/20/2024



.MODEL small
.STACK 100h
.DATA

    inputChar1 db ?
    
    InputPrompt DB 'Enter a character: $'

    YesMessage DB 'Yes, you have entered letter A. $',13,10

    NoMessage DB 'No, you have not entered letter A. You have entered character $',13,10

.CODE

ProgramStart:
    mov ax, @data

    mov ds,ax                   ;set DS to point to data segment
    mov dx,OFFSET InputPrompt    ;point to the input prompt 
    mov ah,9                    ;DOS print string
    int 21h                     ;display time prompt

    mov ah,1                    ;DOS get character function
    int 21h                     ;get single character response

    mov inputChar1, al

    cmp al,'A'                  ;typed lowercase 'y' for after noon? 
    jz IsA              ;jz = jump if zero. Yes, you have entered letter A

    jnz notA                ;no, its before noon


IsA:
    mov dx, OFFSET YesMessage  ; point to the afternoon greeting

    jmp mahuman                  ; point to the afternoon greeting

notA: 
    mov dx, OFFSET NoMessage
    
    jmp mahuman

mahuman: 
    mov ah,9                    
    int 21h                     

    mov ah,4Ch                  
    int 21h                     

END ProgramStart
