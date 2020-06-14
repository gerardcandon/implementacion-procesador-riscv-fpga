.text
entry:
                #
                # Setup stack to the address configured in the linker script.
                # ld(1) takes care of inserting additional instructions
                # before startMain gets going in order to make sp = __sp
                #
	la  sp,__sp		# sp: x2

	#definimos el thread inicial
	la a2, 0x6000000    # DATA_SYS, CUR_THREAD
	sw x0, 0(a2)	  # CUR_THREAD = 0
	
	#definimos el CP y el SP del Thread 0 en el TCB0 y mepc
	addi sp,sp,-124	# Allocate 124 bytes of stack space
	la a2, main
	la a1, 0x02000C00 # 0x02000C00, @CP del TCB0
	sw a2, 0(a1)
	sw sp, 4(a1)	  # 0x02000C04, @SP del TCB0
	csrw mepc, a2

	#Definimos el CP y el SP del Thread 1 en el TCB1
	la a1, 0x03000400 # 0x03000400, @CP del TCB1
	la a2, main2
	sw a2, 0(a1)
	la a2, 0x03000800 # sp del Thr1
	addi a2, a2, -124 # Allocate 124 bytes of stack space
	sw a2, 4(a1)      # 0x03000404, @SP del TCB1

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
