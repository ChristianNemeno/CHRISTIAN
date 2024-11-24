; Filename: EXER14.ASM
; Programmer Name: Christian A. Nemeno
; Date: 20/09/2024
; Description: This assembly language program will get character input and 
; display back character input.
.MODEL small
.STACK 200h
.DATA
 inputChar db ? ; variable to store the input character
 inputMsg db 'Enter a character: $'
 outputMsg db 'You entered: $'

header DB ' Filename: Exer14.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: GET CHAR INPUT AND DISPLAY BACK INPUT ',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'

.CODE
Main:
 ; initialize the data segment
 mov ax, @data
 mov ds, ax

lea dx , header
	mov ah,9
	int 21h

 ; display the input prompt message
 mov dx,offset inputMsg
 mov ah,09h
 int 21h
 ; read a character from the keyboard
 mov ah,01h ; function to read a character
 int 21h ; call DOS interrupt
 mov inputChar,al ; store the character in inputChar
 ; display the output message
 mov dx,offset outputMsg
 mov ah,09h
 int 21h
 ; display the character back
 mov dl, inputChar ; load the character to DL
 mov ah,02h ; function to display a character
 int 21h ; call DOS interrupt
 ; exit program
 mov ax,4C00h ; function to exit program
 int 21h
END Main