unsigned int a1 = 1071, b1 = 462;
unsigned int a2 = 36, b2 = 24;
unsigned int barrera1 = 0, barrera2 = 0, mcd1 = 0, mcd2 = 0;

void main()
{
	while (a1 != b1)
	{
		if (a1 > b1) 
			a1 = a1 - b1;
		else
			b1 = b1 - a1;
	}
	asm("ecall");
	barrera1 = 1;
	while(barrera2 == 0);
	mcd1 = a1;
	while(1);
}

void main2()
{
	while (a2 != b2)
	{
		if (a2 > b2) 
			a2 = a2 - b2;
		else
			b2 = b2 - a2;
	}
	asm("ecall");
	barrera2 = 1;
	while(barrera1 == 0);
	mcd2 = a2;
	while(1);
}
