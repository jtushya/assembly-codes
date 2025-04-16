.model small
.data

N dw 49
result db ?

.code
.startup

 mov ax,N ;..store the number into ax
 mov bx,1 
 mov cx,0 
 
 Loop:
  sub ax,bx
  js done
  inc cx
  add bx,2
  jmp loop
  
  done:
   mov result,cx
   
   .exit
   end
 