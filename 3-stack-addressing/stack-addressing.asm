%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ;push 0
    sub esp, 1
    mov byte [esp], 0
    ;push "mere"
    sub esp, 4
    mov dword [esp], "mere"
    ;push "are "
    sub esp, 4
    mov dword [esp], "are "
    ;push "Ana "
    sub esp, 4
    mov dword [esp], "Ana "

    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    mov ebx, esp

print_stack:

    xor eax, eax
    mov al, byte [ebx]
    PRINTF32 `%p: %d\n\x0`, ebx, eax
    inc ebx
    cmp ebx, ebp
    jl print_stack

print_string:

    xor eax, eax
    mov al, byte [esp]
    PRINTF32 `%c\x0`, eax
    inc esp
    cmp eax, 0
    jne print_string

    PRINTF32 `\n\x0`

print_array:
    pop dword eax
    PRINTF32 `%d \x0`, eax
    cmp esp, ebp
    jl print_array

    PRINTF32 `\n\x0`

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
