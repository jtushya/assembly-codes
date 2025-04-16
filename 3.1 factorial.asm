.model small
.data

fact dw ?                     ; Variable to store the factorial result
msg db "enter a number from 1 to 8: $" ; Message to prompt the user for input

.code
.startup  

mov dx, offset msg            ; Load the address of the message into DX
mov ah, 09h                   ; DOS interrupt function to display a string
int 21h                       ; Call DOS interrupt to display the message

mov ah, 1h                    ; DOS interrupt function to read a single character
int 21h                       ; Call DOS interrupt to read the input character

and ax, 0fh                   ; Convert ASCII input to its numeric value (0-9)

mov cx, ax                    ; Store the input number in CX (loop counter)
mov ax, 01h                   ; Initialize AX to 1 (used for multiplication)

l1:                           ; Label for the loop
    mul cx                    ; Multiply AX by CX (AX = AX * CX)
    loop l1                   ; Decrement CX and repeat the loop if CX != 0
                
mov fact, ax                  ; Store the result (factorial) in the variable 'fact'

end                           ; End of the program
.exit                         ; Exit the program

