; TITLE     Parameter passing via the stack     PROCSWAP.ASM
; COMMENT |
;            Objective: To show parameter passing via the stack
;                Input: Requests a character string from the user.
;               Output: Outputs the input string with the first 
; |                     two characters swapped. 
;Filename: Prog412.asm
;Programmer Name: Christian A. Nemeno
;Program Description: Outputs the input string with the first two characters swapped
;Date created : November 8, 2024
BUF_LEN     EQU 41          ; string buffer length 
.MODEL SMALL
.STACK 100H
.DATA
string      DB  BUF_LEN DUP (?)     ; input string < BUF_LEN chars.
prompt_msg  DB  'Please input a string: ',0
output_msg  DB  'The swapped string is: ',0
header DB 'Filename: Prog412.asm', 0Ah, \
   'Programmer Name: Christian A. Nemeno', 0Ah, \
   'Program Description: Outputs the input string with the first two characters swapped', 0Ah, \
   'Date created : November 8, 2024',0Ah,0


.CODE
INCLUDE io.mac

main    PROC
        .STARTUP
        PutStr header
        PutStr  prompt_msg          ; request string input
        GetStr  string, BUF_LEN     ; read string from the user
        nwln    
        mov     AX, OFFSET string   ; AX := string[0] pointer
        push    AX                  ; push string[0] pointer on stack
        inc     AX                  ; AX := string[1] pointer
        push    AX                  ; push string[1] pointer on stack
        call    swap                ; swaps the first two characters
        PutStr  output_msg          ; display the swapped string
        PutStr  string
        nwln    
done: 
        
main    ENDP

;-----------------------------------------------------------
; Procedure swap receives two pointers (via the stack) to
; characters of a string. It exchanges these two characters.
;-----------------------------------------------------------
swap    PROC
        push    BP              ; save BP - procedure uses BP
        mov     BP,SP           ; copy SP to BP
        push    BX              ; save BX - procedure uses BX
        ; swap begins here. Because of xchg, AL is preserved.
        mov     BX, [BP+6]      ; BX := first character pointer
        xchg    AL, [BX]
        mov     BX, [BP+4]      ; BX := second character pointer
        xchg    AL, [BX]
        mov     BX, [BP+6]      ; BX := first character pointer
        xchg    AL, [BX]
        ; swap ends here
        pop     BX              ; restore registers
        pop     BP
        ret     4               ; return and clear parameters 
swap    ENDP 
        END     main