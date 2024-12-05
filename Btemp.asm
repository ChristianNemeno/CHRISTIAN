; Parking Management System in Assembly (x86 DOS)
.model small
.stack 100h

.data
    ; Menu Strings
    screen_width equ 80
    screen_height equ 25
    msg_length equ 24  ; length of 'Welcome to my Todo List!'
    menu            db '                        *****************MENU*****************                       $'
    menu1           db '                           Press 1 for rikshw                                  $'
    menu2           db '                           Press 2 for cars                                    $'
    menu3           db '                           Press 3 for bus                                     $'
    menu4           db '                           Press 4 to show the record                          $'
    menu5           db '                           Press 5 to delete the record                        $'
    menu6           db '                           Press 6 to exit$                                    $'

    ; Message Strings
    msg1            db 'Parking Is Full$'
    msg2            db 'Wrong input$'
    msg3            db 'car$'
    msg4            db 'bus$'
    msg5            db 'record$'
    msg6            db 'there is more space$'
    msg7            db 'the total amount is=$'
    msg8            db 'the total numbers of vehicles parked=$'
    msg9            db 'the total number of rikshws parked=$'
    msg10           db 'the total number of cars parked=$'
    msg11           db 'the total number of buses parked=$'
    msg12           db '***Record deleted successfully***$'

    ; Variables for tracking
    amount          dw 0     ; Total parking amount
    count           dw '0'   ; Total vehicles count
    am1             dw ?     ; Unused variable
    am2             dw ?     ; Unused variable
    am3             dw ?     ; Unused variable

    ; Counters for different vehicle types
    r               dw '0'   ; Rikshw counter
    c               db '0'   ; Car counter
    b               db '0'   ; Bus counter
    success db 'Operation succesfull$'
    
    welcome_msg db 'Welcome Parking Management System $'
    choice_msg db 'Enter choice: $'
    price_msg db 'Cost: $'

.code
main proc
    mov ax, @data
    mov ds, ax

   call Start


main_menu_loop:   
    ; Display Main Menu
    mov ah, 01h       ; Function to wait for and get key input
    int 21h           ; Call DOS interrupt
    call ClearScreen
    
    mov dl,0
    mov dh,6
    call SetCursor
    call display_menu


    
    call newline
    
    lea dx, choice_msg
    call PrintString
    ; Get user input
    mov ah, 1
    int 21h
    mov bl, al

    call newline

    ; Menu option handling
    mov al, bl
    cmp al, '1'
    je goto_rik
    cmp al, '2'
    je goto_handle_car
    cmp al, '3'
    je handle_bus
    cmp al, '4'
    je handle_record
    cmp al, '5'
    je handle_delete
    cmp al, '6'
    je program_exit

    ; Invalid input handling
    mov dx, offset msg2
    mov ah, 9
    int 21h
    jmp main_menu_loop

; Procedure to display menu
display_menu proc
    ; Clear screen (simplified)
   

    call newline

    ; Display menu options
    mov dx, offset menu
    mov ah, 9
    int 21h
    call newline
    mov dx, offset menu1
    mov ah, 9
    int 21h
    call newline
    mov dx, offset menu2
    mov ah, 9
    int 21h
    call newline
    mov dx, offset menu3
    mov ah, 9
    int 21h
    call newline
    mov dx, offset menu4
    mov ah, 9
    int 21h
    call newline
    mov dx, offset menu5
    mov ah, 9
    int 21h
    call newline
    mov dx, offset menu6
    mov ah, 9
    int 21h
    ret
display_menu endp

goto_handle_car:
jmp handle_car

goto_rik:
jmp handle_rikshw

; Handle Rikshw Parking
handle_rikshw:
    call rikshaw
    jmp main_menu_loop

; Handle Car Parking
handle_car:
    call caar
    jmp main_menu_loop

; Handle Bus Parking
handle_bus:
    call buss
    jmp main_menu_loop

; Handle Record Display
handle_record:
    call recrd
    jmp main_menu_loop

; Handle Record Deletion
handle_delete:
    call delt
    jmp main_menu_loop

; Exit Program
program_exit:
    mov ah, 4ch
    int 21h

main endp

;functions

;print string
PrintString PROC
    mov ah, 09h     ; DOS function to display a string
    int 21h         ; Call DOS interrupt to display the string
    ret             ; Return from the function
PrintString ENDP

; Procedure to print newline
newline proc
    mov dx, 10
    mov ah, 2
    int 21h
    mov dx, 13
    mov ah, 2
    int 21h
    ret
newline endp

; Rikshw Parking Procedure
rikshaw proc
    ; Check if parking is full (max 8 vehicles)
    cmp count, '8'
    jle rikshw_park
    
    ; Parking full message
    mov dx, offset msg1
    mov ah, 9
    int 21h
    ret

rikshw_park:
    ; Calculate parking amount (200 for rikshw)

    ;call PrintPrice


    mov ax, 200
    add amount, ax
    
    ; Display parking amount
    mov ax, amount

    call display_number
    
    ; Increment counters
    inc count
    inc r
    ret
rikshaw endp

; Car Parking Procedure
caar proc
    ; Check if parking is full (max 8 vehicles)
    cmp count, '8'
    jle car_park
    
    ; Parking full message
    mov dx, offset msg1
    mov ah, 9
    int 21h
    ret

car_park:
    ; Calculate parking amount (300 for car)
    mov ax, 300
    add amount, ax
    
    ; Display parking amount
    mov ax, amount
    call display_number
    
    ; Increment counters
    inc count
    inc c
    ret
caar endp

; Bus Parking Procedure
buss proc
    ; Check if parking is full (max 8 vehicles)
    cmp count, '8'
    jle bus_park
    
    ; Parking full message
    mov dx, offset msg1
    mov ah, 9
    int 21h
    ret

bus_park:
    ; Calculate parking amount (400 for bus)
    mov ax, 400
    add amount, ax
    
    ; Display parking amount
    mov ax, amount
    call display_number
    
    ; Increment counters
    inc count
    inc b
    ret
buss endp

; Display Number Procedure (Generic number display)
display_number proc
    mov dx, 0
    mov bx, 10
    mov cx, 0

number_push:
    div bx
    push dx
    mov dx, 0
    inc cx
    cmp ax, 0
    jne number_push

number_print:
    pop dx
    add dx, 48
    mov ah, 2
    int 21h
    loop number_print
    ret
display_number endp

; Record Display Procedure
recrd proc
    ; Display total amount
    mov dx, offset msg7
    mov ah, 9
    int 21h
    mov ax, amount
    call display_number
    call newline

    ; Display total vehicles
    mov dx, offset msg8
    mov ah, 9
    int 21h
    mov dx, count
    mov ah, 2
    int 21h
    call newline

    ; Display vehicle type counts
    mov dx, offset msg9
    mov ah, 9
    int 21h
    mov dx, r
    mov ah, 2
    int 21h
    call newline

    mov dx, offset msg10
    mov ah, 9
    int 21h
    mov dl, c
    mov ah, 2
    int 21h
    call newline

    mov dx, offset msg11
    mov ah, 9
    int 21h
    mov dl, b
    mov ah, 2
    int 21h

    call style

    ret
recrd endp

; Delete Record Procedure
delt proc
    ; Reset all counters and amount
    mov r, '0'
    mov c, '0'
    mov b, '0'
    mov amount, 0
    mov count, '0'

    ; Display deletion confirmation
    mov dx, offset msg12
    mov ah, 9
    int 21h
    call newline
    ret
delt endp

style proc
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 19
    mov cl, 2
    mov dh, 19
    mov dl, 18
    mov bh, 0ceh
    int 10h
    ret
style endp

ClearScreen PROC
    mov ah, 06h      ; Scroll up function
    mov al, 0        ; Clear entire screen
    mov bh, 07h      ; Attribute: white on black
    mov cx, 0        ; Start at top-left (row 0, col 0)
    mov dx, 184Fh    ; End at bottom-right (row 24, col 79)
    int 10h          ; Call BIOS interrupt
    ret
ClearScreen ENDP

SetCursor PROC
    mov ah, 02h          ; BIOS function to set cursor position
    mov bh, 0            ; Page number (0 for default screen)
    int 10h              ; Call BIOS interrupt
    ret
SetCursor ENDP


Start proc
 mov ax, 0600h   ; Scroll window up
    mov bh, 07h     ; Normal attribute (white text on black background)
    mov cx, 0000h   ; Top left corner (row 0, column 0)
    mov dx, 184Fh   ; Bottom right corner (row 24, column 79)
    int 10h         ; Video BIOS interrupt

    ; Move cursor to top left
    mov ah, 02h
    mov bh, 0       ; Page 0
    mov dx, 0000h   ; Row 0, Column 0
    int 10h

    ; Calculate starting column for centering
    mov ah, 0
    mov al, screen_width
    sub al, msg_length
    shr al, 1      ; Divide by 2 to center

    ; Set cursor position
    mov dl, al     ; Column (calculated center)
    mov dh, 12     ; Row (middle of screen)
    mov ah, 02h    ; BIOS interrupt to set cursor position
    int 10h

    ; Display welcome message
    mov ah, 09h
    mov dx, offset welcome_msg
    int 21h

    ret
Start endp

PrintPrice PROC
    lea dx, price_msg ; Load the address of the message into DX
    mov ah, 09h     ; DOS function to display a string
    int 21h         ; Call DOS interrupt to display the string
    ret             ; Return from the function
PrintPrice ENDP
end main