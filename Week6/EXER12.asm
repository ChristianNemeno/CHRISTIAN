;FILENAME EXER12.ASM
;PROGRAMMER NAME : CHRISTIAN A. NEMENO
;DATE 9/20/2024

;DESCRIPTION: THIS ASSEMBLY LANGUAGE PROGRAM WILL DISPLAY MULTIPLE STRING VARIABLES ON A SINGLE LINE

.MODEL small
.STACK 200h

.DATA
String1 DB 'Line1','$' ;DB = define byte String1 variable and assign assign 'Line1' value
String2 DB 'Line2', '$'
String3 DB 'Line3', '$'

.CODE

ProgramStart:
    mov ax, @data
    mov ds,ax
    mov ah,9                ;DOS print string function
    mov dx, OFFSET String1  ;1st string to print
    int 21h                 ;invoke DOS to print string

    mov dx, OFFSET String2  ;2nd string to print
    int 21h

    mov dx, OFFSET String3  ;3rd string to print 
    int 21h                 ;invoke DOS to print string

    mov ah,4Ch              ;DOS terminate program function
    int 21h                 ;invoke DOS to end program

END ProgramStart