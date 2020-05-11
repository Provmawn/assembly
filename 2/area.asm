extern printf, scanf                ; declare extern functions

global area                         ; make this callable by other programs

                                    ; declare constants

segment .data                        ; declare strings

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



; restore backed up registers
pop rax
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

mov qword rax, 0                    ; ? why is this necessary

ret
