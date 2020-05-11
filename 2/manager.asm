%include "debug.inc"
extern scanf, printf                        ; extern functions
extern malloc
extern display_array

global manager                               ; global function

segment .data                               ; initialized data segment

intro  db "This program will reverse your array of integers", 10, 0
prompt db "Enter a sequence of long integers separated by white space. After the last input press enter followed by Control+D:", 0
form_longint db "%ld", 0

segment .bss                                ; uninitialized data segment

array resq 100

segment .text                               ; instructions segment

manager:

;=== backup all of the GPRs ===
push rbp                                    ; backup base pointer
mov rbp, rsp                                ; advance base pointer to current stack frame
push rdi                                    ; backup rdi
push rsi                                    ; backup rsi
push rdx                                    ; backup rdx
push rcx                                    ; backup rcx
push r8                                     ; backup r8
push r9                                     ; backup r9
push r10                                    ; backup r10
push r11                                    ; backup r11
push r12                                    ; backup r12
push r13                                    ; backup r13
push r14                                    ; backup r14
push r15                                    ; backup r15
push rbx                                    ; backup rbx
pushf                                       ; backup rflags
push qword 0                                ; 16th push
; rax, rip, and rsp and not backed up

;=== create array with slots for seven 8-byte numbers ===
;mov qword rdi, 56                                 ; 7 quadword
;call malloc
;mov r15, rax                                ; malloc returns an address, save it in r15

;=== intro message ===
mov qword rax, 0                            ; "this program will reverse your array of integer"
mov rdi, intro
call printf

;=== input integers ===
mov r15, 0                                  ; initialize counter r15 to 0
begin_loop:
mov qword rax, 0                            ; not using floating point numbers
mov qword rdi, form_longint                 ; "%ld", 0
push qword 0                                ; place arbitrary value on the stack
mov qword rsi, rsp                          ; place stack pointer in second arg of scanf
call scanf
pop rax                                     ; pop stack value after calling scanf
showregisters r14
cdqe                                        ; change double word in eax to quadword in rax (converts signed bit from 32 to 64-bit)
cmp rax, -1                                 ; check for EOF
je continue         
mov [array+8*r14], rax
inc r14
jmp begin_loop

;=== display array
continue:                                   ; continue
showregisters r14
push qword 0
mov rdi, 7                               ; size of array
mov rsi, r15                                ; address of array
call display_array
pop rax 

;=== compute mean
mov r14, 0                                  ; initialize counter to 0
mov qword rax, 0
mov qword r13, 0
begin_loop_1:
add r13, [r15+8*r14]
cmp r14, 7
je continue_1
inc r14
jmp begin_loop_1

;=== return mean to caller ===
continue_1:
idiv r14

;=== restore all of the GPRs ===
pop r15                                    ; 16th pop
popf                                       ; restore rflags
pop rbx                                    ; restore rbx
pop r15                                    ; restore r15
pop r14                                    ; restore r14
pop r13                                    ; restore r13
pop r12                                    ; restore r12
pop r11                                    ; restore r11
pop r10                                    ; restore r10
pop r9                                     ; restore r9
pop r8                                      ; restore r8
pop rcx                                    ; restore rcx
pop rdx                                    ; restore rdx
pop rsi                                    ; restore rsi
pop rdi                                    ; restore rdi
pop rbp                                    ; restore base pointer

ret
