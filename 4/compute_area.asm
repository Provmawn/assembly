extern printf
extern scanf
extern show_results

global compute_area

segment .data

initialmessage db "The manager is here to help you find the area of your triangle.", 10, "Input your 3 floating point numbers representing the sides of a triangle.", 10, "Separate each number with white space", 10, 0

stringformat db "%s", 0

printnums db "%ld %ld %ld", 10, 0

segment .bss
side1 resq 1
side2 resq 2
side3 resq 3

segment .text

compute_area:

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

movsd xmm10, [rdi]
movsd xmm11, [rsi]
movsd xmm12, [rdx]

;compute half of the perimeter
movsd xmm13, xmm10
addsd xmm13, xmm11
addsd xmm13, xmm12
mov r15, 2
cvtsi2sd xmm9, r15
divsd xmm13, xmm9

; compute area with heron formula
movsd xmm0, xmm13
movsd xmm1, xmm13
movsd xmm2, xmm13

subsd xmm0, xmm10
subsd xmm1, xmm11
subsd xmm2, xmm12

mulsd xmm0, xmm1
mulsd xmm0, xmm2
mulsd xmm0, xmm13

sqrtsd xmm0, xmm0

movsd xmm13, xmm0

; call show_results
mov rax, 4
movsd xmm0, xmm10
movsd xmm1, xmm11
movsd xmm2, xmm12
movsd xmm3, xmm13
call show_results


movsd xmm0, xmm13

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

