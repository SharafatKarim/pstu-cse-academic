# Assembly Language Programs

## Problemsets

### Sample equation by Chinmoy Sir

$\frac{3X^2 + 2X - 5}{2X^2 - 1}$

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
.model small
.stack 100h
.data
    input db 20           ; Max length (19 chars + Enter)
.model small
.stack 100h
.data
    var db 'hi there,$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9h
    lea dx, var
    int 21h
main endp
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

```asm
.model small
.stack 100h
.data
result db 0
.code
main proc
    mov ax,@data
    mov ds,ax


    mov ah,1
    int 21h
    sub al,30h
    mov bl,al   ; b3

    mov ah,1
    int 21h
    sub al,30h
    mov bh,al   ; b2

    mov ah,1
    int 21h
    sub al,30h
    mov cl,al   ; b1

    mov ah,1
    int 21h
    sub al,30h
    mov ch,al   ; b0

    ; ---- result initialize ----
    mov result,0

    ; b3 * 8
    mov al,bl
    mov ah,0
    mov dl,8
    mul dl
    add result,al

    ; b2 * 4
    mov al,bh
    mov ah,0
    mov dl,4
    mul dl
    add result,al

    ; b1 * 2
    mov al,cl
    mov ah,0
    mov dl,2
    mul dl
    add result,al

    ; b0 * 1
    add result,ch

    ; ---- print result ----
    mov al,result
```

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

```asm
.model small
.stack 100h
.data
    decnum db 0
    binstr db '0000$'    ; store 4-bit binary as string
.code
main proc
    mov ax,@data
    mov ds,ax

    ; input one decimal digit (0–15 only)
    mov ah,1
    int 21h
    sub al,30h       ; convert ASCII -> number
    mov decnum,al

    ; convert decimal to 4-bit binary
    mov cl,4         ; 4 bits
    mov si,3         ; index into binstr from rightmost
    mov al,decnum

convert_loop:
    mov ah,0
    mov bl,2
    div bl           ; AL / 2 -> quotient in AL, remainder in AH
    add ah,30h       ; convert remainder to ASCII
    mov binstr[si],ah
    dec si
    loop convert_loop

    ; print result
    mov ah,9
    lea dx,binstr
    int 21h

    mov ah,4ch
    int 21h
main endp
end main
```

### Write a program to add two 16 bit numbers

```asm
org 100h
    mov ax, 1234h ; first 16-bit number
    mov bx, 0020h ; second 16-bit number
    add ax, bx    ; add bx to ax
ret
```

### Multiplication with repeated actions

```asm
.MODEL SMALL
.STACK 100H

.DATA

.CODE
Main PROC
    mov cx, 3h
    mov ax, 1h
    mov bx, 2h
  repeat:
    mul bx
    dec cx
    cmp cx, 0h
    jne repeat
Main ENDP

END Main
```

### Some basic computing code

Not sure!

## Misc

### Input/ Output

Single digit,

```asm
.MODEL Small
.STACK
.DATA
    CR EQU 0DH
    LF EQU 0AH
    SPACE EQU 20H

    N DB ?

    enterAChar DB 'enter a character:', cr, lf, '$'
    message DB 'hi there,', cr, lf, '$'
    askName DB 'what is your name?', cr, lf, '$'

    nameIT DB 100, ?, 100 DUP(?)
    yourName DB 'Your name is : ', cr, lf, '$'
.CODE
Main PROC
    mov ax, @data
    mov ds, ax

    lea dx, message
    call PrinterXL

    lea dx, enterAChar
    call PrinterXL

    call Scanner
    MOV N, DL

    mov dl, SPACE   ; space
    call Printer

    MOV DL, N
    call Printer

    mov dl, CR      ; newline
    call Printer
    mov dl, LF
    call Printer

    lea dx, askName
    call PrinterXL

    lea dx, nameIT
    call ScannerXL

    mov dl, CR      ; newline
    call Printer
    mov dl, LF
    call Printer

    lea dx, yourName
    call PrinterXL

    lea dx, nameIT
    call PrinterXL

    call Exit
Main ENDP

Scanner PROC NEAR USES ax ; INPUT -> DL
    mov ah, 01h
    int 21h
    mov dl, al
    ret
Scanner ENDP

Printer PROC NEAR USES ax ; DL -> OUTPUT
    mov ah, 02h
    int 21h
    ret
Printer ENDP

PrinterXL PROC NEAR USES ax ; DX addr -> OUTPUT
    mov ah, 09h
    int 21h
    ret
PrinterXl ENDP

ScannerXL PROC NEAR USES ax ; INPUT -> DX addr
    mov ah, 0Ah
    int 21h
    ret
ScannerXL ENDP

Exit PROC
    mov ax, 4c00h
    int 21h
Exit ENDP

END Main
```

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

### Template

```asm
; -----------------------------------------------------------------------------
; A basic template for a 16-bit MASM/TASM assembly program (.COM or .EXE)
; This template is for an .EXE file which has separate segments.
; -----------------------------------------------------------------------------

; --- Model Directive ---
; Defines the memory model.
; SMALL: 1 code segment (64K), 1 data segment (64K). Good for most simple programs.
.MODEL SMALL
.STACK 100h     ; Define the stack size (256 bytes)

; --- Data Segment ---
; All initialized and uninitialized variables go here.
.DATA
    ; Example initialized variable
    Message   DB  'Hello, world!', 0Dh, 0Ah, '$'  ; String terminated with $

    ; Example uninitialized variable
    UserInput DB  80 DUP(?)   ; A buffer to store 80 bytes

; --- Code Segment ---
; All executable instructions go here.
.CODE
; --- Main Procedure ---
; This is the main entry point for the program.
Main PROC
    ; --- Boilerplate: Set up Data Segment (DS) ---
    ; In an .EXE program, DS must be manually set to point to the .DATA segment.
    mov ax, @DATA       ; Get the address of the .DATA segment
    mov ds, ax          ; Set the Data Segment (DS) register

    ; --- Your Code Goes Here ---

    ; Example: Call a custom procedure
    ; We assume AX and CX might have important values before this call
    mov ax, 1234h
    mov cx, 5678h
    call MyProcedure
    ; After MyProcedure returns, AX and CX will still have
    ; 1234h and 5678h because the procedure saved them.

    ; Example: Print the 'Message' string using DOS interrupt 21h, function 09h
    lea dx, Message     ; Load Effective Address of Message into DX
    mov ah, 09h         ; Set DOS function 09h (print string)
    int 21h             ; Call DOS interrupt

    ; --- Program Exit ---
    ; This is the standard way to exit a DOS program and return to the command line.
    mov ax, 4C00h       ; Set DOS function 4C00h (Exit with return code 0)
    int 21h             ; Call DOS interrupt

Main ENDP

; --- Other Procedures ---
; It's good practice to define other procedures outside of Main.

; MyProcedure: A simple example procedure
; Description: This procedure demonstrates the NEAR type, the USES
;              directive, and how to preserve register values.
; Input: None
; Output: None
;
; PROC [type]:
;   - NEAR (default for .MODEL SMALL): The procedure is in the same
;     code segment. 'call' and 'ret' will be 'near' (push/pop IP only).
;   - FAR: The procedure is in a different code segment. 'call' and
;     'ret' will be 'far' (push/pop CS and IP).
;
; USES [reg1] [reg2] ...:
;   - This is a high-level MASM directive that automatically generates
;     PUSH instructions for the listed registers at the start of
;     the procedure and corresponding POP instructions just before
;     the 'ret'.
;   - This is critical for preserving the values of registers that
;     the main program (the "caller") might be using.
;
MyProcedure PROC NEAR USES ax cx
    ; The 'USES ax cx' directive automatically generates:
    ;   push ax
    ;   push cx
    ; ...at the beginning of the procedure.

    ; Procedure code would go here
    ; We are free to use AX and CX without worrying about
    ; messing up their values for the caller.
    mov cx, 10          ; Example: use CX for a loop counter
    mov ax, 0           ; Example: use AX as an accumulator

MyLoop:
    ; ... do something 10 times ...
    add ax, cx
    dec cx
    jnz MyLoop

    ; The assembler will automatically insert:
    ;   pop cx
    ;   pop ax
    ; ...right before the 'ret' instruction, restoring the original values.

    ret                 ; Return from procedure (pops return address from stack)
MyProcedure ENDP

; --- End of Program ---
; The 'END Main' directive tells the assembler where the program execution should start.
END Main
```
