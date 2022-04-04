%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    byeString: db "Goodbye, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6                      ; N = valoarea registrului ecx
    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jg print                        ; TODO1: eax > ebx?
    ret

print:
    PRINTF32 `%s\n\x0`, myString
    sub ecx, 1
    test ecx, ecx
    jg print
    PRINTF32 `%s\n\x0`, byeString

    ret
