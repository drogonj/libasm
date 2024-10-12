section .text
 global ft_strlen
 default rel

ft_strlen:
 mov rax, 0
 jmp __counter

__counter:
 cmp byte[rdi + rax], 0
 je __return

 inc rax
 jmp __counter

__return:
 ret
