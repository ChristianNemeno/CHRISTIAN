; filename exer7.asm
; display emojis and blinking characters(blinking red heart
; Christian A. Nemeno
; Date: August 29, 2024

.MODEL SMALL
.code
.STACK 1024h

.DATA 
	header DB ' Filename: Exer7.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Displaying Duck emoji',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

START:
mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h

	mov ah, 02h
    mov dl, 0Ah
    int 21h
;row 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,4
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,4
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,6
	INT 10H
	int 10h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;row 3
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,6
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,5
	INT 10H
	int 10h
	
	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 4
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	mov Ah,09H
	mov bl,40h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	;;5
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	mov Ah,09H
	mov bl,8Eh ;8=BLINKING // E FOR FONT COLOR ; OR BACKGROUND COLOR// FONT COLOR COMBO
	mov cx,2
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, '>'
    mov dl, cl
    int 21h
	;;7
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,5
	INT 10H
	int 10h
	
	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 5
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	mov Ah,09H
	mov bl,40h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,5
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,5
	INT 10H
	int 10h
	
	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 6
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
	mov Ah,09H
	mov bl,40h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,6
	INT 10H
	int 10h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 7
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,14
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 8
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,8
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov Ah,09H
	mov bl,30h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 9
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,4
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov Ah,09H
	mov bl,30h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov Ah,09H
	mov bl,30h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 10
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,5
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov Ah,09H
	mov bl,30h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 11
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,11
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 12
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,9
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;row 13
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,4
	INT 10H
	;;1
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;2
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;3
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;4
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;5
	mov Ah,09H
	mov bl,60h    ;3 is aqua E is yellow
	mov cx,7
	INT 10H
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;6
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;7
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;8
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;9
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

	;;10
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;11
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;12
	mov Ah,09H
	mov bl,00h    ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	int 10h
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;13
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	;;14
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
int 27h
END START