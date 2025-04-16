.model small
.data

input db 156
hundreds db ?
tens db ?
units db ?

.code
.startup
 
 mov ax,1100h
 mov ds,ax
 
 ;..step 1: divide by 100 to get hundreds place
 
 mov bl,100
 div bl
 mov hundreds,al ;...al stores the quotient and ah stores the remainder
 
 ;...divide by 10 to get tens place
 mov al,ah
 mov ah,0
 mov bl,10
 div bl
 mov tens,al
 mov units,ah
 
 .exit
 end