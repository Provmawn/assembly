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
	input_format 		db "%lf", 0
	input_integer 		db "%ld", 0
	start_prompt 		db "This program will automate finding the resistance in a large circuit.",10, 0
	
	get_prompt1 		db "Separate the inputs by white spaces and press enter after last value: ",10, 0		

	ns_prompt		db "which requires %ld ns to compute.", 10,0

	blank_line 		db " ", 10,0
	exit 			db "The resistance of the system will be returned to the driver.",10, 0

segment .bss  ;Reserved for unitialized data
circuit1 resq 1
circuit2 resq 1
circuit3 resq 1
circuit4 resq 1



segment .text ;Reserved for excuting instructions

resistance:
;======== Insurance for any caller of this assembly module =========

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

;============= Get Sides =============
;Display prompt message for inputs

mov rax, 0			
mov rdi, start_prompt		;"This program will automate finding the resistance in a large circuit."
call printf			

mov rax, 0
mov rdi, get_prompt1		;"Separate the inputs by white spaces and press enter after last value:"
call printf

;call get_resistance
mov rax, 0
mov rdi, circuit1
mov rsi, circuit2
mov rdx, circuit3
mov rcx, circuit4
call get_resistance

;===============Compute Area================

movsd xmm12, [circuit1]
movsd xmm13, [circuit2]
movsd xmm14, [circuit3]
movsd xmm15, [circuit4]

;Read the clock and save the number
cpuid
rdtsc
shl rdx, 32
or rdx,rax
mov r14, rdx

;call compute_resistance
mov rax, 4
movsd xmm0, xmm12
movsd xmm1, xmm13
movsd xmm2, xmm14
movsd xmm3, xmm15	
call compute_resistance
movsd xmm11, xmm0

;Read the clock and save the number
cpuid
rdtsc
shl rdx, 32
or rdx,rax
mov r15, rdx
;===============Show Results=================

;call show_resistance
mov rax,1
movsd xmm0, xmm11
call show_resistance

;Subtract the two clock values and output ns with out calling any function.
sub r15, r14			;r15 = r15-r14
mov rax, 0
mov rdi, ns_prompt		;"which requires %ld ns to compute."
mov rsi, r15
call printf

mov rax, 0
mov rdi, exit			;"The resistance of the system will be returned to the driver."
call printf

;===============Pop Everything==============
movsd xmm0, xmm11

;pop backwards
;Pop back to destination

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
