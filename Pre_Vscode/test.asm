; display emojis and blinking characters(blinking red heart
; Christian A. Nemeno
; Date: August 29, 2024

.model small 
.code
.stack 100

.DATA
	hdr DB "MULTIPLICATION TABLE" ,13,10, "$"
	crt DB "Created by: CHRISTIAN A NEMENO" ,13,10, "$"
	dat DB "Date: September 6, 2024" ,13,10, "$"
	
	row0 DB "X  | 1 |2 |3  |4  |5	|  6   |  7	  |	8	|  9   |  10  |",13,10, "$"
	row1 DB "1  | 1 |2 |3  |4  |5	|  6   |  7	  |	8	|  9   |  10  |",13,10, "$"
	row2 DB "2  | 2 |4 |6  |8  |10	|  12  |  14  |	16	|  18  |  20  |",13,10, "$"
	row3 DB "3  | 3 |6 |9  |12 |15	|  18  |  21  |	24	|  27  |  30  |",13,10, "$"
	row4 DB "4  | 4 |8 |12 |16 |20	|  24  |  28  |	32	|  36  |  40  |",13,10, "$"
	row5 DB "5  | 5 |10|15 |20 |25	|  30  |  35  |	40	|  45  |  50  |",13,10, "$"
	row6 DB "6  | 6 |12|18 |24 |30	|  36  |  42  |	48	|  56  |  60  |",13,10, "$"
	row7 DB "7  | 7 |14|21 |28 |35	|  42  |  49  |	56	|  63  |  70  |",13,10, "$"
	row8 DB "8  | 8 |16|24 |32 |40	|  48  |  56  |	64	|  72  |  80  |",13,10, "$"
	row9 DB "9  | 9 |18|27 |36 |45	|  54  |  63  |	72	|  81  |  90  |",13,10, "$"
	row10 DB "10| 10|20|30 |40 |50	|  60  |  70  |	80	|  90  |  100 |",13,10, "$"

.CODE




start:	
		MOV AX, @DATA
		MOV DS, AX
		
		MOV AH,09H
		MOV DX, OFFSET hdr
		INT 21H
		CALL NewLine
		
		
		MOV AH,09H
		MOV DX, OFFSET crt
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET dat
		INT 21H
		CALL NewLine
		
		
		MOV AH,09H
		MOV DX, OFFSET row0
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row1
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row2
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row3
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row4
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row5
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row6
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row7
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row8
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row9
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET row10
		INT 21H
		CALL NewLine
		
		
		
		
		
	int 27h ; terminate	
	
NewLine: ; new line
	MOV AH,02H
	MOV DL, 0AH
	INT 21H
	RET

Color:
	MOV BL , 60h
	MOV CX, 5
	INT 10H
	RET
	
	

end start ; end program