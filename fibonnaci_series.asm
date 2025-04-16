.model small
.data

num db 8
fib_out db 8 dup(0)         

.code
.startup

lea bx,num
mov cl,[bx]
sub cl,2
mov ch,0

lea bx,fib_out
mov [bx+1],1

l1:
 mov al,[bx]
 add al,[bx+1]
 mov [bx+2],al
 inc bx
 
loop l1 ; repeat this process n-2 times

.exit
end
