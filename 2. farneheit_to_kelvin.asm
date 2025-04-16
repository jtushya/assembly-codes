.model small
.data

Deg_Far DB -40
Deg_Kel Dw ?

.code
.startup

lea bx, Deg_Far
mov ax,[bx]; ax=F
sub ax,32  ;ax=F-32
mov bl,5
mul bl; ax=(F-32)*5
mov bl,9
div bl ; ax=(F-32)*5/9
add ax,273; ax=(F-32)*5/9 +273
lea Deg_Kel, ax

.exit
end

