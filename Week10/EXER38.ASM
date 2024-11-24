; Filename: EXER38.ASM
; Programmer Name: CHRISTIAN A. NEMENO
; Date: October 18, 2024
; Description: Create a program that inputs a number. Display the following messages depending on the value of the number entered

.model small
.stack 100h
.data
    prompt      db 'Enter a number: $'
    msgEqual    db 13, 10,'The number is equal to 5.$'
    msgLess     db 13, 10,'The number is less than 5.$'
    msgGreater  db 13, 10,'The number is greater than 5.$'
    num    db ?

.code
main:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov dx, offset prompt
    mov ah, 09h
    int 21h

    ; Read a number from the keyboard
    mov ah, 01h
    int 21h           ; Read a character
    sub al, '0'       ; Convert ASCII to integer
    mov num, al  ; Store the number

    ; Compare the number with 5
    cmp num, 5
    je isEqual        ; Jump if equal to 5
    jl isLess         ; Jump if less than 5

isGreater:
    ; Display "The number is greater than 5."
    mov dx, offset msgGreater
    mov ah, 09h
    int 21h
    jmp endProgram

isEqual:
    ; Display "The number is equal to 5."
    mov dx, offset msgEqual
    mov ah, 09h
    int 21h
    jmp endProgram

isLess:
    ; Display "The number is less than 5."
    mov dx, offset msgLess
    mov ah, 09h
    int 21h

endProgram:
    ; Exit the program
    mov ax, 4C00h
    int 21h
end main
