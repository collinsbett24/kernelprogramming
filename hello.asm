section .text
    global _start   ;must be declared for linker (d)

_start:     ;tells linker entry pont
    mov edx,len     ;message length
    mov ecx,msg     ;message to write
    mov ebx,1       ;file decriptor (stdout)
    mov eax,4       ;system call number (sys_write)
    int 0x80        ;call kernel

    mov eax,1       ;system call number (sys_exit)
    int 0x80        ;call kernel

section .data
    msg db 'Hello, world. I am learning assembler language', 0xa ;string to be printed
    len equ $ - msg     ;length of the string