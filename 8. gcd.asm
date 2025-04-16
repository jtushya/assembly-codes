.model small
.data

num db 7
sum dw ?

.code
.startup
        
        
lea bx,num
mov ax,[bx]
mov ah,0
mov bl,al
inc bl
mul bl
mov bl,2
div bl
  
mov sum,ax

.exit
end
  
