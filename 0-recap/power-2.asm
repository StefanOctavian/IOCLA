%include "../utils/printf32.asm"

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power
    
puterea:
    test eax, ebx
    jnz afisaza_puterea

shift:
    shl ebx, 1
    cmp ebx, eax
    jle puterea
    jg  final

afisaza_puterea:
    PRINTF32 `%u\n\x0`, ebx
    jmp shift

final:
    leave
    ret
