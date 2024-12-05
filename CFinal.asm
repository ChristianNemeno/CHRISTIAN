.model large
.stack 100h

.data
    buffer db 6 dup(0)         ; Buffer to store ASCII digits (max 5 digits + null terminator)
    buffer_end db '$'          ; String terminator for printing
    ten dw 10
    three_spaces db '   ',0,'$'
    
    MAX_USER_COUNT dw 3 
    main_menu       db 13,10,10,'                              CAR RENTAL SYSTEM',13,10
                    db '           a. Rent a Car',13,10
                    db '           b. View Rented Cars',13,10
                    db '           c. Update Return Days',13,10
                    db '           d. Return Car',13,10
                    db '           e. Available Cars',13,10
                    db '           f. Exit',13,10
                    db 10,10,10
                    db '  Choose Option: '
                    db 0

    usercount dw 0

    username1 db 20 DUP (?)
    password1 db 20 DUP (?)

    username2 db 20 DUP (?)
    password2 db 20 DUP (?)

    username3 db 20 DUP (?)
    password3 db 20 DUP (?)

    username_check db 20 DUP (?)
    password_check db 20 DUP (?)
    password_toCheck dw 0

    user1_records dw 0,0,0,0,0,0,0,0,0,0
    user1_records_days dw 0,0,0,0,0,0,0,0,0,0
    
    user2_records dw 0,0,0,0,0,0,0,0,0,0
    user2_records_days dw 0,0,0,0,0,0,0,0,0,0
    
    user3_records dw 0,0,0,0,0,0,0,0,0,0
    user3_records_days dw 0,0,0,0,0,0,0,0,0,0

    user_num db 0

    car_records dw 1,1,1,1,1,1,1,1,1,1

    temp_manipulate_record_var_index dw 0
    temp_manipulate_record_var_days dw 0

    rental_title       db 13,10,10,10,10,'                                   Rent Car',13,10,0
    rent_ID_p    db 13,10,10,'   Enter Car no. to Rent:',0
    rent_days  db 13,10,'   Enter the number of days until due to return:',0

    update_car_title       db 13,10,10,10,10,'                            CHANGE DAYS TILL RETURN',13,10,0
    update_carID_prompt    db 13,10,10,'   Enter Car no. to Update:',0
    update_cardays_prompt  db 13,10,'   Enter the new number of days until due to return book:',0

    return_book_title       db 13,10,10,10,10,'                                   RETURN BOOK',13,10,0
    return_bookID_prompt    db 13,10,10,'   Enter Car no. to Return:',0

    

    car_list_menu db 13,10,10,'                                    Cars parked       ',13,10,0
    car_list_row_info db 13,10,10
                             db '          ',218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,194,196,196,196,196,196,196,196,196,196,194,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,'',13,10
                             db '          ',179,'           Car Type            ',179,' Car no. ',179,' Availability ',179,'',13,10,0
    car_list_row_01         db '          ',179,' 01.) Toyota                   ',179,'    0    ',179,'',0
    car_list_row_02         db '          ',179,' 02.) Ferrari                  ',179,'    1    ',179,'',0
    car_list_row_03         db '          ',179,' 03.) Mini Van                 ',179,'    2    ',179,'',0
    car_list_row_04         db '          ',179,' 04.) Ford                     ',179,'    3    ',179,'',0
    car_list_row_05         db '          ',179,' 05.) Audi                     ',179,'    4    ',179,'',0
    car_list_row_06         db '          ',179,' 06.) Pick up                  ',179,'    5    ',179,'',0
    car_list_row_07         db '          ',179,' 07.) Fortuner                 ',179,'    6    ',179,'',0
    car_list_row_08         db '          ',179,' 08.) Lamborghini              ',179,'    7    ',179,'',0
    car_list_row_09         db '          ',179,' 09.) Bentley                  ',179,'    8    ',179,'',0
    car_list_row_10         db '          ',179,' 10.) Mercedes                 ',179,'    9    ',179,'',0
    car_list_row_end        db '          ',192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,193,196,196,196,196,196,196,196,196,196,193,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10,0
    available db '   Available  ',179,'','$'
    borrowed db  '   Unavailable',179,'','$'

    car_list_rented_menu db 13,10,10,'                                Rented Cars',13,10,0
    
    car_name_01 db '   Toyota            ',0,'$'
    car_name_02 db '   Ferrari           ',0,'$'
    car_name_03 db '   Mini Van          ',0,'$'
    car_name_04 db '   Ford              ',0,'$'
    car_name_05 db '   Audi              ',0,'$'
    car_name_06 db '   Pick up           ',0,'$'
    car_name_07 db '   Fortuner          ',0,'$'
    car_name_08 db '   Lamborghini       ',0,'$'
    car_name_09 db '   Bentley           ',0,'$'
    car_name_10 db '   Mercedes          ',0,'$'

    dash db ' -',0,'$'
    days_left db ' day/s until due to return',0,'$'

    dash_car_id db '  -  Car number:',0,'$'

    car_num_index dw 0
    car_num_index_value dw 0
    car_num_index_days dw 0





    opening_menu    db 13,10,10
                    db '        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219
                    db 13,10
                    db '        ',219,219,219,219,219,219,219,219,'                                             ',219,219,219,219,219,219,219,219,13,10
                    db '        ',219,219,219,219,219,219,219,219,'              CAR RENTAL SYSTEM              ',219,219,219,219,219,219,219,219,13,10
                    db '        ',219,219,219,219,219,219,219,219,'                                             ',219,219,219,219,219,219,219,219,13,10
                    db '        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219
                    db 13,10,10
                    db '        By: Christian A Nemeno           Programmed: December 6, 2024',13,10,10,10
                    db '                  _______',13,10
                    db '                 //  ||\ \                                          ',13,10
                    db '           _____//___||_\ \___                   ______             ',13,10
                    db '           )  _          _    \                 /|_||_\`.__         ',13,10
                    db '           |_/ \________/ \___|                (   _    _ _\        ',13,10
                    db '_____________\_/________\_/____________________=`-(_)--(_)-_____________________',13,10                   
                    db '                             1. REGISTER',13,10
                    db '                             2. LOG-IN',13,10
                    db '                             3. EXIT',13,10
                    db '                             Choose Number: ',0

    register_screen db 13,10,10
                    db '                               MEMBERSHIP USER',13,10,0
    
    register_username db 13,10,'   Enter username: ',0
    register_password db 13,10,10,'   Enter password: ',0
    register_full_msg db 13,10,'   THE SYSTEM HAS REACHED ITS MAX AMOUNT OF USERS',0
    register_succ     db 13,10,'   SUCCESSFULLY REGISTERED USER',0
    register_username_used db 13,10,'   USERNAME IS ALREADY USED, TRY A DIFFERENT ONE',0

    login_screen    db 13,10,10
                    db '                               MEMBER LOGIN',13,10,0

    login_username    db 13,10,'   Enter username: ',0
    login_password    db 13,10,'   Enter password: ',0
    press_enter db '   Press Enter to continue!',0,'$'
    wrong_password  db '   Incorrect Password!',13,10
                    db '   Press Enter to try again!',0
    user_not_found_msg db '   User Not Found!',0

    car_unavailable db '   Book not available!',0,'$'
    car_not_borrowed  db '   You cant rent this car!',0,'$'

    thank_you       db 13,10,10
                    db '        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219
                    db 13,10
                    db '        ',219,219,219,219,219,219,219,219,'                                             ',219,219,219,219,219,219,219,219,13,10
                    db '        ',219,219,219,219,219,219,219,219,'            THANK YOU FOR USING!             ',219,219,219,219,219,219,219,219,13,10
                    db '        ',219,219,219,219,219,219,219,219,'                                             ',219,219,219,219,219,219,219,219,13,10
                    db '        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219
                    db '',0


.code
INCLUDE IO.mac
PRINT_STRING proc
    mov ah, 09h
    int 21h
    ret
PRINT_STRING endp

PRINT_CHARACTER proc
    mov ah, 02h
    int 21h
    ret
PRINT_CHARACTER endp

PRINT_INTEGER proc
    ; Converts AX to a string and stores it in the buffer pointed by SI
    mov cx, 0          ; initialize digit count
    mov bx, 10         ; divisor

convert_loop:
    xor dx, dx         ; clear DX
    div bx             ; AX / 10, remainder in DX, quotient in AX
    add dl, '0'        ; convert digit to ASCII
    push dx            ; store digit on stack
    inc cx             ; increment digit count
    test ax, ax        ; check if quotient is 0
    jnz convert_loop   ; repeat if quotient is not 0

print_loop:
    pop dx             ; get digit from stack
    mov ah, 02h        ; DOS function to print character
    int 21h            ; print character
    loop print_loop    ; repeat for all digits

    ret
PRINT_INTEGER endp

;COMPARES 2 STRINGS MOVED INTO THE SI AND DI REGISTERS
;MOVES 0 TO AL IF NOT EQUAL
;MOVES 1 TO AL IF EQUAL

STRING_COMPARE proc    

compare_loop:

    mov al, [di]     
    mov bl, [si]     ; Load byte from string2   
    cmp al, bl       ; Compare the two bytes
    jne not_equal    ; If they are not equal, jump to not_equal
    
    cmp al, 0        ; Check if end of string1 (null terminator)
    je equal         ; If yes, strings are equal
    
    inc si           ; Move to the next byte in string1
    inc di           ; Move to the next byte in string2
    jmp compare_loop ; Repeat the loop
    
not_equal:
    mov AL, 0
    ret
equal:
    mov AL, 1
    ret
STRING_COMPARE endp


;USED IN PRINTING THE TABLE
;IF 0, BORROWED, ELSE AVAILABLE
;USE AX REGISTER AS PASSED VALUE
IF_AVAIALBLE proc
    mov bx, 1
    cmp AX, BX
    je IF_AVAIALBLE_YES

    lea dx, borrowed  
    mov ah, 09h      
    int 21h          
    ret
IF_AVAIALBLE_YES:
    lea dx, available  
    mov ah, 09h      
    int 21h
    ret
IF_AVAIALBLE endp

; THIS FUNCTION IS USED IN ADDING A BOOK 
; OR BORROWING A BOOK AND ITS CORRESPONDING
; DAYS TILL RETURN / DUE
MANIPULATE_CORRESPONDING_USER_RECORD proc
    mov si, temp_manipulate_record_var_index
    shl si, 1
    cmp user_num,1
    je manipulate_user1_record
    cmp user_num,2
    je manipulate_user2_record
    jmp manipulate_user3_record
    ret
manipulate_user1_record:

    cmp car_records[si],0
    je manipulate_book_not_avaialable
    
    mov car_records[si],0
    mov user1_records[si],1
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user1_records_days[si],cx
    ret
manipulate_user2_record:
    cmp car_records[si],0
    je manipulate_book_not_avaialable
    
    mov car_records[si],0
    mov user2_records[si],1
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user2_records_days[si],cx
    ret
manipulate_user3_record:
    cmp car_records[si],0
    je manipulate_book_not_avaialable
    
    mov car_records[si],0
    mov user3_records[si],1
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user3_records_days[si],cx
    ret
manipulate_book_not_avaialable:
    mov dl, 10
    call PRINT_CHARACTER
    lea dx, car_unavailable
    call PRINT_STRING
    ret


MANIPULATE_CORRESPONDING_USER_RECORD endp

RETURN_CAR_FUNC proc
    mov si, temp_manipulate_record_var_index
    shl si, 1
    cmp user_num,1
    je return_user1
    cmp user_num,2
    je return_user2
    jmp return_user3
return_user1:
    cmp user1_records[si],0
    je user_not_borrowing

    mov car_records[si],1
    mov user1_records[si],0
    mov user1_records_days[si],0
    ret
return_user2:
    cmp user1_records[si],0
    je user_not_borrowing

    mov car_records[si],1
    mov user1_records[si],0
    mov user1_records_days[si],0
    ret
return_user3:
    cmp user1_records[si],0
    je user_not_borrowing

    mov car_records[si],1
    mov user1_records[si],0
    mov user1_records_days[si],0
    ret
user_not_borrowing:
    ret
RETURN_CAR_FUNC endp

; THIS FUNCTION IS USED IN CHANGING A BOOK'S  
; DAYS TILL RETURN
CHANGE_CAR_RETURN_DAYS proc
    mov si, temp_manipulate_record_var_index
    shl si, 1
    cmp user_num,1
    je change_user_record1
    cmp user_num,2
    je change_user_record2
    jmp change_user_record3
    ret
change_user_record1:
    cmp user1_records[si],0
    je not_borrowing_book
    
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user1_records_days[si],cx
    ret
change_user_record2:
    cmp user2_records[si],0
    je not_borrowing_book
    
    
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user2_records_days[si],cx
    ret
change_user_record3:
    cmp user3_records[si],0
    je not_borrowing_book
    
    
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user3_records_days[si],cx
    ret
not_borrowing_book:
    mov dl, 10
    call PRINT_CHARACTER
    lea dx, car_not_borrowed
    call PRINT_STRING
    ret


CHANGE_CAR_RETURN_DAYS endp




; PRINTS THE BOOK NAME
; BASED ON VALUE PASSED ON
; BOOK_NUM_INDEX
return_checking_car:
    ret
PRINT_RENTED_CAR_INFO_index proc
    xor dx,dx
    cmp car_num_index_value,0
    je return_checking_car


    cmp car_num_index,0
    jne check_index_1_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_01
    call PRINT_STRING
    

    jmp end_checking_book_index

check_index_1_print_book:
    cmp car_num_index,1
    jne check_index_2_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_02
    call PRINT_STRING
    jmp end_checking_book_index

check_index_2_print_book:
    cmp car_num_index,2
    jne check_index_3_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_03
    call PRINT_STRING
    jmp end_checking_book_index
check_index_3_print_book:
    cmp car_num_index,3
    jne check_index_4_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_04
    call PRINT_STRING
    jmp end_checking_book_index
check_index_4_print_book:
    cmp car_num_index,4
    jne check_index_5_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_05
    call PRINT_STRING
    jmp end_checking_book_index
check_index_5_print_book:
    cmp car_num_index,5
    jne check_index_6_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_06
    call PRINT_STRING
    jmp end_checking_book_index
check_index_6_print_book:
    cmp car_num_index,6
    jne check_index_7_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_07
    call PRINT_STRING
    jmp end_checking_book_index
check_index_7_print_book:
    cmp car_num_index,7
    jne check_index_8_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_08
    call PRINT_STRING
    jmp end_checking_book_index
check_index_8_print_book:
    cmp car_num_index,8
    jne check_index_9_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_09
    call PRINT_STRING
    jmp end_checking_book_index
check_index_9_print_book:
    mov dl, 10
    call PRINT_CHARACTER

    lea dx, car_name_10
    call PRINT_STRING
    jmp end_checking_book_index

end_checking_book_index:
    lea dx, dash_car_id
    call PRINT_STRING

    mov ax, car_num_index
    call PRINT_INTEGER

    lea dx, dash
    call PRINT_STRING
    
    mov ax,car_num_index_days
    call print_integer


    
    lea dx, days_left
    call PRINT_STRING
    ret

PRINT_RENTED_CAR_INFO_index endp

;-----------------------------------------------MAIN PROGRAM STARTS HERE---------------------------------------------------------;
main proc
    mov ax, 3              
    int 10h

    mov ax, @data
    mov ds, ax            
    MOV AH, 06h
    MOV AL, 00h
    MOV BH, 00Dh
    MOV CH, 0
    MOV CL, 0
    MOV DH, 25
    MOV DL, 80
    INT 10h

    ;Red BG with Light Yellow FG
    MOV AH, 06h
    MOV AL, 00h
    MOV BH, 03Fh
    MOV CH, 2
    MOV CL, 8
    MOV DH, 6
    MOV DL, 68
    INT 10h



    ;Call Function to print opening screen
    call OpScreen
    ;to return from OpScreen Section
retOpScreen:

    GetCh AL
    cmp AL,'1'
    je REGISTER_JUMP
    cmp AL, '2'
    je LOGIN_JUMP
    cmp AL, '3'
    je retREGISTER
    
    


REGISTER_JUMP:
    call REGISTER
LOGIN_JUMP:
    call LOGIN
retREGISTER:
    jmp done


;---------------------------------------------REGISTER SCREEN-----------------------------------------------------;
REGISTER:
    mov ax, 03
    int 10h

    ;White BG with Black FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 070h
MOV CH, 1
MOV CL, 2
MOV DH, 8
MOV DL, 62
INT 10h

    ;Black BG with Light Yellow FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 00Ch
MOV CH, 4
MOV CL, 19
MOV DH, 4
MOV DL, 60
INT 10h

    mov ax, MAX_USER_COUNT
    cmp ax,usercount
    je REGISTER_FULL_JUMP
    putStr register_screen
    putStr register_username
    
    cmp usercount,0
    jne register_user2
    GetStr username1
    ;Black BG with Light Yellow FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 00Ch
MOV CH, 6
MOV CL, 19
MOV DH, 6
MOV DL, 60
INT 10h
    putStr register_password

    getstr password1
    jmp REGISTER_FINAL
REGISTER_FULL_JUMP:
    call REGISTER_FULL

register_user2:
    cmp usercount,1
    jne register_user3
    GetStr username2
    lea si, username2
    putStr register_password
    ;Black BG with Light Yellow FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 00Eh
MOV CH, 6
MOV CL, 19
MOV DH, 6
MOV DL, 60
INT 10h
    getstr password2
    jmp REGISTER_FINAL

register_user3:
    GetStr username3
    lea si, username3
    putStr register_password
    ;Black BG with Light Yellow FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 00Eh
MOV CH, 6
MOV CL, 19
MOV DH, 6
MOV DL, 60
INT 10h
    getstr password3
    jmp REGISTER_FINAL

REGISTER_FINAL:

    CALL CHECK_USER_ALREADY_EXISTS
    
USER_IS_UNIQUE:
;Blinking Green BG with Bright White FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 0EFh
MOV CH, 8
MOV CL, 2
MOV DH, 9
MOV DL, 75
INT 10h 
    inc usercount
    nwln
    putstr register_succ
    nwln
    PutStr press_enter
    GetCH AL
    xor al, al
    jmp main

REGISTER_FULL:
;Blinking Red BG with Light Yellow FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 0CEh
MOV CH, 0
MOV CL, 0
MOV DH, 25
MOV DL, 80
INT 10h
    PutStr register_full_msg

    PutStr press_enter

    GetCH AL
    xor al, al

    jmp main



;---------------------------------------------LOGIN SCREEN-----------------------------------------------------;
LOGIN:
    mov ax, 03
    int 10h
    putStr login_screen
    putStr login_username
    GetStr username_check
    putStr login_password
    getstr password_check

;---------------CHECK FIRST USERNAME-------------------;
    lea si, username_check
    lea di, username1
    CALL STRING_COMPARE
    cmp AL,0
    je check_username_2
    mov user_num,1
    lea di, password1
    jmp end_username_compare
check_username_2:
    lea si, username_check
    lea di, username2
    CALL STRING_COMPARE
    cmp AL,0
    je check_username_3
    mov user_num,2
    lea di, password2
    jmp end_username_compare
check_username_3:
    lea si, username_check
    lea di, username3
    CALL STRING_COMPARE
    cmp AL,0
    je USER_NOT_FOUND
    mov user_num,3
    lea di, password3
    jmp end_username_compare

    

end_username_compare:
    lea si, password_check
    call STRING_COMPARE
    cmp AL,1
    je MAIN_APP_LOOP_JUMP
    call wrong_password_section
MAIN_APP_LOOP_JUMP:
    call MAIN_APP_LOOP


wrong_password_section:
    nwln
    PutStr wrong_password
    GetCh al
    call LOGIN
USER_NOT_FOUND:
    nwln
    PutStr user_not_found_msg
    nwln
    PutStr press_enter
    GetCH AL
    call main

LOGIN_MAIN_HUB:
    jmp main


OpScreen:
    PutStr opening_menu
    call retOpScreen

CHECK_USER_ALREADY_EXISTS:
    cmp usercount,0
    je FINISH_USER_ALREADY_EXISTS
    lea di, username1
    call STRING_COMPARE
    cmp AL,1
    je USER_ALREADY_EXISTS
    cmp usercount,1
    je FINISH_USER_ALREADY_EXISTS
    lea di, username2
    call STRING_COMPARE
    cmp AL,1
    je USER_ALREADY_EXISTS
    cmp usercount,2
    je FINISH_USER_ALREADY_EXISTS

USER_ALREADY_EXISTS:
;Blinking Red BG with Bright White FG
MOV AH, 06h
MOV AL, 00h
MOV BH, 0CEh
MOV CH, 8
MOV CL, 2
MOV DH, 9
MOV DL, 48
INT 10h
    nwln
    PutStr register_username_used
    nwln
    PutStr press_enter
    GetCH AL
    CALL main


FINISH_USER_ALREADY_EXISTS:
    call USER_IS_UNIQUE
;------------MAIN APP STARTS HERE----------------;
MAIN_APP_LOOP:
    mov ax, 3              
    int 10h

    PutStr main_menu
    
    GetCh AL
    cmp al, 'a'
    je RENT_CAR_JUMP
    cmp al, 'b'
    je SHOW_RENTED_CARS_JUMP
    cmp al, 'c'
    je UPDATE_RENTED_CARS_JUMP
    cmp al,'d'
    je RETURN_CAR_JUMP
    cmp al,'e'
    je SHOW_CARS_JUMP
    cmp al, 'f'
    je MENU_SCREEN_JUMP

call MAIN_APP_LOOP

RENT_CAR_JUMP:
    call RENT_CAR
SHOW_RENTED_CARS_JUMP:
    call SHOW_RENTED_CARS
UPDATE_RENTED_CARS_JUMP:
    call UPDATE_RENTED_CAR
RETURN_CAR_JUMP:
    call RETURN_CAR
SHOW_CARS_JUMP:
    call SHOW_CARS
MENU_SCREEN_JUMP:
    call main

RENT_CAR:
    mov ax, 3              
    int 10h
    putstr rental_title
    putstr rent_ID_p
    getint temp_manipulate_record_var_index
    putstr rent_days
    getint temp_manipulate_record_var_days
    call MANIPULATE_CORRESPONDING_USER_RECORD
    nwln
    putstr press_enter
    getch al

    call MAIN_APP_LOOP

load_2nd_user_rented_cars_jump:
    call load_2nd_user_borrowed_books
SHOW_RENTED_CARS:
    mov ax, 3              
    int 10h
    xor ax,ax
    xor bx,bx

    putstr car_list_rented_menu

    cmp user_num,1
    jne load_2nd_user_rented_cars_jump
    
    mov bx,0
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
    
    
    mov bx, 1
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 2
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
    
    mov bx, 3
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 4
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
        
    mov bx, 5
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 6
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
        
    mov bx, 7
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 8
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

    
    mov bx, 9
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user1_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

    jmp END_SHOW_RENTED_CARS
load_3rd_user_rented_cars_jump:
    jmp load_3rd_user_rented_cars

load_2nd_user_borrowed_books:
    cmp user_num,2
    jne load_3rd_user_rented_cars_jump

    mov bx,0
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
    
    
    mov bx, 1
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 2
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
    
    mov bx, 3
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 4
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
        
    mov bx, 5
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 6
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
        
    mov bx, 7
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 8
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

    
    mov bx, 9
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user2_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

    jmp END_SHOW_RENTED_CARS

load_3rd_user_rented_cars:

    mov bx,0
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
    
    
    mov bx, 1
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 2
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
    
    mov bx, 3
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 4
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
        
    mov bx, 5
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 6
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index
        
    mov bx, 7
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

        
    mov bx, 8
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

    
    mov bx, 9
    mov si,bx
    shl si,1
    mov ax, user3_records[si]
    mov car_num_index_value,ax
    mov car_num_index,bx
    mov ax, user3_records_days[si]
    mov car_num_index_days,ax
    call PRINT_RENTED_CAR_INFO_index

    jmp END_SHOW_RENTED_CARS

END_SHOW_RENTED_CARS:
    nwln
    putstr press_enter
    getch al
    call MAIN_APP_LOOP
RETURN_CAR:
    putstr return_book_title
    putstr return_bookID_prompt
    getint temp_manipulate_record_var_index
    call RETURN_CAR_FUNC
    call MAIN_APP_LOOP
END_RETURN_BOOK:
UPDATE_RENTED_CAR:
    mov ax, 3              
    int 10h
    putstr update_car_title

    putstr update_carID_prompt
    getint temp_manipulate_record_var_index
    
    putstr update_cardays_prompt
    getint temp_manipulate_record_var_days

    call CHANGE_CAR_RETURN_DAYS

END_UPDATE_BORROWED_BOOK:
    nwln
    putstr press_enter
    getch al
    call MAIN_APP_LOOP

SHOW_CARS:
    mov ax, 3              
    int 10h
    xor cx,cx
    
    xor AL,AL

    putstr car_list_menu
    putstr car_list_row_info
    
    putstr car_list_row_01
    mov si, 0
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_02
    mov si, 1
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_03
    mov si, 2
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_04
    mov si, 3
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_05
    mov si, 4
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_06
    mov si, 5
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_07
    mov si, 6
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_08
    mov si, 7
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_09
    mov si, 8
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln

    putstr car_list_row_10
    mov si, 9
    shl si, 1
    mov ax, car_records[si]
    call IF_AVAIALBLE
    nwln
    PutStr car_list_row_end
    PutStr press_enter
    Getch AL
    call MAIN_APP_LOOP




;-----USABLE FUNCTIONS---;

done:
    
     ; Clear the screen using BIOS interrupt 10h
    mov ah, 06h         ; BIOS scroll function
    xor al, al          ; AL = 0 to clear the entire screen
    xor cx, cx          ; CX = 0, start from top-left corner (row 0, column 0)
    mov dx, 184Fh       ; DX = bottom-right corner (row 24, column 79 for 80x25 mode)
    mov bh, 07h         ; BH = attribute, white text on black background
    int 10h             ; Call BIOS interrupt

    ; Set cursor to top-left corner using BIOS interrupt 10h
    mov ah, 02h         ; BIOS set cursor function
    xor bh, bh          ; Page number (usually 0)
    xor dh, dh          ; DH = row (top row = 0)
    xor dl, dl          ; DL = column (leftmost column = 0)
    int 10h             ; Call BIOS interrupt

    PutStr thank_you
    mov ah, 4ch            
    int 21h



main endp

end main