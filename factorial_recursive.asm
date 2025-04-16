.model small
.stack 100h
.data      

lN dw 5                      ; Variable to store the input number for factorial
factorial dw ?              ; Variable to store the calculated factorial result

.code
;...function defined   
fact proc:                  ; Start of the factorial procedure
    cmp ax,1               ; Compare AX with 1 to check if it is the base case
    jbe baseCase           ; If AX <= 1, jump to the base case
    push ax                ; Push the current value of AX onto the stack
    dec ax                 ; Decrement AX by 1
    call fact              ; Recursive call to the factorial procedure
    pop bx                 ; Pop the previous value of AX from the stack into BX
    mul bx                 ; Multiply AX by BX (AX = AX * BX)
    ret                    ; Return from the procedure
       
   baseCase:               ; Base case for the recursion
     mov ax,1              ; Set AX to 1 (factorial of 1 is 1)
     ret                   ; Return from the procedure
     fact endp             ; End of the factorial procedure

.startup
;...write the program
mov ax,1000h               ; Initialize AX with the segment address for data
mov ds,ax                  ; Set DS to point to the data segment
mov ax,N                   ; Load the input number (N) into AX
call fact                  ; Call the factorial procedure
mov factorial,ax           ; Store the result of the factorial in the variable 'factorial'
.exit                      ; Exit the program
end