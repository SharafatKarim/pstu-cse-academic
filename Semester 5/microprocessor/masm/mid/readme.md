# Assembly Language Programs

## Problemsets

### Sample equation by Chinmoy Sir

$$\frac{3X^2 + 2X - 5}{2X^2 - 1}$$

```asm
MOV AX, 0Eh
MOV BX, 0EH

MUL BX            ; AX = X^2
MOV [2008], AX 

MOV BX, 3
MUL BX            ; AX = 3X^2
MOV [2002], AX

MOV AX, 0Eh
MOV BX, 2
MUL BX
MOV BX, AX
ADD BX, [2002]
SUB BX, 5         ; BX = 3X^2+2X-5

MOV AX, [2008]
MOV DX, 2
MUL DX            ; AX = 2X^2
SUB AX, 1
MOV DX, AX        ; DX = 2X^2-1
MOV AX, BX        ; AX = 3X^2+2X-5      

MOV BX, DX
XOR DX, DX
DIV BX
```

### Write a program to add two number as well as form a Fibonacci series 🎯

```asm
org 100h
      
    mov ax, 1h 
    mov bx, 1h
    mov dx, 1h
    
    mov cx, 5h ; counter 
    
repeat:
    mov ax, dx ; ax = dx      
    add dx, bx ; dx = dx + bx
    mov bx, ax ; bx = ax

    sub cx, 1h
    cmp cx, 0h
    jne repeat

ret
```

### Write a program to exchange the value of AX and BX

```asm
org 100h
      
    mov ax, 1h 
    mov bx, 2h
    
    xchg ax, bx

ret
```

### Write a program to Find Square Root of a number

For decimal (LLM),

```asm
org 100h
    mov ax, 16h ; number to find square root of
    mov cx, 0h  ; result (square root)
    mov bx, 1h  ; current guess

next_guess:
    mov dx, 0h
    mov ax, 16h
    div bx       ; ax = number / guess

    add ax, bx   ; ax = guess + (number / guess)
    shr ax, 1    ; ax = (guess + (number / guess)) / 2
    cmp ax, cx   ; compare new guess with previous guess
    je done       ; if equal, we're done
    mov cx, ax   ; update result
    inc bx       ; increment guess
    jmp next_guess
done:
    mov ax, cx   ; move result to ax
ret
```

For hex,

```asm
org 100h
    mov ax, 4h ; number to find square root of
    mov bx, 1h  ; current guess

next_guess:
    mov ax, 4h
    div bx       ; ax = number / guess     
    cmp ax, bx
    je done
    
    add bx, 1
    jmp next_guess
done:
    mov ax, bx   ; move result to ax

ret
```

### Write a program  to print a String

```asm
org 100h

    mov dx, offset msg
    mov ah, 09h
    int 21h

msg db 'Hello, World!$'
```

### Write a program to subtract two 8 bit BCD numbers

```asm
org 100h
    mov al, 25h ; first BCD number
    mov bl, 12h ; second BCD number
    sub al, bl  ; subtract
    daa         ; adjust for BCD
ret
```

### Write a program to multiply two 16-bit numbers

```asm
org 100h
    mov ax, 1234h ; first 16-bit number
    mov bx, 0020h ; second 16-bit number
    mul bx        ; multiply ax by bx, result in dx:ax
ret
```

### Write a program to subtract two 16-bit numbers with or without borrow

```asm
org 100h
    mov ax, 1234h ; first 16-bit number
    mov bx, 0020h ; second 16-bit number
    sub ax, bx    ; subtract bx from ax
    sbb ax, 0      ; subtract with borrow if needed
ret
```

### Write a program to add two 8 bit BCD numbers

```asm
org 100h
    mov al, 25h ; first BCD number
    mov bl, 12h ; second BCD number
    add al, bl  ; add
    daa         ; adjust for BCD
ret
```

### Write a program  for Binary To Decimal Conversion 🎯

### Write a program  to find the factorial of a number

```asm
org 100h
    mov ax, 1h
    mov cx, 5h ; number to do factorial
    
count:
    mul cx
    loop count     
ret
```

### Write a program  for Decimal to Binary Conversion 🎯

### Write a program to add two 16 bit numbers

```asm
org 100h
    mov ax, 1234h ; first 16-bit number
    mov bx, 0020h ; second 16-bit number
    add ax, bx    ; add bx to ax
ret
```

### Some basic computing code

Not sure!

## Misc

### Printing digits

```asm
org 100h

    mov dx, 1234     ; the decimal number you want to print
    call print_dec   ; print DX as decimal

    mov ah, 4Ch      ; exit to DOS
    int 21h

;-----------------------------------------------------
; print_dec: prints the 16-bit unsigned number in DX
;-----------------------------------------------------
print_dec:
    push ax
    push bx
    push cx
    push dx

    mov ax, dx       ; number to AX for division
    xor cx, cx       ; digit count = 0
    mov bx, 10       ; divisor for decimal

.next_digit:
    xor dx, dx       ; clear remainder
    div bx           ; AX ÷ 10 ? AX=quotient, DX=remainder
    push dx          ; store remainder (digit)
    inc cx
    test ax, ax
    jnz .next_digit  ; repeat until quotient = 0

.print_loop:
    pop dx           ; get a digit back
    add dl, '0'      ; convert to ASCII
    mov ah, 02h
    int 21h          ; print character
    loop .print_loop ; CX times

    pop dx
    pop cx
    pop bx
    pop ax
    ret
```
