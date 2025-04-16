.model small
.stack 100h
.data      

N dw 5
factorial dw ?

.code
;...function defined   
fact proc:
    cmp ax,1
    jbe baseCase
    push ax
    dec ax
    call fact
    pop bx
    mul bx
    ret
       
   baseCase:
     mov ax,1
     ret
     fact endp

.startup
;...write the program
mov ax,1000h
mov ds,ax
mov ax,N
call fact
mov factorial,ax
.exit
end