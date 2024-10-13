extern __errno_location
extern malloc
extern ft_strlen
extern ft_strcpy

section .text
 global ft_strdup
 default rel

ft_strdup:
 mov r12, rdi		;r12-r15 saves values beetweens call (see: System V AMD64 convention)
			;We could also save rdi in stack and pop it later
 call ft_strlen
 inc rax
 mov rdi, rax		;0xFFFFFFFFFFFFFFFF to test errno

 call malloc WRT ..plt
 test rax, rax
 je __return_error

 mov rdi, rax
 mov rsi, r12
 call ft_strcpy
 ret

__return_error:
 call __errno_location WRT ..plt
 mov qword[rax], 12
 xor rax, rax
 ret
