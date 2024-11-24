.MODEL SMALL
.STACK 100H
.DATA
    header      DB '  Cebu Institute of Technology - University', 13, 10
               DB '  Automatic Teller Machine', 13, 10
               DB '  Programmer: VENICE JONAH D. JUAREZ', 13, 10
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
    balanceMsg DB 13, 10, '  Your current balance: P$'
    pesoSign   DB 'P$'
    newLine    DB 13, 10, '$'
    buffer    DB 6
              DB ?
              DB 6 DUP(0)
    balance    DW 0               ; Changed to word (16-bit) to handle larger amounts
    ten       DW 10              ; Constant for multiplication
    inputChoice DB 60             
               DB ?               
               DB 60 DUP(0)
 
.CODE
MAIN PROC
    ; Initialize
    MOV AX, @DATA
    MOV DS, AX
 
    ; Clear screen and set colors
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
    mov dl, 79      
    mov bh, 03Fh    
    int 10h 
 
START:
    MOV DX, OFFSET header
    CALL PrintString
 
MAIN_MENU:
    MOV DX, OFFSET menuText
    CALL PrintString
 
    LEA DX, inputChoice
    CALL GetString
    MOV AL, inputChoice+2
    SUB AL, '0'
    MOV BL, AL
 
    CMP BL, 1
    JB INVALID_CHOICE
    CMP BL, 4
    JA INVALID_CHOICE
 
    CMP BL, 1
    JE BALANCE_INQUIRY
    CMP BL, 2
    JE DEPOSIT
    CMP BL, 3
    JE WITHDRAWAL
    CMP BL, 4
    JE EXIT_PROGRAM
 
INVALID_CHOICE:
    MOV DX, OFFSET errorMsg
    CALL PrintString
    JMP MAIN_MENU
 
BALANCE_INQUIRY:
    MOV DX, OFFSET balanceMsg
    CALL PrintString
    MOV AX, balance
    CALL DisplayNumber
    MOV DX, OFFSET newLine
    CALL PrintString
    JMP MAIN_MENU
 
DEPOSIT:
    MOV DX, OFFSET depositMsg
    CALL PrintString
    
    ; Get deposit amount
    LEA DX, buffer
    CALL GetString
    
    ; Convert string to number
    CALL StringToNumber
    
    ; Add to balance
    ADD balance, BX
    
    MOV DX, OFFSET newLine
    CALL PrintString
    JMP MAIN_MENU
 
WITHDRAWAL:
    MOV DX, OFFSET withdrawMsg
    CALL PrintString
    
    ; Get withdrawal amount
    LEA DX, buffer
    CALL GetString
    
    ; Convert string to number
    CALL StringToNumber
    
    ; Check if enough balance
    CMP BX, balance
    JA INSUFFICIENT_FUNDS
    
    ; Subtract from balance
    SUB balance, BX
    
    MOV DX, OFFSET newLine
    CALL PrintString
    JMP MAIN_MENU
 
INSUFFICIENT_FUNDS:
    MOV DX, OFFSET errorMsg2
    CALL PrintString
    JMP MAIN_MENU
 
EXIT_PROGRAM:
    MOV AH, 4CH
    INT 21H

; Subroutines
PrintString PROC
    MOV AH, 09H
    INT 21H
    RET
PrintString ENDP
 
GetString PROC
    MOV AH, 0AH
    INT 21H
    RET
GetString ENDP

; Convert string to number
StringToNumber PROC
    PUSH AX
    PUSH CX
    PUSH DX
    PUSH SI
    
    XOR BX, BX          ; Clear BX for result
    MOV CL, buffer+1    ; Get length of input
    XOR CH, CH          ; Clear CH
    MOV SI, 2           ; Start position in buffer
    
CONVERT_LOOP:
    XOR AX, AX          ; Clear AX
    MOV AL, buffer[SI]  ; Get character
    SUB AL, '0'         ; Convert to number
    
    ; Multiply current result by 10
    PUSH AX             ; Save current digit
    MOV AX, BX          ; Move current result to AX
    MUL ten             ; Multiply by 10
    MOV BX, AX          ; Store back in BX
    POP AX              ; Restore current digit
    
    ADD BX, AX          ; Add current digit
    
    INC SI              ; Move to next character
    LOOP CONVERT_LOOP
    
    POP SI
    POP DX
    POP CX
    POP AX
    RET
StringToNumber ENDP

; Display multi-digit number
DisplayNumber PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10          ; Divisor
    XOR CX, CX          ; Counter for digits
    
    ; Handle zero case
    TEST AX, AX
    JNZ DIVIDE_LOOP
    PUSH 0
    INC CX
    JMP DISPLAY_LOOP
    
DIVIDE_LOOP:
    XOR DX, DX          ; Clear DX for division
    DIV BX              ; Divide by 10
    PUSH DX             ; Save remainder
    INC CX              ; Increment counter
    TEST AX, AX         ; Check if quotient is zero
    JNZ DIVIDE_LOOP     ; If not, continue dividing
    
DISPLAY_LOOP:
    POP DX              ; Get digit
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02h         ; Display character function
    INT 21h
    LOOP DISPLAY_LOOP
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DisplayNumber ENDP

END MAIN