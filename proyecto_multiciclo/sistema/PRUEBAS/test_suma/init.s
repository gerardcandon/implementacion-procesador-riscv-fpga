.text
entry:
	la  sp,__sp		# sp: x2
	
	#definimos la direccion de retorno 
	addi sp,sp,-124	# Allocate 124 bytes of stack space
	la a2, main
	csrw mepc, a2

	lui a1, 0x8000  # 0x08000000, controlador de PS/2
	addi a2, x0, 0x01
	sw a2, 4(a1)	# Activamos las interrupciones por teclado
	mret
	nop
	nop
	nop
	nop
	nop
	ebreak
