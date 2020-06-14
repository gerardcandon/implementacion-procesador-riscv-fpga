int __attribute((naked)) main(void) {
	asm("lui x1, 0x04030");
	asm("addi x1, x1, 0x201");
	asm("sw x1, 0(x0)");
	asm("sh x1, 4(x0)");
	asm("sh x1, 6(x0)");
	asm("sb x1, 11(x0)");
	asm("sb x1, 10(x0)");
	asm("sb x1, 9(x0)");
	asm("sb x1, 8(x0)");

}
