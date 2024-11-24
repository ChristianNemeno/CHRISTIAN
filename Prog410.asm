; TITLE     Parameter passing via registers     PROCEX2.ASM
; COMMENT |
;            Objective: To show parameter passing via registers
;                Input: Requests a character string from the user.
; |             Output: Outputs the length of the input string. 
;Filename: Prog410.asm
;Programmer Name: Christian A. Nemeno
;Program Description: Outputs the length of the input string
;Date created : November 8, 2024
BUF_LEN     EQU 41          ; string buffer length 
.MODEL SMALL
.STACK 100H
.DATA
string      DB  BUF_LEN DUP (?)     ; input string < BUF_LEN chars.
prompt_msg  DB  'Please input a string: ',0
length_msg  DB  'The string length is ',0
header DB 'Filename: Prog410.asm', 0Ah, \
   'Programmer Name: Christian A. Nemeno', 0Ah, \
   'Program Description: Outputs the length of the input string', 0Ah, \
   'Date created : November 8, 2024',0Ah,0

.CODE
INCLUDE io.mac

main    PROC
        
        .STARTUP
        PutStr header
        PutStr  prompt_msg          ; request string input
        GetStr  string, BUF_LEN     ; read string from keyboard
        nwln
        mov     BX, OFFSET string   ; BX := string address
        call    str_len             ; returns string length in AX
        PutStr  length_msg          ; display string length
        PutInt  AX
        nwln    
done: 
       
main    ENDP

;-----------------------------------------------------------
; Procedure str_len receives a pointer to a string in BX.
; String length is returned in AX.
;-----------------------------------------------------------
str_len PROC
        push    BX
        sub     AX,AX           ; string length := 0 
repeat:
        cmp     BYTE PTR [BX],0      ; compare with NULL char.
        je      str_len_done    ; if NULL we are done
        inc     AX              ; else, increment string length
        inc     BX              ; point BX to the next char.
        jmp     repeat          ; and repeat the process
str_len_done:
        pop     BX
        ret
str_len ENDP
        END     main