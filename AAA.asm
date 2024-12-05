; Filename: MIDTERM.ASM
; CS243 Lab Hands-on Midterm Exam
; First Semester SY 2024 - 2025
; Student Name: Christian A. Nemeno
; Date Finished: 10/11/2024
 
.model small
stack 100h
.data
  h1 db ' Online Grocery Form $'
  h2 db 0ah, ' Programmer: Christian A. Nemeno $'
  h3 db 0ah, ' Date: 10/11/2024$'
 
 
  List1 db 100, ?, 100 dup(' ')
  List2 db 100, ?, 100 dup(' ')
  List3 db 100, ?, 100 dup(' ')
  List4 db 100, ?, 100 dup(' ')
  List5 db 100, ?, 100 dup(' ')
 
  h4 db 0ah,0ah, ' Please enter your 5 grocery items: $'
  promptList1 db 0ah,' Item No. 1: $'
  promptList2 db 0ah,' Item No. 2: $'
  promptList3 db 0ah,' Item No. 3: $'
  promptList4 db 0ah,' Item No. 4: $'
  promptList5 db 0ah,' Item No. 5: $'
 
  ordersum db 0ah,0ah,'              ORDER SUMMARY $'
 
  IT1 db 0ah,'   Item No. 1:    ',179,'$'
  IT2 db 0ah,'   Item No. 2:    ',179,'$'
  IT3 db 0ah,'   Item No. 3:    ',179,'$'
  IT4 db 0ah,'   Item No. 4:    ',179,'$'
  IT5 db 0ah,'   Item No. 5:    ',179,'$'
 
 
  dash db ' - $'
 
  foot1 db 0ah,0ah, '  Thank you for shopping!$'
  foot2 db 0ah,'  Order again soon.$'
.code
start:
  mov ax, @data
  mov ds, ax
 
  mov ax, 3
  int 10h
 
  mov ah, 09h
  lea dx, h1
  int 21h
 
  mov ah, 09h
  lea dx, h2
  int 21h
 
  mov ah, 09h
  lea dx, h3
  int 21h
 
  mov ah, 09h
  lea dx, h4
  int 21h
 
 
 
 
  ;Prompt inputs
 
 
  mov ah, 09h
  lea dx, promptList1
  int 21h
 
  mov ah, 0ah
  lea dx, List1
  int 21h
 
  mov ah, 09h
  lea dx, promptList2
  int 21h
 
  mov ah, 0ah
  lea dx, List2
  int 21h
 
  mov ah, 09h
  lea dx, promptList3
  int 21h
 
  mov ah, 0ah
  lea dx, List3
  int 21h
 
  mov ah, 09h
  lea dx, promptList4
  int 21h
 
  mov ah, 0ah
  lea dx, List4
  int 21h
 
  mov ah, 09h
  lea dx, promptList5
  int 21h
 
  mov ah, 0ah
  lea dx, List5
  int 21h
 
;output header
 
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 11
    mov cl, 2
    mov dh, 11
    mov dl, 40
    mov bh, 4eh
    int 10h
 
    lea dx, ordersum
    mov ah, 9
    int 21h
 
;output list
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 12
    mov cl, 2
    mov dh, 12
    mov dl, 40
    mov bh, 70h
    int 10h
 
    lea dx, IT1
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, List1[1]
    mov List1[bx+2], '$'
    lea dx, List1 + 2
    mov ah, 09h
    int 21h
 
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 13
    mov cl, 2
    mov dh, 13
    mov dl, 40
    mov bh, 30h
    int 10h
 
    lea dx, IT2
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, List2[1]
    mov List2[bx+2], '$'
    lea dx, List2 + 2
    mov ah, 09h
    int 21h
 
 
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 14
    mov cl, 2
    mov dh, 14
    mov dl, 40
    mov bh, 70h
    int 10h
 
    lea dx, IT3
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, List3[1]
    mov List3[bx+2], '$'
    lea dx, List3 + 2
    mov ah, 09h
    int 21h
 
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 15
    mov cl, 2
    mov dh, 15
    mov dl, 40
    mov bh, 30h
    int 10h
 
    lea dx, IT4
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, List4[1]
    mov List4[bx+2], '$'
    lea dx, List4 + 2
    mov ah, 09h
    int 21h
 
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 16
    mov cl, 2
    mov dh, 16
    mov dl, 40
    mov bh, 70h
    int 10h
 
    lea dx, IT5
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, List5[1]
    mov List5[bx+2], '$'
    lea dx, List5 + 2
    mov ah, 09h
    int 21h
 
 
  ;verification output
 
 
;display
   
    mov ah, 09h
    lea dx, foot1
    int 21h
 
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 19
    mov cl, 2
    mov dh, 19
    mov dl, 18
    mov bh, 0ceh
    int 10h
 
   
    mov ah, 09h
    lea dx, foot2
    int 21h
 
  int 27h
end start
 