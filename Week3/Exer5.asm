;Filename: Exer5.asm
;red cross
;NEMENO, CHRISTIAN A.
;DATE: AUGUST 30, 2024





.model small
.code
.stack 100

.DATA 
	header DB ' Filename: Exer5.asm',13,10
		  	db  ' Programmer Name: Christian A. Nemeno',13,10
		    db  ' Program Description: RED CROSS',13,10
		    db  ' Date created : August 29, 2024',13,10,10,'$'
			
.CODE

start:

	mov ax, @data
	mov ds, ax
	lea dx , header
	mov ah,9
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 5
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

		mov ah, 02h
	mov dl, 20h;space
	int 21h

		mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h


	mov ah, 02h
	mov dl, 0ah;newline
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 2
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h



	mov ah, 09h
	mov bl, 40h
	mov cx, 1
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 2
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 0ah;newline
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 1
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 09h
	mov bl, 40h
	mov cx, 3
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h


	mov ah, 09h
	mov bl, 10h
	mov cx, 1
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 0ah;newline
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 2
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h


	mov ah, 09h
	mov bl, 40h
	mov cx, 1
	int 10h


	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 2
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h


	mov ah, 02h
	mov dl, 0ah;newline
	int 21h

	mov ah, 09h
	mov bl, 10h
	mov cx, 5
	int 10h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h

	mov ah, 02h
	mov dl, 20h;space
	int 21h


	mov ah, 02h
	mov dl, 0ah;newline
	int 21h



	






int 27h
end start 