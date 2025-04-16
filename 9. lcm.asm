.model small
.data
;code to find lcm of two numbers

N1 db 69
N2 db 33  
gcd_out db ?
LCM_out dw ?

.code
.startup

;....first compute gcd....

mov al, N1
mov bl, N2

L1:
cmp al, bl
je equal
jb notEqual 
sub al,bl
jmp L1


notEqual:
 sub bl,al
 jmp L1
 
equal:
  mov gcd_out,al
  
 ;....now compute lcm....
 
 mov al, N1
 mov bl,al
 
 mov al,N2
 mul bl; al=N1*N2
 
 mov bl,gcd_out
 div bl; lcm=(N1*N2)/gcd
    
    
mov LCM_out,bl

.exit
end
  
