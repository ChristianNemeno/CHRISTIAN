; Filename: PREFINAL.ASM
; CS243 Lab Hands-on Pre-final Exam
; First Semester SY 2024 - 2025
; Student Name: 
; Date Finished: 11/14/2024

.MODEL SMALL
.STACK 100H
.DATA
    header      DB '  Cebu Institute of Technology - University', 13, 10
               DB '  Automatic Teller Machine', 13, 10
               DB '  Programmer: Name', 13, 10
               DB '  Copyright 2024', 13, 10, '$'
    menuText   DB 13, 10, '  Main Menu', 13, 10
               DB '  1. Balance Inquiry', 13, 10
               DB '  2. Deposit', 13, 10
               DB '  3. Withdrawal', 13, 10
               DB '  4. Exit', 13, 10, 'Enter your choice: $'
    errorMsg   DB 27, '[5;41;33m', 0AH, 0DH, 'ERROR! Invalid choice!', 27, '[0m', 0AH, 0DH, '$'
    errorMsg2   DB 27, '[5;41;33m', 0AH, 0DH, 'ERROR! Insufficient Balance', 27, '[0m', 0AH, 0DH, '$'
    depositMsg DB 13, 10, '  Enter deposit amount: P$'
    withdrawMsg DB 13, 10, '    Enter withdrawal amount: P$'
    balanceMsg DB 13, 10, '  Your current balance: $'
    balance    DB 0               
    inputChoice DB 60             
               DB ?               
               DB 60 DUP(0)   
 
.CODE
MAIN PROC
 
    mov ax, 3
    int 10h
   
    mov ah, 06h     
    mov al, 0       
    mov ch, 0      
    mov cl, 0       
    mov dh, 3       
    mov dl, 79      
    mov bh, 06Fh    
    int 10h 
    
    mov ah, 06h     
    mov al, 0       
    mov ch, 5       
    mov cl, 0       
    mov dh, 9       
    mov dl, 79      ; Column end 
    mov bh, 03Fh    ; Attribute for blank space
    int 10h 
 
    MOV AX, @DATA
    MOV DS, AX
 
START:
    ; Display Title
    MOV DX, OFFSET header
    CALL PrintString
 
MAIN_MENU:

    MOV DX, OFFSET menuText
    CALL PrintString
 
    LEA DX, inputChoice        ; Load address of inputChoice
    CALL GetString             ; Get user input into inputChoice buffer
    MOV AL, inputChoice+2      ; Move first character of inputChoice (after length byte) into AL
    SUB AL, '0'                ; Convert ASCII to integer
    MOV BL, AL                 ; Store choice in BL
 
    CMP BL, 1
    JB INVALID_CHOICE          ; If choice < 1, invalid
    CMP BL, 4
    JA INVALID_CHOICE          ; If choice > 4, invalid
 
    ; Process Choice
    CMP BL, 1
    JE BALANCE_INQUIRY
    CMP BL, 2
    JE DEPOSIT
    CMP BL, 3
    JE WITHDRAWAL
    CMP BL, 4
    JE EXIT_PROGRAM
 
INVALID_CHOICE:
    ;Blinking Text
    MOV AH, 09H
    MOV DX, OFFSET errorMsg
    INT 21H                    ; error message
    JMP MAIN_MENU              ;back to main menu
 
BALANCE_INQUIRY:
    ; Display Current Balance
    MOV DX, OFFSET balanceMsg
    CALL PrintString
    CALL PrintBalance
    JMP MAIN_MENU
 
DEPOSIT:
    ; Prompt for Deposit
    MOV DX, OFFSET depositMsg
    CALL PrintString
    CALL GetString
    CALL ConvertInputToNumber  ; Convert inputChoice to a number in AL
    ADD balance, AL            ; Add deposit amount to balance
    JMP MAIN_MENU
 
WITHDRAWAL:
    ; Prompt for Withdrawal
    MOV DX, OFFSET withdrawMsg
    CALL PrintString
    CALL GetString
    CALL ConvertInputToNumber  ; Convert inputChoice to a number in AL
    CMP AL, balance
    JA INSUFFICIENT_FUNDS      ; Check if balance is sufficient
    SUB balance, AL            ; Deduct withdrawal amount from balance
    JMP MAIN_MENU
 
INSUFFICIENT_FUNDS:
    ; Handle Insufficient Funds
    MOV DX, OFFSET errorMsg2
    CALL PrintString           ; Reuse error message
    JMP MAIN_MENU
 
EXIT_PROGRAM:
    MOV AH, 4CH                ; Exit program
    INT 21H
 
; Subroutine to print a string
PrintString PROC
    MOV AH, 09H
    INT 21H
    RET
PrintString ENDP
 
; Subroutine to get a string input and store it in a buffer
GetString PROC
    MOV AH, 0AH                ; DOS input function
    INT 21H
    RET
GetString ENDP
 
; Subroutine to convert ASCII input in inputChoice to an integer in AL
ConvertInputToNumber PROC
    MOV AL, inputChoice+2      ; First character of the input
    SUB AL, '0'                ; Convert ASCII to integer
    RET
ConvertInputToNumber ENDP
 
; Subroutine to print the current balance
PrintBalance PROC
    MOV AL, balance
    ADD AL, '0'                ; Convert integer to ASCII for display
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    RET
PrintBalance ENDP
 
END MAIN