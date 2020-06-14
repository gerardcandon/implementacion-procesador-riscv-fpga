.text
entry:
                #
                # Setup stack to the address configured in the linker script.
                # ld(1) takes care of inserting additional instructions
                # before startMain gets going in order to make sp = __sp
                #
	la  sp,__sp		# sp: x2
	la  sp,__sp		# sp: x2
	addi sp,sp,-32	# Allocate 32 bytes of stack space
	call main
	nop
	nop
	nop
	nop
	nop
	ebreak
