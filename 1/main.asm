extern printf, scanf

global file                       ; name of function

file:

pi_numerator equ 22
pi_denominator equ 7

segment .data   ; ninitialized vars
msg1 db "This area function is fondly brought to you by Amman Sandhu", 10, 0
msg2 db "Please enter the radius of a circle in whole number of meters: ", 10, 0
msg3 db "The number %ld was received", 10, 0
msg4 db "The integer part of the area will be returned to the main program. Please enjoy your circles.", 10, 0

input1 db "%ld", 0

out1 db "The number entered was %ld", 10, 0
area db "The area of the circle is %ld", 10, 0

remainder_numerator db "remainder is %ld / ", 0
remainder_denominator db "%ld", 10, 0

segment .bss
; empty segment

segment .text

; back up registers
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf
push qword -1                       ; push 64bit number to have 16 pushes


mov qword rax, 0
mov rdi, msg1
call printf

mov qword rax, 0
mov rdi, msg2
call printf

mov qword rdi, input1
push qword -1                       ; push qword to top of stack
mov qword rsi, rsp                  ; rsi is now equal to the top of the stack
mov qword rax, 0            
call scanf                  
pop qword r15                       ; pop qword from scanf push

mov qword rdi, out1                 ; pint inputted integer
mov rsi, r15
mov qword rdx, r15
mov qword rax, 0
call printf

mov qword rax, r15                  ; mov r into rax
mov qword rdx, 0                    ; zero out high order bits

imul r15                            ; rax = r^2

mov r15, pi_numerator               ; rax = r^2 * 22
imul r15

mov r15, pi_denominator             ; rax = (r^2 * 22) / 7
cqo
idiv r15
mov r13, r15                        ; save denominator for remainder

mov r12, rax                        ; save the area in r12 to return later
mov r14, rdx                        ; save the remainder in r14

mov qword rdi, area                 ; print area from r12
mov rsi, r12
mov qword rdx, r12
mov qword rax, 0
call printf

mov qword rdi, remainder_numerator      ; print remaindor numerator
mov rsi, r14
mov qword rdx, r14
mov qword rax, 0
call printf

mov qword rdi, remainder_denominator    ; print remainder denominator
mov rsi, r13
mov qword rdx, r13
mov qword rax, 0
call printf

mov qword rdi, msg4                     ; output message
mov qword rax, 0
call printf

mov qword rax, r12                      ; sets the return value in rax

pop r15                                 ; pop random value that was stored         
; restore backed up registers
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret                                               ; pop the integer stack and jump to the address represented by the popped value
