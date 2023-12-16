SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    num1 equ '9'
    num2 equ '5'
    msg  db  "The result is: "
    len  equ $-msg

section .bss
    result resb 2

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax,      num1
    sub eax,      '0'
    mov ebx,      num2
    sub ebx,      '0'
    sub eax,      ebx
    add eax,      '0'
    mov [result], eax
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, result
    mov edx, 2
    int 0x80

    mov eax, SYS_EXIT
    int 0x80


