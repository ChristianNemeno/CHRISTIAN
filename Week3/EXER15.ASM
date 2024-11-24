; Filename: EXER15.ASM
; Programmer Name: Christian A. Nemeno
; Date: 20/09/2024
; Description: This assembly language program will continuously get 
; character input and display back input until Enter key is pressed.
.MODEL small
.STACK 200h
.DATA
header DB ' Filename: Exer15.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Continuously get character input and display bac until enter key is pressed ',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
.CODE
ProgramStart:
mov ax, @data
 mov ds, ax

lea dx , header
	mov ah,9
	int 21h

 EchoLoop:
 mov ah,1 ; DOS keyboard input function
 int 21h ; get the next key
 cmp al,13 ; was the key the Enter key?
 jz EchoDone ; yes, so we're done echoing
 mov dl,al ; put the character into DL
 mov ah,2 ; DOS display output function
 int 21h ; display the character
 jmp EchoLoop ; echo the next character
 EchoDone:
 mov ah,4ch ; DOS terminate program function
 int 21h ; terminate the program
END ProgramStart