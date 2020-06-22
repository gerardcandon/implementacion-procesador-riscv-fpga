.text
entry:
	la  sp,__sp		# sp: x2
	
	addi sp,sp,-124	   # Reservamos 124 bytes en la pila

	add x5, x0, x0	   #inicializamos a 0 los registros
	add x6, x0, x0
	add x7, x0, x0
	add x8, x0, x0
	add x9, x0, x0
	add x10, x0, x0
	add x11, x0, x0
	add x12, x0, x0
	add x13, x0, x0
	add x14, x0, x0
	add x15, x0, x0
	add x16, x0, x0
	add x17, x0, x0
	add x18, x0, x0
	add x19, x0, x0
	add x20, x0, x0
	add x21, x0, x0
	add x22, x0, x0
	add x23, x0, x0
	add x24, x0, x0
	add x25, x0, x0
	add x26, x0, x0
	add x27, x0, x0
	add x28, x0, x0
	add x29, x0, x0
	add x30, x0, x0
	add x31, x0, x0
	call main
	nop
	nop
	nop
	nop
	nop
	ebreak

