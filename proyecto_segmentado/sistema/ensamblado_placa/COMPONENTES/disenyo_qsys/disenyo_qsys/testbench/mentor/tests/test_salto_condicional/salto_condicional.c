int __attribute((naked)) main(void) {
	int a, b, c;
	a = 0x80000000;
	b = 1;
	c = 1;
	//comprobamos instrucciones de salto que se cumplen
	if (a > b) asm("lui x2, 0xFFFF");
	if ((unsigned)a < (unsigned)b) asm("lui x2, 0xFFFF");
	if (b != c) asm("lui x2, 0xFFFF");
	//comprobamos instrucciones de salto que no se cumplen
	if (a < b) {
		if ((unsigned)a > (unsigned)b) {
			if (b == c) {
				while (1);
			}
		}
	}
	asm("lui x2, 0xFFFF");
}
