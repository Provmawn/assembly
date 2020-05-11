extern printf, scanf, manager, reverse

global display_array

segment .data

display_message db "%ld ", 0
has_reversed db 10, "the array has been reversed", 10, 0

segment .bss 

segment .text

display_array:

push rbp
mov rbp, rsp



mov r14, rdi                        ; save size of array passed by caller program
mov r13, rsi                        ; save the pointer to the array passed by caller program

mov r12, 0                          ; initialize counter to 0

mov qword rax, 0
begin_loop:
mov rdi, display_message
mov qword rsi, [r13+8*r12]
call printf

cmp r12, r14                        ; cmp index, size of array
je loop_finished

inc r12                             ; increment counter by 1
jmp begin_loop

loop_finished:

mov rdi, r13                        ; param1
mov rsi, 0                          ; param2
mov rdx, r14                        ; param3
call reverse                        ; calls reverse c++ function

mov qword rax, 0
mov rdi, has_reversed
call printf

mov r12, 0                          ; initialize counter to 0

mov qword rax, 0
begin_loop_1:
mov rdi, display_message
mov qword rsi, [r13+8*r12]
call printf

cmp r12, r14
je loop_finished_1

inc r12                             ; increment counter by 1
jmp begin_loop_1

loop_finished_1:

pop rbp
ret
