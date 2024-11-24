; FILENAME : EXER4.ASM
; Displaying CHARACTERS WITH COLORS
; Christian A. Nemeno
; Date : August 29, 2024

.model small 
.code
.stack 100

.DATA 
	header DB ' Filename: Exer4.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Displaying CHARACTERS WITH COLORS',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

start:	

	mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h
	
	mov ah,09h 
	mov bl,3Eh ;agua
	mov cx,7	
	int 10h
	
	mov ah,02h
	mov cl,'C' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'l' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'l' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'g' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	

	mov ah,09h 
	mov bl,5Eh ;purple
	mov cx,2	
	int 10h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'f' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	
	mov ah,09h 
	mov bl,2Eh ;agua
	mov cx,8	
	int 10h
	
	mov ah,02h
	mov cl,'C' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'m' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'p' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'u' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'t' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'r' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'S' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'t' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'u' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'d' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'i' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'s' ; 	
	mov dl,cl
	int 21h
	
int 27h ; terminate
end start ; end program