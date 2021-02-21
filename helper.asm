print_string:
	mov ah,0x0E

	.Loop:
		lodsb
		cmp al,0
		je .Exit
		int 0x10
		jmp .Loop
.Exit:
	ret

displayChar:
	mov ah,0x0E             
	int 0x10 

newLine:
	mov ah, 0x0E        
    	mov al, 0x0D
    	mov bh, 0x00
    	mov bl, 0x07
    	int 0x10
    	mov ah, 0x0E        
    	mov al, 0x0A
    	mov bh, 0x00
    	mov bl, 0x07
    	int 0x10
    	ret