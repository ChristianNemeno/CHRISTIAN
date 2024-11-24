; Filename: Exer2.asm
; 
; Christian A. Nemeno
; Date: August 29, 2024

.model small 
.code
.stack 100

.DATA 
	header DB ' Filename: Exer2.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Displaying sentences using characters',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

start:

	mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h


	mov ah,02h
	mov cl,'C' ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,'h' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'r' ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,'i' ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,'s' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'t' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'i' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'a' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'N' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'m' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,0Ah ; new line	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'B' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'a' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'c' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'h' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'l' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'r' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'f' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'S' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'c' ; 	
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
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'c' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'i' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
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
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'S' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'c' ; 	
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
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'c' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'2' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'d' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'Y' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'a' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'r' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,0Ah 
	mov dl,cl
	int 21h
	
	
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
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'f' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
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
	mov cl,' ' ; 	
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
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'C' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'b' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'u' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'I' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,'s' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'t' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'i' ; 	
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
	mov cl,'t' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'f' ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'T' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'e' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'c' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'h' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
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
	mov cl,'o' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'g' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'y' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'-' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'U' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'n' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'i' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'v' ; 	
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
	mov cl,'s' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'i' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'t' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'y' ; 	
	mov dl,cl
	int 21h
	
	
	
	

int 27h ; terminate
end start ; end program