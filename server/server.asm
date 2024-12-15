section .data
    response db 'HTTP/1.1 200 OK', 13, 10
             db 'Content-Type: text/html', 13, 10
             db 'Content-Length: 12', 13, 10, 13, 10
             db 'Hello World!', 0
    response_len equ $ - response - 1

section .bss
    sockfd resd 1
    clientfd resd 1
    server_addr resb 16
    client_addr resb 16

section .text
    global _start

_start:
    ; Socket creation
    mov eax, 102; socketcall
    mov ebx, 1; socket subfunction
    push dword 0; protocol
    push dword 1; SOCK_STREAM
    push dword 2  ;   AF_INET
    mov ecx, esp
    int 0x80
    mov [sockfd], eax