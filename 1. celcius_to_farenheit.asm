.model small
.data   

Deg_Cent DB 37
Deg_Far DB ?

.code
.startup

lea bx, Deg_Cent
mov al, [bx] ; al has c
mov bl,9
mul bl ; c=9*c
mov bl, 5
div bl; 9*c=9*c/5
add al,32
lea Deg_Far,al 

.exit
end
