; Filename: Exer1.asm
; Programmer Name: Christian A. Nemeno
; Program Description: Displaying single characters, numbers & symbols
; Date created : August 29, 2024

.model small 
.code
.stack 100

.DATA 
	header DB ' Filename: Exer1.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Displaying single characters, numbers & symbols',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

start:
	mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h

	mov ah,02h
	mov cl,61h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,62h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,63h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,64h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,65h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,66h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,67h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,68h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,69h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Ah ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Bh ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Ch ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Dh ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Eh ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Fh ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,70h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,71h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,72h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,73h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,74h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,75h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,76h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,77h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,78h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,79h ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,7Ah ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NEW LINE 
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,41h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,42h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,43h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,44h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,45h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,46h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,47h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,48h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,49h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,4Ah
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,4Bh
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,4Ch
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,4Dh
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,4Eh
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,4Fh
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,50h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,51h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,52h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,53h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,54h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,55h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,56h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,57h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,58h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,59h
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; SPACE
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,5Ah
	mov dl,cl
	int 21h



int 27h ; terminate
end start ; end program