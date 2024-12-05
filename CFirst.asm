; Name of System: Online Coffee Order System
; Description: This program creates users to create accounts to order 
; Programmer: RAYMOND GERARD Y. TIO
; Date : November 22, 2024

.MODEL SMALL
.STACK 100H
.DATA
    SPACE       DB ' $',0
    newline     DB ' $',13,10
    header      DB '  Cebu Institute of Technology - University', 13,10
                DB '  Online Coffee Order System',13,10
                DB '  Programmer: RAYMOND GERARD Y. TIO',13,10
                DB '  Copyright 2024',13,10,10, '$'

    acc_title   DB ' Welcome to the CappuTio Coffee Delivery App!                                 $',13,10
    acc_login   DB ' 1. Login to existing Account                                                 $',13,10
    acc_regis   DB ' 2. Register new Account                                                      $',13,10
    acc_exit    DB ' 3. Exit                                                                      ',13,10
                DB '  Enter your choice: $',13,10
    

    menu_title  DB ' CappuTio Coffee Delivery Main Menu                                           $'
    menu_create DB ' 1. Create/Change order                                                       $'
    menu_review DB ' 2. Review existing order                                                     $'
    menu_delete DB ' 3. Delete existing order                                                     $'
    menu_ex     DB ' 4. Exit                                                                      ',13,10
                DB '  Enter your choice: $',13,10

    menu_error  DB ' ERROR! Invalid choice!                                                        $',13,10
    login_error DB ' ERROR! Account not recognized!                                                $',13,10

    order_menu  DB '          ~Menu~        ', 13,10
                DB '  Americano   -  P150.00', 13,10
                DB '  Espresso    -  P130.00', 13,10
                DB '  Cappuccino  -  P170.00', 13,10
                DB '  Latte       -  P160.00', 13,10
                DB '  Mocha       -  P180.00$', 13,10, 13,10

    order_amou  DB 13,10,13,10,'  Order Amounts: $'

    curr_order  DB '    ~Current Orders~    $'
    curr_amer_prompt   DB 13,10,'  Americano   - $'
    curr_espr_prompt   DB 13,10,'  Espresso    - $'
    curr_capp_prompt   DB 13,10,'  Cappuccino  - $'
    curr_latt_prompt   DB 13,10,'  Latte       - $'
    curr_moch_prompt   DB 13,10,'  Mocha       - $'

    curr_price_prompt  DB ' - P$'

    delete_order_prompt DB ' Are you sure you want to delete your order? Y/N ',13,10
                        DB '  Enter your choice: $',13,10
    deleting_order_prompt   DB 13,10,' ~Deleting Order~$',13,10
    cancel_delete_prompt    DB 13,10,' ~Delete Cancelled~$',13,10
    

    order_A     DB 13,10,'  Americano  : $'
    order_E     DB '  Espresso   : $'
    order_C     DB '  Cappuccino : $'
    order_L     DB '  Latte      : $'
    order_M     DB '  Mocha      : $'
    order_total DB 13,10,'  Your total is: P$'

    period      DB '.$',13,10,'$'
    ex_point    DB '!$',13,10
    exit_msg    DB ' We hope you enjoy your order!',13,10,' Thank you!$'

    setup_title     DB '                                _____________       ',13,10
                    DB '                               <_____________> ___  ',13,10
                    DB '                               |             |/ _ \ ',13,10
                    DB '                               |               | | |',13,10
                    DB '                            ___|             |\___/ ',13,10
                    DB '                           /    \___________/    \  ',13,10
                    DB '                           \_____________________/                            ',13,10
                    DB '    ___                         _____  _         ___        __   __           ',13,10
                    DB '   / __| __ _  _ __  _ __  _  _|_   _|(_) ___   / __| ___  / _| / _| ___  ___ ',13,10
                    DB '  | (__ / _` ||  _ \|  _ \| || | | |  | |/ _ \ | (__ / _ \|  _||  _|/ -_)/ -_)',13,10
                    DB '   \___|\__,_|| .__/| .__/ \_,_| |_|  |_|\___/  \___|\___/|_|  |_|  \___|\___|',13,10
                    DB '              |_|   |_|                                                       $',13,10,13,10

    setup_prompt1   DB 13,10,'  ',13,10
                    DB '  Welcome to CappuTio Coffee Delivery!',13,10
                    DB '  We see you are a new user, so please sign up for your account below.$',13,10,13,10

    registerPrompt  DB 13,10,13,10,' ~REGISTER~$',13,10
    loginPrompt     DB 13,10,13,10,' ~LOGIN~$',13,10

    registerSucce   DB 13,10,' ~New User Register Successful!~$',13,10
    loginSucce      DB 13,10,' ~User Login Successful!~$',13,10

    usernamePrompt  DB 13,10,' Enter Username: $'
    passwordPrompt  DB 13,10,' Enter Password: $'
    acc_exit_prompt DB ' Thank you for using the app!',13,10,' Order again soon!$'

    inputUsername DB 50 DUP('$')        ; used for registering
    inputPassword DB 50 DUP('$')        ; used for registering

    loginUsername DB 50 DUP('$')        ; inputted during login, used to compare with inputUsername
    loginPassword DB 50 DUP('$')        ; inputted during login, used to compare with inputPassword


    num_ameri   dw 0
    num_espre   dw 0
    num_cappu   dw 0
    num_latte   dw 0
    num_mocha   dw 0

    price_amer  dw 150
    price_espr  dw 130
    price_capp  dw 170 
    price_latt  dw 160
    price_moch  dw 180

    total_amer  dw ?
    total_espr  dw ? 
    total_capp  dw ? 
    total_latt  dw ? 
    total_moch  dw ? 

    sum         dw 0

    edit_order_temp dw 0

    curr_bal    DW 0    ; Current balance
    TEMP        DW ?    ; Temp num
    BUFFER      DB 6    ; Buffer for number input
                DB ?
                DB 6 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL CLR_SC

    mov ah, 06h
    mov ch, 0 ; row start
    mov cl, 1 ; col start
    mov dh, 3  ; row end
    mov dl, 78  ; col end
    mov bh, 1Bh ; blue, aqua
    int 10h

    CALL disp_title

    mov ah, 06h
    mov ch, 18 ; row start
    mov cl, 1 ; col start
    mov dh, 19  ; row end
    mov dl, 78  ; col end
    mov bh, 6Eh ; orange, yellow
    int 10h    

    LEA DX, setup_title
    MOV AH, 09H
    INT 21H

    LEA DX, setup_prompt1
    MOV AH, 09H
    INT 21H

    CALL REGISTER_ACC

    CALL CLR_SC

ACC_LOOP:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display account menu
    CALL print_acc
    
    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, '1'
    JZ TYPED_LOGIN
    CMP AL, '2'
    JZ TYPED_REGISTER
    CMP AL, '3'
    JZ typed_ACC_EXIT
    
    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP ACC_LOOP

TYPED_LOGIN:
    JMP ACC_LOGGING

TYPED_REGISTER:
    JMP ACC_REGISTER

typed_ACC_EXIT:
    JMP ACC_EXITING

ACC_LOGGING:
    CALL LOGIN_ACC

    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername+2
    CALL LOGIN_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0                   
    je INVALID_LOGIN

    mov si, OFFSET loginPassword+2
    mov di, OFFSET inputPassword+2
    CALL LOGIN_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, loginSucce
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

INVALID_LOGIN:                  ; results if compared strings are not equal
    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, login_error
    MOV AH, 09H
    INT 21H

    ;CALL PRINT_LOGIN_ATTEMPT       use to see current account and inputted login

    JMP ACC_LOOP                ; loops back to account menu after displaying error

ACC_REGISTER:
    CALL reset_all_zero         ; resets menu orders to 0 to ensure each account starts with 0 orders

    CALL REGISTER_ACC

    LEA DX, registerSucce
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP

ACC_EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, acc_exit_prompt
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH             ; fully exits the program
    INT 21H


MENU_LOOP:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display main menu
    CALL print_menu
    
    ; Await user input
    MOV AH, 01H
    INT 21H
    
    ; Jumps to option
    CMP AL, '1'
    JZ TYPED_CREATE
    CMP AL, '2'
    JZ TYPED_REVIEW
    CMP AL, '3'
    JZ TYPED_DELETE
    CMP AL, '4'
    JZ typed_EXIT
    
    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP

TYPED_CREATE:
    JMP CREATE_ORDER

TYPED_REVIEW:
    JMP REVIEW_ORDER

TYPED_DELETE:
    JMP DELETE_ORDER

typed_EXIT:
    JMP EXITING

CREATE_ORDER:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    CALL reset_all_zero     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_menu
    MOV AH, 09H
    INT 21H

    LEA DX, order_amou
    MOV AH, 09H
    INT 21H

    LEA DX, order_A
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_ameri, AX       ; adds inputted number to originally 0

    mov ax, num_ameri
    mov bx, price_amer
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_amer, ax

    ADD sum, ax             ; adds price of order to overall total price
    
    LEA DX, order_E 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_espre, AX

    mov ax, num_espre
    mov bx, price_espr
    mul bx
        mov total_espr, ax

    ADD sum, ax
    
    LEA DX, order_C 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_cappu, AX

    mov ax, num_cappu
    mov bx, price_capp
    mul bx
        mov total_capp, ax

    ADD sum, ax
    
    LEA DX, order_L 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_latte, AX

    mov ax, num_latte
    mov bx, price_latt
    mul bx
        mov total_latt, ax

    ADD sum, ax
    
    LEA DX, order_M 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_mocha, AX

    mov ax, num_mocha
    mov bx, price_moch
    mul bx
        mov total_moch, ax

    ADD sum, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum                 ; prints overall total price
    CALL DISPLAY_NUM2
    JMP MENU_LOOP

REVIEW_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_amer_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_ameri           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_amer          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_espr_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_espre
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_espr
    CALL DISPLAY_NUM2

    LEA DX, curr_capp_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_cappu
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_capp
    CALL DISPLAY_NUM2

    LEA DX, curr_latt_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_latte
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_latt
    CALL DISPLAY_NUM2

    LEA DX, curr_moch_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_mocha
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_moch
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum
    CALL DISPLAY_NUM2
    JMP MENU_LOOP

DELETE_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, delete_order_prompt
    MOV AH, 09H
    INT 21H

    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, 'Y'
    JZ typed_YES_DELETE
    CMP AL, 'y'
    JZ typed_YES_DELETE
    CMP AL, 'N'
    JZ typed_CANCEL_DELETE
    CMP AL, 'n'
    JZ typed_CANCEL_DELETE

    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       ; loops back to menu screen if Y, y, N, or n were not inputted

typed_YES_DELETE:
    JMP DELETING_ORDER

typed_CANCEL_DELETE:
    JMP CANCELING_DELETE

DELETING_ORDER:
    LEA DX, deleting_order_prompt
    MOV AH, 09H
    INT 21H

    CALL reset_all_zero ; resets all values to 0

    JMP MENU_LOOP

CANCELING_DELETE:
    LEA DX, cancel_delete_prompt    
    MOV AH, 09H
    INT 21H

    JMP MENU_LOOP       ; returns back to menu screen without deleting orders

EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, exit_msg
    MOV AH, 09H
    INT 21H
    
    JMP ACC_LOOP        ; returns back to account screen

MAIN ENDP

REGISTER_ACC PROC
    MOV SI, OFFSET inputUsername+2      ; initializes username back to null in case old account exists
    MOV CX, [SI]
    ADD SI, CX
    MOV BYTE PTR [SI-1], '$'

    MOV SI, OFFSET inputPassword+2      ; initializes password back to null in case old account exists
    MOV CX, [SI]
    ADD SI, CX
    MOV BYTE PTR [SI-1], '$'

    LEA DX, registerPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, usernamePrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputUsername
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, passwordPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputPassword
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    RET
REGISTER_ACC ENDP

LOGIN_ACC PROC
    LEA DX, loginPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, usernamePrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, loginUsername
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, passwordPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, loginPassword
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    RET
LOGIN_ACC ENDP

CLR_SC PROC
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
    
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0000H
    INT 10H
    RET
CLR_SC ENDP

disp_title PROC
    
    LEA DX, header
    MOV AH, 09H
    INT 21H

    RET
disp_title ENDP

INPUT_NUM PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR BX, BX  ; Clear BX for result
    XOR CX, CX  ; Clear counter
    
INPUT_LOOP:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13  ; Check for Enter key
    JE INPUT_DONE
    
    CMP AL, '0'
    JB INPUT_LOOP
    CMP AL, '9'
    JA INPUT_LOOP
    
    SUB AL, '0'  ; Convert ASCII to number
    MOV CL, AL
    
    MOV AX, BX
    MOV BX, 10
    MUL BX      ; Multiply current result by 10
    ADD AX, CX  ; Add new digit
    MOV BX, AX
    
    JMP INPUT_LOOP
    
INPUT_DONE:
    MOV AX, BX
    MOV TEMP, AX  ; Store input in TEMP
    
    POP DX
    POP CX
    POP BX
    RET
INPUT_NUM ENDP

DISPLAY_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP
    
print_num_1:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP print_num_1
    
    LEA DX, period
    MOV AH, 09H
    INT 21H
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM ENDP

DISPLAY_NUM2 PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP2:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP2
    
print_num_2:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP print_num_2
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM2 ENDP

reset_all_zero PROC
    MOV AX, sum          ; resets to 0
    MOV BX, AX
    SUB sum, BX

    MOV AX, num_ameri          ; resets to 0
    MOV BX, AX
    SUB num_ameri, BX

    MOV AX, total_amer          ; resets to 0
    MOV BX, AX
    SUB total_amer, BX

    MOV AX, num_espre          ; resets to 0
    MOV BX, AX
    SUB num_espre, BX

    MOV AX, total_espr          ; resets to 0
    MOV BX, AX
    SUB total_espr, BX

    MOV AX, num_cappu          ; resets to 0
    MOV BX, AX
    SUB num_cappu, BX

    MOV AX, total_capp          ; resets to 0
    MOV BX, AX
    SUB total_capp, BX

    MOV AX, num_latte          ; resets to 0
    MOV BX, AX
    SUB num_latte, BX

    MOV AX, total_latt          ; resets to 0
    MOV BX, AX
    SUB total_latt, BX

    MOV AX, num_mocha          ; resets to 0
    MOV BX, AX
    SUB num_mocha, BX

    MOV AX, total_moch          ; resets to 0
    MOV BX, AX
    SUB total_moch, BX
    RET
reset_all_zero ENDP


print_acc PROC
    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_title
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_login
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_regis
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_exit
    MOV AH, 09H
    INT 21H

    RET
print_acc ENDP

print_menu PROC

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_title
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_create
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_review
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_delete
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_ex
    MOV AH, 09H
    INT 21H

    RET
print_menu ENDP

LOGIN_CHECKER proc              ; function to compare registered string and string inputted during login
    CMP BYTE PTR [SI], '$'
    JE EQUAL 
    LOOP_COMPARE:
        mov al, BYTE PTR [SI]
        mov bl, BYTE PTR [DI]
        cmp al, bl
        JNE NOT_EQUAL 
        INC SI
        INC DI
        CMP BYTE PTR [SI], '$'
        JNE LOOP_COMPARE
    EQUAL:
        MOV AL, 1               ; moves 1 to AL if both strings are the same
        ret
    NOT_EQUAL:
        MOV AL, 0               ; moves 0 to AL if both strings are different
        ret
LOGIN_CHECKER endp

PRINT_LOGIN_ATTEMPT PROC        ; NOT ACTUALLY IMPLEMENTED, ONLY USED TO VISUALLY SEE REGISTERED USERNAME AND PASSWORD, AND LOGIN USERNAME AND PASSWORD FOR ANY COMPARE STRING ERRORS
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, loginUsername+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputUsername+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, loginPassword+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputPassword+2
    mov ah, 09h
    int 21h

PRINT_LOGIN_ATTEMPT ENDP

END MAIN