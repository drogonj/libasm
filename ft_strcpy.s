section .text
 global ft_strcpy
 default rel

ft_strcpy:
 mov rax, 0
 jmp __fill 

__fill:
 cmp byte[rsi + rax], 0
 je __return

 mov dl,[rsi + rax]
 mov [rdi + rax], dl
 inc rax
 jmp __fill

__return:
 mov byte[rdi + rax], 0
 mov rax, rdi
 ret
