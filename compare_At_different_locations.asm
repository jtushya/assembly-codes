.model small
.code

.startup

;...first load the data segment
 mov ax,5000h
 mov ds,ax
 mov si,0  ;..si points to offset 0000h
 
 mov ax,6000h
 mov es,ax
 mov di,0  ;...di points to offset 0000h
 
 mov cx,20 ;...first compare 20 bytes
 
 mov bl,1 ; assume them to be equal at first
 
 compareLoop:
  mov al,[ds:si]
  cmp al,[es:di]
  jne notEqual ;...i.e they are not equal, so then jump
  
  inc si
  inc di
  
 loop compareLoop
 
 jmp done
 
 notEqual:
  mov bl,0 ; set bl as 0
  
  done:
   .exit
   end