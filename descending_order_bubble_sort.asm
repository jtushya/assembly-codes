.model small
.data

N dw 5
array db 5,4,2,6,7

.code
.startup
   
   mov cx, N
   dec cx ; to loop the outer loop n-1 times
   
outerLoop:
  mov si,0 ; to get pointer to the array
  mov dx,cx
  
innerLoop:
  mov al, array[si]
  mov bl, array[si+1]
  
  cmp al,bl
  jae noSwap ; if al>=bl then jump to no swap
  
  ;else swap the elements
  mov array[si],al
  mov array[si+1],bl
  
  noSwap:
   inc si
   dec dx
   jnz innerLoop ; jump to the above loop if not zero
   
 loop outerLoop  
 .exit
 end
   
  
