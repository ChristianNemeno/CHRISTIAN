;TITLE Parameter passing via registers 
; COMMENT I 
;PROCEX1.ASM 
; Objective: To show parameter passing via registers 
; Input: Requests two integers from the user. 
; Output: Outputs the sum of the input integers.
;Filename: Prog49.asm
;Programmer Name: Christian A. Nemeno
;Program Description: Outputs the sum of the input integers
;Date created : November 8, 2024

.MODEL SMALL
.STACK 100H
.DATA
prompt_msgl DB 'Please input the first number: ',0 
prompt_msg2 DB 'Please input the second number: ',0 
sum_msg DB 'The sum is ',0

header DB 'Filename: Prog49.asm', 0Ah, \
   'Programmer Name: Christian A. Nemeno', 0Ah, \
   'Program Description: Outputs the sum of the input integers', 0Ah, \
   'Date created : November 8, 2024',0Ah,0

.CODE
INCLUDE io.mac

main PROC
    .STARTUP
    PutStr header
    PutStr prompt_msgl ; request first number 
    GetInt CX   ; CX := first number
    nwln 
    PutStr prompt_msg2 ; request second number 
    GetInt DX       ; DX := second number 
    nwln 
    call sum        ; returns sum in AX
    PutStr sum_msg ; display sum 
    PutInt AX
    nwln
done:
mov ax,4c00h
int 21h
main ENDP
; -----------------------------------------------------------
; Procedure sum receives two integers in CX and DX. 
; The sum of the two integers is returned in AX. 
;-----------------------------------------------------------
sum PROC
    mov AX,CX ; sum := first number 
    add AX,DX ; sum := sum + second number 
    ret
sum ENDP
    END main