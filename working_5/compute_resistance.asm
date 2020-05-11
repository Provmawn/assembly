;Anna Chiu
;CCWID: 888641818
;Project 5

;=============== Begin code area ===========

extern printf
extern scanf
global resistance
extern get_resistance
extern show_resistance 
extern compute_resistance

segment .data
intergerform 		db "%lf", 0
space			db " ", 0
blank_line 		db " ", 10,0

segment .bss
;Nothing Here

segment .text
;Blank

compute_resistance:
;=============Insurance for any caller of this assembly module =========

push rbp
push rdi
push rsi				;Backup rsi
push rdx				;Backup rdx
push rcx				;Backup rcx
push r10
push r11
push r12				;Backup r12
push r13				;Backup r13
push r14				;Backup r14
push r15				;Backup r15

;============ Computing ==============

movsd xmm15, xmm3 
movsd xmm14, xmm2
movsd xmm13, xmm1
movsd xmm12, xmm0

mov rbx, 0x3ff0000000000000	;1.0
push rbx
movsd xmm10, [rsp]
pop rbx			;xmm10 hold 1.0

movsd xmm4, xmm10	
movsd xmm5, xmm10
movsd xmm6, xmm10
movsd xmm7, xmm10	

;calcuate circuit	
divsd xmm4, xmm12       ;xmm4 = xmm4/xmm12
divsd xmm5, xmm13       ;xmm5 = xmm5/xmm13
divsd xmm6, xmm14       ;xmm6 = xmm6/xmm14
divsd xmm7, xmm15       ;xmm7 = xmm7/xmm15 //has problems

;calculate citcuit	r = r1 + r2 + r3 +r4
movsd xmm11, xmm4    	 
addsd xmm11, xmm5
addsd xmm11, xmm6
addsd xmm11, xmm7

divsd xmm10, xmm11

;=============== Pop Everything ================

movsd xmm0, xmm10


;pop backwards
;pop back to destination

pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret