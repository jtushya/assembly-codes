.model small
.data

strlen dw 11
str db "BITSPILANI$"
revstr db 11 dup(0)
newline db 0ah,0dh,"$"

.code
.startup

mov ax,ds
mov es,ax
mov cx,strlen
lea si,str
lea di,revstr
add di,cx;to take pointer to the last position
dec di   ;to enter a valid position 

l1:
 cld      ;move forward
 lodsb    ;load into al
 std      ;move backwards
 stosb    ;store into es
loop l1

mov dx,offset str ;first print the original string
mov ah,09h
int 21h

mov dx,offset newline;then print the newline
mov ah,09h
int 21h

mov dx,offset revstr ;then print the reverse of the strings
mov ah,09h
int 21h

.exit
end
