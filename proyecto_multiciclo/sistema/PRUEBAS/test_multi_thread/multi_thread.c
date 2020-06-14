#define mascara   0x0000FFFF
// operandos de 16 bits, resultado de 32 bits
// base 4

unsigned int mult(unsigned int multiplicando, unsigned int multiplicador)
{
   unsigned int bit, bit1;
   unsigned int tmando, tmador, tmp;
   int i;

   tmando = multiplicando & mascara;
   tmando = tmando <<14;
   tmador = multiplicador & mascara;
 
  for (i=0; i < 8; i++){
     bit = tmador & 1;
     bit1 = (tmador >>1) & 1;
     tmador = tmador >> 2;

     tmp=0;
     if (bit == 1) tmp = tmando;
     if (bit1 == 1) tmp = tmp + (tmando<<1);
     tmador = tmador + tmp;
  }
  return tmador;
}

unsigned int factorial (unsigned int n)
{
	if (n < 2)  return 1;
	return mult(n,factorial(n-1));
}

unsigned int n1 = 5, n2 = 4, resultat1 = 0, resultat2 = 0, barrera1 = 0, barrera2 = 0;

int main(void)
{
	unsigned int tmp = factorial(n1);
	asm("ecall");
	barrera1 = 1;
	while (barrera2 == 0);
	resultat1 = tmp;
	while(1);
}

int main2(void)
{
	unsigned int tmp = factorial(n2);
	asm("ecall");
	barrera2 = 1;
	while(barrera1 == 0);
	resultat2 = tmp;
	while(1);
}
