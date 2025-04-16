.model small
.data

binaryInput db 11001100b ;...define a binary number input
grayOutput db ?

.code
.startup

mov ax,1100h
mov ds,ax

lea ax,binaryInput

;...now right shift the number...
 mov bl,al
 shr bl,1
 
 xor al,bl;..gray code=binary xor (binary >> 1)
 
 ;...store the result...
 lea grayOutput,al
 
 .exit
 end
