;%include "debug.inc"
extern printf, scanf

global output_array                             ; name of function

output_array:

segment .data                                   ; initialized data segment

output db "%ld ", 0
newline db 10, 0

segment .bss                                    ; uninitialized data segment

segment .text

;=== backup all of the GPRs ===
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
push qword -1                                   ; push 64bit number to have 16 pushes

mov r15, rdi                                    ; save array starting address
mov r14, rsi                                    ; save array size

mov r13, 0                                      ; initialize counter to 0
begin_loop:
mov qword rax, 0
mov rdi, output
mov qword rsi, [r15+8*r13]
call printf
inc r13
cmp r13, r14
je finished_loop
jmp begin_loop
finished_loop:

mov qword rax, 0
mov rdi, newline
call printf

mov qword rax, r13                              ; sets the return value in rax

;=== restore all of the GPRs ===
pop r15                                         ; pop random value that was stored         
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


