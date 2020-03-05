;Spencer Kun
;Course: CSC 35
;Spring Semester
;Instructor: Dr Ghansah
;Thursday, 2/13/2020 9AM
;Lab Section 10
;Program 5a

.model small
.stack 100h
.data

;X WORD ?
;Y WORD ?
X dw ?
Y dw ?
loc1 WORD ?
loc2 WORD ?
loc3 WORD ?
sum WORD ?
W WORD ?
inputX BYTE "Input X=", '$'
inputY BYTE "Input Y=", '$'
outputW BYTE "Output W=", '$'
newline BYTE 0dh, 0ah, '$'


A WORD 12
B WORD 60

.code
Main proc
Mov AX, @data
Mov DS, AX

;Display Prompt
mov X, 0
mov cx, 4

mov ah,9
mov dx,offset inputX
int 21h

L1:
mov AX, 10
mul X
mov X, AX
mov ah, 01h
int 21h
sub AL, 30h
mov ah, 00h
add X, AX
loop L1

mov ah, 09h
mov dx, offset newline
int 21h
mov dx, 0

mov Y, 0
mov cx, 4

mov ah, 09h
mov dx,offset inputY
int 21h

L2:
mov AX, 10
mul Y
mov Y, AX
mov ah, 01h
int 21h
sub AL, 30h
mov ah, 00h
add Y, AX
loop L2


;mov X, 40
;mov Y, 24

mov AX, 160
mul Y
mov BX, AX
mov AX, 2
mul X
Add AX, BX
mov loc1, AX

mov AX, 750
mul A
mov BX, AX
mov AX, 30
mul B
Add AX, BX
mov loc2, AX


mov AX, loc2
mov BX, loc1
sub AX, BX
mov loc3, AX

mov Y, 3000
mov AX, Y
mov BX, 1
sub AX, BX
mov Y, AX


mov DX, 0
mov AX, loc3
mov BX, 8
div BX
add sum, AX
mov DX, 0
mov AX, Y
add sum, AX
mov AX, Y
mov BX, 2
div BX
add sum, AX
mov DX, 0
mov AX, Y
mov BX, 100
div BX
add sum, AX



mov DX, 0
mov AX, sum
mov CX, 7
div CX
add DX, 3
Mov W, DX

mov ah, 09h
mov dx, offset newline
int 21h

mov ah, 09h
mov dx,offset outputW
int 21h

add W, 30h
Mov AX, W
mov AH, 06h
mov DL, AL
int 21h



Mov AX, 4c00h
int 21h
Main endp
	End main
