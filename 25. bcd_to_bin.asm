.model small  
.stack 100h
.data

bcdNum db 45h

.code
 bcdtoBin proc
     push bx 
     mov bl,al
     and bl,0fh ;...get the lower nibble
     mov bh,al
     and bh,0f0h ;...get the 10s digit
     shr bh,4   ;...to make 040h->004h
     mov al,bh
     mov ah,0
     mov cx,10
     mul cx
     add al,bl
     pop bx      ;...restore all the register values
     ret
    bcdtoBin endp
 
 .startup
    mov al,bcdNum
    call bcdtoBin
     
     
     