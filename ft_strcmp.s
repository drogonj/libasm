section .text
 global ft_strcmp
 default rel

ft_strcmp:	;args: rdi, rsi
 xor rax, rax   ;faster than 'mov rax, 0'
 jmp __cmp

__cmp:
 movzx rdx, byte[rdi + rax]
 movzx rcx, byte[rsi + rax]
 cmp rcx, 0
 je __both_null

 sub rdx, rcx
 jne __return

 inc rax
 jmp __cmp

__both_null:
 cmp rdx, 0
 je __return

__return:
 xor rax, rax
 mov rax, rdx 
 ret
