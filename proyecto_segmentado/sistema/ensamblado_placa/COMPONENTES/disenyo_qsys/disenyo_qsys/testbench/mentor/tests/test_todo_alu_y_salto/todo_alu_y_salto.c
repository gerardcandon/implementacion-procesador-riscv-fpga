int __attribute((naked)) main(void) {
asm("lui x31, 0");
while (1) {
	asm("addi x31, x31, 1");
	asm("addi x1, x0, 0x1");
	asm("addi x2, x0, 0x1");
	asm("add x3, x1, x2");
	asm("add x4, x2, x3");
	asm("add x5, x3, x4");
	asm("add x6, x4, x5");
	asm("add x7, x5, x6");
	asm("add x8, x6, x7");
	asm("add x9, x7, x8");
	asm("add x10, x8, x9");
	asm("add x11, x9, x10");
	asm("add x12, x10, x11");
	asm("add x13, x11, x12");
	asm("add x14, x12, x13");
	asm("add x15, x13, x14");
	asm("add x16, x14, x15");
	asm("add x17, x15, x16");
	asm("add x18, x16, x17");
	asm("add x19, x17, x18");
	asm("add x20, x18, x19");
	asm("add x21, x19, x20");
	asm("add x22, x20, x21");
	asm("add x23, x21, x22");
	asm("add x24, x22, x23");
	asm("add x25, x23, x24");
	asm("add x26, x24, x25");
	asm("add x27, x25, x26");
	asm("add x28, x26, x27");
	asm("add x29, x27, x28");
	asm("add x30, x28, x29");
}
}