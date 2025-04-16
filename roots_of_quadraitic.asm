.model small
.data
 
 msg db "Enter a number from 1 to 9: $" ;the msg u want on the screen
 newline db 0ah,0dh,"$"           ; code for newline defined in data segment
 
 .code
 .startup
 
 mov dx,offset msg    ;this snippet will print the msg
 mov ah,09h
 int 21h
 
 mov ah, 01h; takes input from the user, gets stored in the register in ascii format
 int 21h
 
 and al,0fh  ; find the numeric value of the number
 mov cl,al
 mov ch,00h
 mov si,cx ;made the counter for the outer loop
 
 outerLoop:
  mov dx,offset newline    ; this will start printing from the newline
  mov ah,09h
  int 21h
  
  mov bx,si    ; made the counter for the inner loop
  
  innerLoop:
     mov dl,'*'
     mov ah,02h
     int 21h
     
     dec bx
     jnz innerLoop
  
  loop outerLoop
  .exit
  end