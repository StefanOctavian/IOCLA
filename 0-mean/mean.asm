%include "../utils/printf32.asm"

%define ARRAY_SIZE 13
%define DECIMAL_PLACES 5

section .data

    num_array dw 76, 12, 65, 19, 781, 671, 431, 761, 782, 12, 91, 25, 9
    decimal_point db ".",0


section .text

extern printf
global main
main:
    xor eax, eax
    mov ecx, ARRAY_SIZE

array_sum:
    xor edx, edx
    mov dx, [num_array + 2 * ecx - 2]
    add eax, edx
    loop array_sum

    PRINTF32 `Sum of numbers: %d\n\x0`, eax

    xor edx, edx
    mov ecx, ARRAY_SIZE
    div ecx

    PRINTF32 `Mean of numbers: %d\x0`, eax
    PRINTF32 `.\x0`

    mov ecx, DECIMAL_PLACES
compute_decimal_place:

    mov eax, edx
    mov edx, 10
    mul edx
    push ecx
    mov ecx, ARRAY_SIZE
    div ecx
    pop ecx

    PRINTF32 `%d\x0`, eax
    dec ecx
    cmp ecx, 0
    jg compute_decimal_place

    PRINTF32 `\n\x0`
    xor eax, eax
    ret
