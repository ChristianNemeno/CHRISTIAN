; display emojis and blinking characters(blinking red heart
; Christian A. Nemeno
; Date: August 29, 2024

.model small 
.code
.stack 100

.DATA 
	header DB ' Filename: Exer6.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Displaying CHARACTERS WITH COLORS AND BLINKING RED HEART',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

start:	
	mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h

	mov ah,09h 
	mov bl,6Eh 
	mov cx,1	
	int 10h
	
	mov ah,02h
	mov cl,'I' ; 	
	mov dl,cl
	int 21h

	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ;8=blink, 4=red foreground
	mov cx,1
	int 10h
 
	mov ah,2
	mov dl,03h ; 03=heart
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,09h 
	mov bl,6Eh 
	mov cx,1	
	int 10h
	
	mov ah,02h
	mov cl,'U' ; 	
	mov dl,cl
	int 21h
	
int 27h ; terminate
end start ; end program