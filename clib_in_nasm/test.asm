global main
extern puts

section .text
    main:
        sub rsp, 28h
        mov rdi, message
        call puts
        add rsp, 28h ; shadow space for windows??
        ret
section .data
    message: db "Hello, World", 0    ; \n in GCC is 0