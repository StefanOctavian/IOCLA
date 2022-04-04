%include "printf32.asm"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139
    mov ebx, 169
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    mov ecx, eax
    or ecx, ebx  ; reuniunea dintre eax si ebx
    PRINTF32 `Reuniunea este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    or ecx, 768  ; adauga 2 noi elemente la multime
    PRINTF32 `Cu inca doua elemente: \x0`
    PRINTF32 `%u\n\x0`, ecx

    mov edx, eax
    and edx, ebx  ; intersectia celor doua multimi
    PRINTF32 `Intersectia celor doua multimi este: \x0`
    PRINTF32 `%u\n\x0`, edx

    mov ecx, eax
    not ecx  ; complementul multimii eax
    PRINTF32 `Complementul primei multimi este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    sub eax, 1  ; elimina elementul 0
    PRINTF32 `Din prima multime s-a eliminat un element: \x0`
    PRINTF32 `%u\n\x0`, eax

    mov ecx, eax
    mov edx, ebx
    not edx
    and ecx, edx  ; diferenta EAX \ EBX <-> EAX & ~EBX
    PRINTF32 `Diferenta de multimi: \x0`
    PRINTF32 `%u\n\x0`, ecx

    xor eax, eax
    ret
