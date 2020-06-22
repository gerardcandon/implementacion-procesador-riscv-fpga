.text
entry:
	la  sp,__sp		# sp: x2

	#definimos el thread inicial
	la a2, 0x6000000    # DATA_SYS, CUR_THREAD
	sw x0, 0(a2)	  # CUR_THREAD = 0
	
	#definimos el CP y el SP del Thread 0 en el TCB0 y en mepc
	addi sp,sp,-124	  # Reservamos 124 bytes en la pila
	la a2, main
	la a1, 0x03000404 # 0x03000404, @CP del TCB0
	sw a2, 0(a1)
	sw sp, 4(a1)	  # 0x03000408, @SP del TCB0
	csrw mepc, a2

	#Definimos el CP y el SP del Thread 1 en el TCB1
	la a3, 0x03000900 # sp del Thr1
	addi a3, a3, -124 # Reservamos 124 bytes en la pila
	la a2, main2
	la a1, 0x03000904 # 0x03000904, @CP del TCB1
	sw a2, 0(a1)
	sw a3, 4(a1)      # 0x03000908, @SP del TCB1

	lui a1, 0x8000  # 0x08000000, controlador de PS/2
	addi a2, x0, 0x01
	sw a2, 4(a1)	# Activamos las interrupciones por teclado
	
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
	mret
	nop
	nop
	nop
	nop
	nop
	ebreak
