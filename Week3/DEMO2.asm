; display emojis and blinking characters(blinking red heart
; Christian A. Nemeno
; Date: August 29, 2024

.model small 
.code
.stack 100

.DATA
	
    hdr1 DB 186,"                                                         ",13,10, "$"
    hdr2 DB 186,"                CIT U                                    ",13,10, "$"
	hdr3 DB 186,"                                                         ",13,10, "$"
    hdr4 DB 186,"                                                         ",13,10, "$"
    hdr5 DB 186,"       COLLEGE ENROLLMENT FORM                           ",13,10, "$"
    hdr6 DB 186,"                                                         ",13,10, "$"

    row1 DB 186,"FULL NAME        __________    _________                 ",13,10, "$"
    row2 DB 186,"                 first name    last name                 ",13,10, "$"
    row3 DB 186,"ADRESS           __________    _________                 ",13,10, "$"
    row4 DB 186,"                 City          State/Province            ",13,10, "$"
    row5 DB 186,"BIRTH DATE       _______ _______ _______                 ",13,10, "$"
    row6 DB 186,"                 Month   Day     Year                    ",13,10, "$"
    row7 DB 186,"GENDER           [] Male  [] Female []N/A                ",13,10, "$"
    row8 DB 186,"STUDENT NUMBER   _______________________                 ",13,10, "$"
    row8 DB 186,"                 Phone Number                            ",13,10, "$"
    row8 DB 186,"Student Email    _______________________                 ",13,10, "$"
    row8 DB 186,"                 example@example.com                     ",13,10, "$"
    row8 DB 186,"Company          _______________________                 ",13,10, "$"
    row8 DB 186,"Courses          []English 101      []English 102        ",13,10, "$"
    row8 DB 186,"GENDER           []Math101          []History            ",13,10, "$"
    row8 DB 186,"GENDER           []Creative writing []Math 102           ",13,10, "$"
    row8 DB 186,"Addtional Comments ______________________________        ",13,10, "$"
    row8 DB 186,"Addtional Comments |                             |       ",13,10, "$"
    row8 DB 186,"GENDER             |                             |       ",13,10, "$"
    row8 DB 186,"GENDER             |_____________________________|       ",13,10, "$"







.CODE




start:	
	    MOV AX, @DATA
		MOV DS, AX
		
		MOV AH,09H
		MOV DX, OFFSET hdr1
		INT 21H
		CALL NewLine
		
		
		MOV AH,09H
		MOV DX, OFFSET hdr2
		INT 21H
		
		
		MOV AH,09H
		MOV DX, OFFSET hdr3
		INT 21H
		CALL NewLine
		
	int 27h ; terminate	
	
NewLine: ; new line
	MOV AH,02H
	MOV DL, 0AH
	INT 21H
	RET

ColorPur:
	MOV BL , 60h
	MOV CX, 50
	INT 10H
	RET

	
	
	

end start ; end program