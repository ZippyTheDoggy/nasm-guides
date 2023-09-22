global _start
section .text

strloop:
    cmp byte [R8], byte 10 ; does *ptr == 10
    inc R8                 ; ptr++
    jne strloop            ; if(!(*ptr == 10)) ptr = start + strlen(ptr++);
    dec R8                 ; ptr-- not needed in c++ since conditional but needed in asm
    ret                    ; return ptr

strlen:
    pop R8          ; char* ptr
    mov R9, R8      ; char* start
    call strloop    ; loop(ptr)
    sub R8, R9      ; ptr -= start
    push R8         ; return ptr
    ret

_start:
    push message    
    call strlen       ; strlen(char* start)

    mov rax, 1        ; syscall write
    mov rdi, 1        ; file desc for stdout
    mov rsi, message  ; char* to beginning
    pop rdx           ; length of string
    syscall

    mov rax, 60       ; syscall exit
    mov rdi, 0        ; error code for exit
    syscall

section .data
    message: db "Hello!", 10