.model small
.data

N dw 5
array db 5,3,7,2,4

.code
.startup

mov cx, N
dec cx ; we have to run the loop n-1 times in the bubble sort

outerLoop:
  mov si, 0 ;si=index for array
  mov dx,cx ; inner loop counter
  
innerLoop:
  mov al, array[si]
  mov bl,array[si+1] 
  
  cmp al,bl  ; compare al and bl
  jbe noSwap ; do not swap if if al<=bl
  
  ;else swap the elements
  mov array[si],bl
  mov array[si+1],al
  
noSwap:
   inc si ; move to the next element
   dec dx ; decrement inner loop counter
   jnz innerLoop   
   
 loop outerLoop
 
 .exit
 end