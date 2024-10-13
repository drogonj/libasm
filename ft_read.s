extern __errno_location

section .text
 global ft_read
 default rel

ft_read:
 mov rax, 0
 syscall
 test rax, rax
 js __return_error
 ret

__return_error:
 mov rdi, rax
 call __errno_location WRT ..plt
 neg rdi
 mov [rax], rdi
 mov rax, -1
 ret 
