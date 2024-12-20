;FILENAME EXER12.ASM
;PROGRAMMER NAME : CHRISTIAN A. NEMENO
;DATE 9/20/2024

;DESCRIPTION: THIS ASSEMBLY LANGUAGE PROGRAM WILL 
;Display multiple string variables on separate lines

.MODEL small
.STACK 200h

.DATA 
String1 DB 'Line1', 0dh,0ah,'$'
String2 DB 'Line2',0dh,0ah, '$'
String3 DB 'Line3',0dh,0ah, '$'
;carriage return (ASCII code 0Dh) positions the cursor to the left side of the
;current line of characters

;line feed (ASCII 0Ah) moves the cursor down one line on the output device

.CODE

ProgramStart:
    mov ax,@data
    mov ds,ax 
    mov ah,9                  ; DOS print string function
    mov dx,OFFSET String1     ; 1st string to print
    int 21h                   ; invoke DOS to print string

    mov dx,OFFSET String2     ; 2nd string to print
    int 21h                   ; invoke DOS to print string 

    mov dx,OFFSET String3     ; 3rd string to print
    int 21h                   ; invoke DOS to print string 

    mov ah, 4Ch               ; DOS terminate program function
    int 21h                   ; invoke DOS to end program 

END ProgramStart
