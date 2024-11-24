; Filename: EXER19.ASM
; Programmer Name: Christian A. Nemeno
; Date Today: September 20, 2024
; Description: This assembly language program will ask the user to input 3 characters then
; display each character on its own line.

.MODEL small
.STACK 200h
.DATA
inputChar1 db ?
inputChar2 db ?
inputChar3 db ?
    inputMsg1 db 'Enter first character: $', 0Ah, '$'
    inputMsg2 db 'Enter second character: $', 0Ah, '$'
    inputMsg3 db 'Enter third character: $', 0Ah, '$'
    outputMsg1 db 'The first character is $'
    outputMsg2 db 'The second character is $'
    outputMsg3 db 'The third character is $'
.CODE
Main: 
    mov ax, @data
    mov ds, ax

    mov dx, OFFSET inputMsg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    mov inputChar1, al

    mov ah,02h
    mov cl, 0Ah ; NEW LINE
    mov dl, cl
    int 21h

    mov dx, OFFSET inputMsg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    mov inputChar2, al

    mov ah,02h
    mov cl, 0Ah ; NEW LINE
    mov dl, cl
    int 21h

    mov dx, offset inputMsg3
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    mov inputChar3, al

    mov ah,02h
    mov cl, 0Ah ; NEW LINE
    mov dl, cl
    int 21h

    mov dx,offset outputMsg1
    mov ah, 09h
    int 21h
    
    mov dl, inputChar1
    mov ah,02h
    int 21h
    mov ah,02h
    mov dl,2eh
    int 21h

    mov ah,02h
    mov cl, 0Ah ; NEW LINE
    mov dl, cl
    int 21h

    mov dx,offset outputMsg2
    mov ah, 09h
    int 21h
    
    mov dl, inputChar2
    mov ah,02h
    int 21h
    mov ah,02h
    mov dl,2eh
    int 21h

    mov ah,02h
    mov cl, 0Ah ; NEW LINE
    mov dl, cl
    int 21h

    mov dx,offset outputMsg3
    mov ah, 09h
    int 21h
    
    mov dl, inputChar3
    mov ah,02h
    int 21h

    mov ah,02h
    mov dl,2eh
    int 21h

    mov ax,4C00h
    int 21h
END Main