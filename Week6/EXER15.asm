;FILENAME EXER15.ASM
;PROGRAMMER NAME : CHRISTIAN A. NEMENO
;DATE 9/20/2024

;DESCRIPTION : This assembly language will continuously get
;character input and display back input until Enter key is pressed

.MODEL small
.STACK 200h
.DATA
.CODE

ProgramStart:

    EchoLoop:
        mov ah,1        ; DOS keyboard input function
        int 21h         ; get the next key
        cmp al,13       ; was the key the Enter key?

        jz EchoDone     ; yes, so were dont echoing
        mov dl,al       ; put the characther into DL
        mov ah,2        ; DOS display output function
        int 21h         ; display the character
        jmp EchoLoop    ; echo the next character

    EchoDone:
        mov ah,4Ch      ;DOS terminate program function
        int 21h         ; terminate the program

END ProgramStart

