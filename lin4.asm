; lin4.asm
extern printf
extern scanf
section .data
	msg db 'enter two numbers:',0
	fmt dq "%lf %lf",10,0
	re  dq "result = %.2lf",10,0
section .bss
	res resq 64
section .text
global main
main:
push   rbp
mov    rbp,rsp
   sub    rsp,0x20
   mov    rax,QWORD 0x28
   mov    QWORD [rbp-0x8],rax
   xor    eax,eax
   lea    rax,[msg]       
   mov    rdi,rax
   mov    eax,0x0
   call   printf
   lea    rdx,[rbp-0x18]
   lea    rax,[rbp-0x20]
   mov    rsi,rax
   lea    rax,[fmt]        
   mov    rdi,rax
   mov    eax,0x0
   call   scanf
   movsd  xmm1,QWORD [rbp-0x20]
   movsd  xmm0,QWORD [rbp-0x18]
   mulsd  xmm0,xmm1
   movsd  QWORD [rbp-0x10],xmm0
   mov    rax,QWORD [rbp-0x10]
   movq   xmm0,rax
   lea    rax,[re]       
   mov    rdi,rax
   mov    eax,0x1
   call   printf

   mov    eax,0x0
   mov	  rdx,QWORD [rbp-0x8]
   sub    rdx,QWORD 0x28
leave
ret