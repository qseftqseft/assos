[org 0x7c00]
mov ah, 0x0e

onscreen:
	mov ax, 0
	int 0x16
	mov ah, 0x0e
	int 0x10
	cmp al, 13
	je new_line
	jmp onscreen

new_line:
  mov ah, 0x0e ; Enter writing mode
  mov al, 13
  int 0x10
  mov al, 10
  int 0x10
  jmp onscreen

times 510-($-$$) db 0
dw 0xaa55
