; Filename: Exer3.asm
; Displaying symbols and signs
; Christian A. Nemeno
; Date: August 29, 2024

.model small 
.code
.stack 100

.DATA 
	header DB ' Filename: Exer3.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: Displaying symbols and signs',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

start:
	mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h

	mov ah,02h
	mov cl,'0' ; 	
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'1' ; 	
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
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'3' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'4' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'5' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'6' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'7' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'8' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; new line	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'9' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'!' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'*' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'#' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'$' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'%' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'^' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'&' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'*' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'(' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,')' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,0Ah ; 	
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
	mov cl,'_' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'+' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'=' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'{' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'}' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'[' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,']' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'<' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	

	mov ah,02h
	mov cl,'?' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,0Ah ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'/' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'|' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'"' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,',' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,'@' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,':' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'<' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'>' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'!' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'#' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'^' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'*' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'_' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'+' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'=' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'&' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'(' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	
	mov ah,02h
	mov cl,')' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,'{' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,' ' ; 	
	mov dl,cl
	int 21h
	
	mov ah,02h
	mov cl,']' ; 	
	mov dl,cl
	int 21h
	
	

int 27h ; terminate
end start ; end program