textEditor:
	call displayChar
	call newLine
	mov si,textEditorTitle
	call print_string
	call newLine
	.Loop:
		mov ax,0x00
		int 0x16
		cmp ah,0x01
		je commandLine
		call displayChar
		jmp .Loop