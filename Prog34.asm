; TITLE     Binary equivalent of characters     BINCHAR.ASM
; COMMENT |
;            Objective: To print the binary equivalent of
;                       ASCII character code.
;                Input: Requests a character from keyboard.
;               Output: Prints the ASCII code of the
; |                     input character in binary.

; PROGRAM 3.4
;Filename: Prog34.asm
;Programmer Name: Christian A. Nemeno
;Program Description: Binary equivalent of characters
;Date created : November 8, 2024


.MODEL SMALL
.STACK 100H
.DATA
    char_prompt     DB  'Please input a character: ',0
    out_msg1        DB  'The ASCII code of ''',0
    out_msg2        DB  ''' in binary is ',0
    query_msg       DB  'Do you want to quit (Y/N): ',0

    header DB 'Filename: Prog34.asm',13,10
	db  'Programmer Name: Christian A. Nemeno',13,10
	db  'Program Description: Binary equivalent of characters',13,10
	db  'Date created : November 8, 2024',13,10,10,'$'

.CODE
INCLUDE io.mac
main    PROC
        mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h
        .STARTUP
read_char:
        PutStr  char_prompt     ; request a char. input
        GetCh   AL              ; read input character
        nwln    
        PutStr  out_msg1
        PutCh   AL
        PutStr  out_msg2
        mov     AH,80H          ; mask byte = 80H
        mov     CX,8            ; loop count to print 8 bits
print_bit:
        test    AL, AH          ; test does not modify AL
        jz      print_0         ; if tested bit is 0, print it
        PutCh   '1'             ; otherwise, print 1
        jmp     skip1
print_0:
        PutCh   '0'             ; print 0
skip1:
        shr     AH, 1           ; right shift mask bit to test
                                ; next bit of the ASCII code
        loop    print_bit
        nwln    
        PutStr  query_msg       ; query user whether to terminate
        GetCh   AL              ; read response
        nwln    
        cmp     AL,'Y'          ; if response is not 'Y'
        jne     read_char       ; read another character
done:                           ; otherwise, terminate program
   
main    ENDP
        END main