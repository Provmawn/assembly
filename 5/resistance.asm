extern printf
extern scanf
extern get_sides
extern compute_area

global triangle

segment .data

initialmessage db "The manager is here to help you find the area of your triangle.", 10, "Input your 3 floating point numbers representing the sides of a triangle.", 10, "Separate each number with white space", 10, 0

stringformat db "%s", 0

completionmessage db "The area will be returned to Heron.", 10, 0

ticstringformat db "%ld", 10, 0

segment .bss
side1 resq 1
side2 resq 1
side3 resq 1

segment .text

triangle:

push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rsi
push rdi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

mov qword rax, 0
mov rdi, stringformat
mov rsi, initialmessage
call printf

mov rax, 0
mov rdi, side1
mov rsi, side2
mov rdx, side3
call get_sides
; back up
mov r13, [side1]
mov r14, [side2]
mov r15, [side3]
; copy to xmm registers
movsd xmm10, [side1]
movsd xmm11, [side2]
movsd xmm12, [side3]

;FIX
cpuid
rdtsc
shl rdx, 32
or rdx, rax
mov r13, rdx
;

mov rax, 0
mov rdi, side1
mov rsi, side2
mov rdx, side3
call compute_area

; FIX
cpuid
rdtsc
shl rdx, 32
or rdx, rax
mov r14, rdx

mov r13, rax
sub rax, r14
mov r10, 10
imul r10
mov r11, 32
idiv r11

mov r15, rax

mov qword rax, 0
mov rdi, ticstringformat
mov rsi, r15
call printf
;

movsd xmm10, xmm0

mov qword rax, 0
mov rdi, completionmessage
call printf

movsd xmm0, xmm10

popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rdi
pop rsi
pop rdx
pop rcx
pop rbx
pop rbp


ret
