.model small
.data

strlen dw 11
str db "BITSPILANI$"
revstr db 11 dup(0)
newline db 0ah,0dh,"$"
msg_pal db "is a palindrome"
msg_notpal db "is not a palindrome"

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

lea si,str
lea di,revstr
mov cx,strlen
l1:
 mov al,si
 mov bl,di
 cmp al,bl
 jne not_palindrome
 inc si
 inc di
loop l1     

mov dx,offset msg_pal
mov ah,09h
int 21h
jmp done

not_palindrome:
  mov dx,offset msg_notpal
  mov ah,09h
  int 21h
  
done:
 .exit
 end



