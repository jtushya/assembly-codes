.model small
.data

msg db "enter a number from 1 to 9: $"
newline db 0ah,0dH,"$"

.code
.startup

mov dx,offset msg ; print the msg on the screen
mov ah, 09h
int 21h

mov ah,01h      ; take the input of the msg, and stores it in ascii format
int 21h
    
and al,0fh ; remove the ascii format
mov cl,al    
mov ch,0
mov si,1  ;set the counter for outer loop

outerLoop:
  mov dx,offset newline
  mov ah,09h
  int 21h
  
  mov bx,si ;set the counter for inner loop

innerLoop:
  mov dl,'*'
  mov ah,02h
  int 21h
  dec bx
  jnz innerLoop
  
  inc si,      ;no increase the value of si by 1 everytime to print 2 *'s and so on
  cmp si,cl     ;compare with cl 
  jbe outerLoop ;if si<=cl, then jump to the outer loop again
 .exit
 end
  