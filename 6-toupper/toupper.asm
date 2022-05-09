section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcdefghij", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]  ; string to be uppered
    xor ecx, ecx

up_one_char:

    sub byte [eax + ecx], 0x20
    inc ecx
    cmp byte [eax + ecx], 0
    jne up_one_char

    leave
    ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
