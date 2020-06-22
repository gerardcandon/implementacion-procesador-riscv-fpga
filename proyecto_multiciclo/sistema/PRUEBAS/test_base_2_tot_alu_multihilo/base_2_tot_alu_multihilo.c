#define mascara   0x0000FFFF

// operandos de 16 bits, resultado de 32 bits
// base 2

unsigned int mult(unsigned int multiplicando, unsigned int multiplicador)
{
   unsigned int bit;
   unsigned int tmando, tmador, tmp;
   int i;

   tmando = multiplicando <<15;
   tmador = multiplicador & mascara;

  for (i=0; i < 16; i++){
     bit = tmador & 1;
     tmador = tmador >>1;

     tmp=0;
     if (bit == 1) tmp = tmando;
      tmador = tmador + tmp;
  }
  return tmador;
}

unsigned int multiplicando1, multiplicando2, multiplicador1, multiplicador2, resultado1 = 0, resultado2 = 0, barrera1 = 0, barrera2 = 0;


void main()
{

   int tmp;
   multiplicando1 = 128;
   multiplicador1 = 2;

    tmp = mult(multiplicando1, multiplicador1);
    asm("ecall");
    barrera1 = 1;
    while(barrera2 == 0);
    resultado1 = tmp;
    while(1);

}

void main2()
{
   int tmp;
   multiplicando2 = 64;
   multiplicador2 = 6;

    tmp = mult(multiplicando2, multiplicador2);
    asm("ecall");
    barrera2 = 1;
    while(barrera1 == 0);
    resultado2 = tmp;
    while(1);
}

	


