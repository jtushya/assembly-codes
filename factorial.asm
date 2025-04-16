.model small
.data

fact dw ?
msg db "enter a number from 1 to 8: $" ; use to terminate the string

.code
.startup  

; this line will be displayed on the screen, in its ascii value
;so we do masking to get the actual value of the number

mov dx, offset msg ; this is used to print the msg
mov ah,09h ; use for function 09h
int 21h  ; using dos interrupt 21h
                                     
;now take input
mov ah, 01h
int 21h              
                                     
and al,0fh; used to get the first nibble, or ah=00h
mov ch,00
mov cl,al; set up a counter al, al-1,....1
mov ax,0001h        

L1:
  mul cl
  loop l1
  
 mov fact,ax  
 
 .exit
 end
  