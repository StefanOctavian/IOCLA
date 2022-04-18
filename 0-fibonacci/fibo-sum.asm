%include "../utils/printf32.asm"

section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    aux dd 0
    print_format_1 db "Sum first %d", 10, 0
    print_format_2 db "fibo is %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    push dword [N]
    push print_format_1
    call printf
    add esp, 8

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor eax, eax     ;store the sum in eax

    mov ecx, [N]
    mov ebx, 0
    mov edx, 1
fiboloop:
    add eax, edx
    add ebx, edx
    mov [aux], ebx
    mov ebx, edx
    mov edx, [aux]
    loop fiboloop

    push eax
    push print_format_2
    call printf
    add esp, 8

    xor eax, eax
    leave
    ret
