;%include "debug.inc"
extern printf, scanf
extern input_array, output_array, shift_left

global control                                  ; name of function

control:

segment .data                                   ; initialized data segment


msg1 db "The control function will help you.", 10, 0
msg2 db "Input your integer data with white space separating each number.", 10, 0
msg3 db "Press <enter> followed by -1 to terminate", 10, 0
msg4 db "This is array: ", 0
msg5 db "After shift left: ", 0

segment .bss                                    ; uninitialized data segment
array resq 100

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
push qword -1                       ; push 64bit number to have 16 pushes

mov qword rax, 0
mov rdi, msg1
call printf

mov qword rax, 0
mov rdi, msg2
call printf

mov qword rax, 0
mov rdi, msg3
call printf

mov qword rax, 0
mov rdi, array
call input_array                    ; return size of array
mov r15, rax                        ; store size of array used

mov qword rax, 0
mov rdi, msg4
call printf

mov rdi, array
mov rsi, r15
call output_array

mov rdi, array
mov rsi, r15
call shift_left                     ; shift_left 1

mov qword rax, 0
mov rdi, msg5
call printf

mov rdi, array
mov rsi, r15
call output_array

mov rdi, array
mov rsi, r15
call shift_left                     ; shift_left 2

mov qword rax, 0
mov rdi, msg5
call printf

mov rdi, array
mov rsi, r15
call output_array

mov rdi, array
mov rsi, r15
call shift_left                     ; shift_left 3

mov qword rax, 0
mov rdi, msg5
call printf

mov rdi, array
mov rsi, r15
call output_array

mov qword rax, [array]                      ; sets the return value in rax

;=== restore all of the GPRs ===
pop r15                                 ; pop random value that was stored         
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

