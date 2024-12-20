;FILENAME: EXAM4.ASM
;CS243 Lab Hands-on Exam No. 4
;First Semester SY 2024-2025
;Student Name: Christian A. Nemeño
;DATE: 10/25/2024

.model small
.stack 200h
 
.data
 
header DB ' Filename: EXAM4.asm',13,10
            db  ' Programmer Name: CHRISTIAN A NEMEÑO',13,10
            db  ' Program Description: Calculator ',13,10
            db  ' Date created : DATE: 10/25/2024',13,10,10,'$'
inputnum1 db ?
inputnum2 db ?
head DB 13,10,'THE CALCULATOR',13,10,'Created by: CHRISTIAN A. NEMEÑO',13,10,'DATE: 10/25/2024',13,10,'$'
head1 DB 13,10,'Main Menu',13,10,'$'
 
choice1 DB 'a - Addition',13,10,'$'
choice2 DB 's - Subtraction',13,10,'$'
choice3 DB 'm - Multiplication',13,10,'$'
choice4 DB 'd - Division',13,10,'$'
choice5 DB 'e - Exit',13,10,'$'
 
choice DB 'Enter your choice: $'
 
add1 DB 'Addition',13,10,'$'
add2 DB 'Enter first addend: $'
add3 DB 13,10,'Enter second addend: $'
add4 DB 13,10,'First addend is: $'
add5 DB 13,10,'Second addend is: $'
 
sub1 DB 'Subtraction',13,10,'$'
sub2 DB 'Enter minuend: $'
sub3 DB 13,10,'Enter subtrahend: $'
sub4 DB 13,10,'Minuend is: $'
sub5 DB 13,10,'Subtrahend is: $'
 
mul1 DB 'Multiplication',13,10,'$'
mul2 DB 'Enter multiplicand: $'
mul3 DB 13,10,'Enter multiplier: $'
mul4 DB 13,10,'Multiplicand is: $'
mul5 DB 13,10,'Multiplier is: $'
 
div1 DB 'Division',13,10,'$'
div2 DB 'Enter dividend: $'
div3 DB 13,10,'Enter divisor: $'
div4 DB 13,10,'Dividend is: $'
div5 DB 13,10,'Divisor is: $'
 
term DB 'Exit Program$'
 
inv DB 'INVALID CHOICE!','$'
 
continuePrompt db 13,10,13,10,'Enter to continue...', '$'
 
bye DB 13,10,'Thank you.','$'
 
nxt DB 0dh, 0ah, '$'
 
in1 dw ?
in2 dw ?
 
in3 db 20 DUP ('$')
in4 db 20 DUP ('$')
 
su dw ?
dff dw ?
mu dw ?
dv dw ?
 
suma db 20 DUP ('$')
difa db 20 DUP ('$')
mula db 20 DUP ('$')
diva db 20 DUP ('$')
 
sum db 13,10,'Sum: $'
diff db 13,10,'Difference: $'
mult db 13,10,'Product: $'
divi db 13,10,'Quotient: $'
 
.CODE
 
itoa:
    push ax
    push bx
    push cx
    push dx
 
    mov cx, 0
    mov bx, 10
 
loop1:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne loop1
 
loop2:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    dec cx
    cmp cx, 0
    jne loop2
 
    pop dx
    pop cx
    pop bx
    pop ax
    ret
 
clearScreen:
    mov ah, 00h
    mov al, 03h
    int 10h      
    ret
printString:
    mov ah, 09h
    mov bl, 07h
    int 21h
    ret
 
nxln:
    lea dx, nxt
    MOV ah, 09h
    INT 21h
    RET
getChar:
    mov ah,01h
    int 21h
    ret
getNum:
    mov ah,01h  
    int 21h
    sub al, '0'
    mov ah,0  
    RET
 
displayNum:
   
    int 21h
    RET
   
; ... (previous code remains the same until InAdd procedure)
InAdd:
    mov ah,09h
    mov bl,20h
    mov cx,8
    int 10h
 
    LEA dx, add1
    CALL printString
 
    lea dx, add2
    CALL printString
   
    call getNum
    mov in1, ax
   
    lea dx, add3
    CALL printString
 
    CALL getNum
    mov in2,ax
 
    mov dx, in1
    add dx, in2
    mov su, dx
 
    ; New line before showing equation
    lea dx, nxt    ; This uses the existing newline variable
    mov ah, 09h
    int 21h
 
    mov ax, in1    ; Display first number
    call itoa
 
    mov dl, ' '    ; Space before plus
    mov ah, 02h
    int 21h
 
    mov dl, '+'    ; Display plus sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after plus
    mov ah, 02h
    int 21h
 
    mov ax, in2    ; Display second number
    call itoa
 
    mov dl, ' '    ; Space before equals
    mov ah, 02h
    int 21h
 
    mov dl, '='    ; Display equals sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after equals
    mov ah, 02h
    int 21h
 
    mov ax, su     ; Display result
    call itoa
 
    ; Continue with the prompt
    lea dx, continuePrompt
    mov ah, 09h
    int 21h      
 
    CALL getChar  
    CALL clearScreen  
 
    jmp loop_start
 
 InSub:
    mov ah,09h
    mov bl,30h
    mov cx,11
    int 10h
   
    lea dx, sub1
    CALL printString
   
    lea dx, sub2  
    CALL printString
   
    CALL getNum
    mov in1, ax
   
    lea dx, sub3
    CALL printString
 
    CALL getNum
    mov in2,ax
 
    mov dx, in1
    sub dx, in2
    mov dff, dx
 
    ; New line before showing equation
    lea dx, nxt
    mov ah, 09h
    int 21h
 
    mov ax, in1    ; Display first number
    call itoa
 
    mov dl, ' '    ; Space before minus
    mov ah, 02h
    int 21h
 
    mov dl, '-'    ; Display minus sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after minus
    mov ah, 02h
    int 21h
 
    mov ax, in2    ; Display second number
    call itoa
 
    mov dl, ' '    ; Space before equals
    mov ah, 02h
    int 21h
 
    mov dl, '='    ; Display equals sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after equals
    mov ah, 02h
    int 21h
 
    mov ax, dff    ; Display result
    call itoa
 
    lea dx, continuePrompt
    mov ah, 09h
    int 21h      
   
    CALL getChar  
    CALL clearScreen
   
    jmp loop_start
 
multiply:
    mov ah,09h
    mov bl,40h
    mov cx,14
    int 10h
 
    mov dx, OFFSET mul1
    call printString
 
    mov dx, OFFSET mul2
    call printString
 
    call getNum
    mov in1, ax
 
    mov dx, OFFSET mul3
    call printString
 
    call getNum
    mov in2, ax
 
    mov ax, in1
    mov dx, in2
    mul dx
    mov mu, ax
 
    ; New line before showing equation
    lea dx, nxt
    mov ah, 09h
    int 21h
 
    mov ax, in1    ; Display first number
    call itoa
 
    mov dl, ' '    ; Space before multiply
    mov ah, 02h
    int 21h
 
    mov dl, 'x'    ; Display multiplication sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after multiply
    mov ah, 02h
    int 21h
 
    mov ax, in2    ; Display second number
    call itoa
 
    mov dl, ' '    ; Space before equals
    mov ah, 02h
    int 21h
 
    mov dl, '='    ; Display equals sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after equals
    mov ah, 02h
    int 21h
 
    mov ax, mu     ; Display result
    call itoa
 
    lea dx, continuePrompt
    mov ah, 09h
    int 21h      
   
    CALL getChar  
    CALL clearScreen
 
    jmp loop_start
ProgramStart:
    mov ax, @data
    mov ds, ax
 
    lea dx , header
    mov ah,9
    int 21h
 
loop_start:
    CALL clearScreen
 
    LEA dx,  head
    CALL printString
   
    LEA dx,  head1
    CALL printString
 
    mov ah,09h
    mov bl,20h  
    mov cx,12  
    int 10h
 
    LEA dx, choice1
    CALL printString
 
    mov ah,09h
    mov bl,30h  
    mov cx,15
    int 10h
 
    LEA dx,  choice2
    CALL printString
   
    mov ah,09h
    mov bl,40h
    mov cx,18
    int 10h
 
    LEA dx,  choice3
    CALL printString
   
    mov ah,09h
    mov bl,50h
    mov cx,12
    int 10h
   
    LEA dx,  choice4
    CALL printString
   
    mov ah,09h
    mov bl,70h
    mov cx,8
    int 10h
   
    LEA dx, choice5
    CALL PrintString
   
    LEA dx, choice
    CALL printString
   
    CALL getChar
 
    ; DECISION
    cmp al,'a'  
    je Addition
    cmp al,'s'
    je Subtraction
    cmp al,'m'
    je Multiplication
    cmp al,'d'
    je Division
    cmp al,'e'
    je Exit
    jne InvalidInput
 
InvalidInput:
    CALL nxln
    CALL nxln
   
    mov ah,09h
    mov bl,11001110B
    mov cx,15
    int 10h
   
    LEA dx, inv
 
    CALL printString
    CALL stop
 
Exit:
    CALL nxln
    CALL nxln
 
    mov ah,09h
    mov bl,70h
    mov cx,12
    int 10h
   
    LEA dx, term
    CALL printString
    CALL stop
 
Addition:
    CALL nxln
    CALL nxln
    jmp InAdd
   
 
Subtraction:
    CALL nxln
    CALL nxln
    jmp InSub
 
Multiplication:
    call nxln
    call nxln
    jmp multiply
 
Division:
    CALL nxln
    CALL nxln
 
    mov ah,09h
    mov bl,50h
    mov cx,8
    int 10h
 
    LEA dx, div1
    CALL printString
   
    LEA dx, div2
    CALL printString
   
    CALL getNum
    mov in1, ax
   
    LEA dx, div3
    CALL printString
 
    CALL getNum
    mov in2, ax
 
    mov ax, in1
    xor dx, dx
    mov bx, in2
    div bx
    mov dv, ax
   
    ; New line before showing equation
    lea dx, nxt
    mov ah, 09h
    int 21h
 
    mov ax, in1    ; Display first number
    call itoa
 
    mov dl, ' '    ; Space before divide
    mov ah, 02h
    int 21h
 
    mov dl, '/'    ; Display division sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after divide
    mov ah, 02h
    int 21h
 
    mov ax, in2    ; Display second number
    call itoa
 
    mov dl, ' '    ; Space before equals
    mov ah, 02h
    int 21h
 
    mov dl, '='    ; Display equals sign
    mov ah, 02h
    int 21h
 
    mov dl, ' '    ; Space after equals
    mov ah, 02h
    int 21h
 
    mov ax, dv     ; Display result
    call itoa
 
    lea dx, continuePrompt
    mov ah, 09h
    int 21h      
   
    CALL getChar  
    CALL clearScreen
 
    jmp loop_start
 
 
stop:
    CALL nxln
    LEA dx,  bye
    CALL printString
   
    mov ax,4C00h  
    int 21h
END ProgramStart
 