; Filename: EXER37.ASM
; Programmer Name: CHRISTIAN A. NEMENO
; Date: October 18, 2024
; Description: Create a program that inputs a character. If the character 
; is the capital letter A, display message “You entered A.”, 
; else display “You entered not A.”


.model small
.stack 100h
.data
    prompt      db      'Enter a character: $'
    msgA        db      13, 10,'You entered A.$'
    msgNotA     db      13, 10,'You entered not A.$'
    inputChar   db ?

.code
main:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov dx, offset prompt
    mov ah, 09h
    int 21h

    ; Read a character from the keyboard
    mov ah, 01h
    int 21h
    mov inputChar, al  ; Store the character in inputChar

    ; Compare the character with 'A'
    cmp inputChar, 'A'
    je isA             ; If equal, jump to isA

notA:
    ; Display "You entered not A."
    mov dx, offset msgNotA
    mov ah, 09h
    int 21h
    jmp endProgram

isA:
    ; Display "You entered A."
    mov dx, offset msgA
    mov ah, 09h
    int 21h

endProgram:
    ; Exit the program
    mov ax, 4C00h
    int 21h
end main
