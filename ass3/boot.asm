[org 0x7c00]	;no idea
mov ah, 0x0e	;what this does
jmp menu

menu:
	pusha			;cle-
	mov ah, 0x00	;ar
	mov al, 0x03  	;the
	int 0x10		;scr-
	popa			;een
	mov ah, 0x0e	;
	mov al, 13		;
	int 0x10		;
	mov al, 10		;
	int 0x10		;
	mov ax, 0		;
	int 0x16		;
	mov ah, 0x0e	;
	int 0x10		;
	cmp al, '1'		;if keyboard 1
	je one			;jump to one
	cmp al, '2'		;if keyboard 2
	je two			;jump to two
	cmp al, 27		;if keyboard esc
	je exit			;jump to exit
	jmp menu		;jump to oscreen

one:
	mov ah, 0x0e 
	mov al, 13
	int 0x10
	mov al, 10
	int 0x10
	jmp menu	
	
two:
	mov ah, 0x0e 
	mov al, 13
	int 0x10
	mov al, 10
	int 0x10
	jmp menutwo	

menutwo:
	pusha
	mov ah, 0x00
	mov al, 0x03  
	int 0x10
	popa
	jmp twomenu
	twomenu:
		mov ax, 0
		int 0x16
		mov ah, 0x0e
		int 0x10
		cmp al, 27
		je menu
		cmp al, 13
		je twonew_line
		jmp twomenu
	
	twonew_line:
		mov ah, 0x0e ; Enter writing mode
		mov al, 13
		int 0x10
		mov al, 10
		int 0x10
		jmp twomenu
		
	jmp twomenu



exit:
	jmp $

times 510-($-$$) db 0	;
dw 0xaa55		;end
