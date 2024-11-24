;Filename: PRELIM.ASM
;CS243 Lab Prelim Exam First Semester SY 2024-2025
;Student Name: NEMENO, CHRISTIAN A.
;Date Finished: September 13, 2024
 
.model small
.stack 100h
.data
 ;head
line78 db 78 dup (' ') , '$';
line db 80 dup (' ') , '$';
line20 db 19 dup (' '), '$'
line24 db 24 dup (' '), '$'
line27 db 27 dup (' '), '$'
line4 db 4 dup (' '), '$'
line13 db 13 dup (' '), '$'
line5 db 4 dup (' '), '$'
line9 db 12 dup (' '), '$'
line10 db 13 dup (' '), '$'
linered db 10 dup(' '), '$'
line1 db ' $'
line33 db 33 dup (' '), '$'
line34 db 34 dup (' '), '$'
line35 db 35 dup (' '), '$'
line100 db 10 dup(' '), '$'
line22 db 22 dup(' '), '$'
line21 db 21 dup(' '), '$'
underline db 10 dup("_"), '$'
line17 db 17 dup(' '), '$'
line26 db 26 dup(' '), '$'
line25 db 25 dup(' '), '$'
line2 db 2 dup('  '), '$'
line23 db 23 dup(' '), '$'
cit db " Cebu Institute of Technology - University", '$'
vehicle db "VEHICLE STICKER APPLICATION FORM", '$'
please db "Please fill out form below", '$'
pers db " Personnel Type:          $"
neme db " Name of Applicant/Driver:$"
mobi db " Mobile Number:           $"
Bran db " Vehicle Make(s)/Brand:   $"
Colo db " Vehicle Color:           $"
vbutton db "V", '$'
stic db " Vehicle Sticker Type:  $"
IDnm db " ID Number:             $"
adrs db " Address:               $"
Plat db " Plate Nummber:         $"
VTyp db " Vehicle Type:          $"
submit db "  SUBMIT  $"
thanks db "Thank you!$"
namers db "Copyright 2024 CHRISTIAN A. NEMENO$"
.code
 
main proc
 
   
    mov ax, @data
    mov ds, ax
 
    mov ah, 00h
    mov al, 03h  
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line ;blackmargin top
    int 21h
 
    ;LINE1
 
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;colorwhite
    mov cx, 1
    int 10h
 
 
    mov ah, 09h
    mov dx, offset line1;whitespace
    int 21h
 
 
    mov ah, 09h
    mov bl, 47h ;colorred
    mov cx, 76
    int 10h
 
    mov ah, 09h
    mov dx, offset line17;cit left space
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset cit; Cebu Institute of Technology-Uni
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line17;cit right space
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;colorwhite
    mov cx, 1
    int 10h
 
    mov ah, 09h
    mov dx, offset line1;whitespace
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    ;LINE2
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;colorwhite
    mov cx, 1
    int 10h
 
 
    mov ah, 09h
    mov dx, offset line1;whitespace
    int 21h
   
    mov ah, 09h
    mov bl, 47h ;color
    mov cx, 76
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line22;vehicleleftspace
    int 21h
 
        mov ah, 09h   ;
    mov dx, offset vehicle;vehicleregistration
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line22;vehiclerightspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;colorwhite
    mov cx, 1
    int 10h
 
 
    mov ah, 09h
    mov dx, offset line1;whitespace
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    ;LINE3
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;colorwhite
    mov cx, 1
    int 10h
 
 
    mov ah, 09h
    mov dx, offset line1;whitespace
    int 21h
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 25
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line25
    int 21h
 
    mov ah,09h
    mov bl, 0CEh
    mov cx, 26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset please;pleasefill
    int 21h
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 25
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line25
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;colorwhite
    mov cx, 1
    int 10h
 
 
    mov ah, 09h
    mov dx, offset line1;whitespace
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
 
    ;extra
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line78 ;newline
    int 21h
 
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    ;LINE4
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset pers ;PERSONNEL
    int 21h
 
    call boxv ; call a box with v
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  24
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset stic ;
    int 21h
 
 
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  2
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line2
    int 21h
 
 
    ;extra1
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line78; newline
    int 21h
 
 
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
    ;LINE5
 
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset neme
    int 21h
   
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  24
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset IDnm
    int 21h
 
 
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  2
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line2
    int 21h
 
    ;extra3
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line78
    int 21h
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
 
    ;LINE6
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset mobi
    int 21h
   
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  24
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset adrs
    int 21h
 
 
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  2
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line2
    int 21h
 
    ;extra4
   
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line78
    int 21h
 
 
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
 
    ;LINE7
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset bran
    int 21h
 
 
   
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  24
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset plat
    int 21h
 
 
 
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  2
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line2
    int 21h
 
 
    ;extra5
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line78
    int 21h
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
 
    ;LINE8
 
    mov ah, 09h  
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset colo
    int 21h
   
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  24
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset VTyp
    int 21h
 
 
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  2
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line2
    int 21h
 
    ;extra6
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line78
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
   
    ;redextension1
 
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 34
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line34
    int 21h
 
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 10
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset linered
    int 21h
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 34
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line34
    int 21h
 
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
 
 
    ;extra8
 
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 34
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line34
    int 21h
 
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 10
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset submit
    int 21h
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 34
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line34
    int 21h
 
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
    ;redextendsion2
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 34
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line34
    int 21h
 
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 10
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset linered
    int 21h
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 34
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line34
    int 21h
 
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
 
 
;extra10
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line78
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line1;blackspace
    int 21h
 
    ;copyright
 
    mov ah, 09h
    mov dx, offset line1;blackspace
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 21
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line21
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 36
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset namers
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 23
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line23
    int 21h
   
    mov ah, 09h
    mov dx, offset line1
    int 21h
 
    mov ah, 09h
    mov dx, offset line1
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 78
    int 10h
   
    mov ah, 09h
    mov dx, offset line1
    int 21h
    mov ah, 09h
    mov dx, offset line1
    int 21h
 
    mov ah, 09h
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov dx, offset line
    int 21h
 
 
    mov ah, 09h   ;
    mov dx, offset line35
    int 21h
 
    mov ah, 09h
    mov bl, 08Eh ;color
    mov cx, 10
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset thanks
    int 21h
 
    mov ah, 09h
    mov bl, 00h
    mov cx, 35
    int 10h
 
    mov ah, 09h
    mov dx, offset line35
    int 21h
 
 
 
 
    mov ah, 4Ch
    int 21h
 
 
 
main endp
 
 
box proc
    mov ah, 09h
    mov bl, 0Fh ;color
    mov cx, 10
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line10
    int 21h
    ret
box endp
 
boxv proc
    mov ah, 09h
    mov bl, 0Fh ;color
    mov cx, 9
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line9
    int 21h
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset vbutton
    int 21h
    ret
boxv endp
 
end main
 
 
 