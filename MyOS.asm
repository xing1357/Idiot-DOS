[bits 16]
[org 0x7c00]


Start:
	mov si, Intro
	call print_string
	call newLine
	call username_input
	
	
	
commandLine:
	call newLine
	mov si,command
	call print_string
	call CommandLineLoop


username_input:
	call newLine
	mov si, username
	call print_string
	.Loop:
		mov ax,0x00
		int 0x16
		cmp ah,0x1C
		je password_input
		mov ah,0x0E
		int 0x10
		jmp .Loop

password_input:
	call newLine
	mov si, password
	call print_string
	.Loop:
		mov ax,0x00
		int 0x16
		cmp ah,0x1C
		je commandLine
		mov si,password_symbol
		call print_string
		int 0x10
		jmp .Loop


	
	
	
	
CommandLineLoop:  
    mov ax,0x00  
    int 0x16  
 
	cmp al,0x68
    je displayHelp
	
		
	cmp al,0x31

	je displayVersion

	cmp al,0x1B

	je username_input

	cmp al,0x32

	je textEditor

	cmp al,0x73
	
	je Shutdown

	cmp al,0x61
	je thing

	


	
	
	jmp CommandLineLoop
	

  
exitLoop:  
        ret

thing:
	jmp username_input

displayHelp:
	call displayChar
	call newLine
	mov si,command_help
	call print_string
	call newLine
	mov si,command_help1
	call print_string
	call newLine
	mov si,command_shutdown
	call print_string
	call newLine
	mov si,command_help2
	call print_string
	jmp commandLine

displayVersion:
	call displayChar
	call newLine
	mov si,command_version
	call print_string
	jmp commandLine




Shutdown:
    mov ax, 0x1000
    mov ax, ss
    mov sp, 0xf000
    mov ax, 0x5307
    mov bx, 0x0001
    mov cx, 0x0003
    int 0x15



%INCLUDE "helper/data.asm"
%INCLUDE "helper/helper.asm"
%INCLUDE "programs/programs.asm"



times (510-($-$$)) db 0
dw 0xaa55