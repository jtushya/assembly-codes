.model small
.data

;...define the blocks
block1 db 23h,42h,63h,77h,25h
block2 db 31h,12h,50h,33h,20h
;...define the count
count db 5

.code
.startup

lea si,block1
lea di,block2
mov cx,5

L1:
 mov al,[si]
 add [di],al
 inc si
 inc di
 loop l1
 
 .exit
 end
 