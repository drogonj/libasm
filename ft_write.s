
extern __errno_location

section .text
 global ft_write
 default rel

ft_write:
 mov rax, 1
 syscall
 test rax, rax
 js __error
 ret

__error:
 mov rdi, rax
 neg rdi
 call __errno_location WRT ..plt
 mov rax, -1
 ret
