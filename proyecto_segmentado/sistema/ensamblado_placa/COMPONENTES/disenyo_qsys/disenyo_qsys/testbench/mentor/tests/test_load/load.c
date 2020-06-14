int __attribute((naked)) main(void) {
	int *ptr;
	ptr = (int *)0x60;
	*ptr = 0x04838201;
	asm("lw  x1 , 0x60(x0)");
	asm("lhu x2 , 0x60(x0)");
	asm("lhu x3 , 0x62(x0)");
	asm("lh  x4 , 0x60(x0)");
	asm("lh  x5 , 0x62(x0)");
	asm("lbu x6 , 0x60(x0)");
	asm("lbu x7 , 0x61(x0)");
	asm("lbu x8 , 0x62(x0)");
	asm("lbu x9 , 0x63(x0)");
	asm("lb  x10, 0x60(x0)");
	asm("lb  x11, 0x61(x0)");
	asm("lb  x12, 0x62(x0)");
	asm("lb  x13, 0x63(x0)");
}
