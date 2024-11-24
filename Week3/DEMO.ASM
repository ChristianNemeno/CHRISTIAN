;Filename: Demo.asm
;Displaying single characters, numbers and symbols
;Name: 
;Date: 

.model small
.code
.stack 100
start:
	
		mov ah,02h ; prepare hardware
		mov cl,48h ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,45h ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,4Ch ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,4Ch ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,4Fh ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,20h ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,57h ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,4Fh ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,'D' ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,02h ; prepare hardware
		mov cl,4Ch ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		mov ah,09h ; prepare hardware
		mov bl,3Eh ; ;41h is capital A sa ascii
		mov cx,1	;preparing to display 
		int 10h
		
		mov ah,02h ; prepare hardware
		mov cl,44h ; ;41h is capital A sa ascii
		mov dl,cl	;preparing to display 
		int 21h
		
		
		
		
		
		
	int 27h
	end start 