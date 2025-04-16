.model small
.data

strlen dw 11
str db "BITSPILANI$"
strcpy db 11 dup(0)
newline 0Ah,0Dh,"$"

.code
.startup

mov ax,ds
mov es,ax
mov cx,strlen
lea si,str
lea di,strcpy

cld
l1:
lodsb     ; load into al, and then store into extra segment
stosb
loop l1

mov dx,offset str ; first print the original string
mov ah,09h
int 21h

mov dx,newline ;then prints the newline
mov ah,09h
int 21h 

mov dx,strcpy  ;then print the copied version
mov ah,09h
int 21h 

.exit
end