int s=0;
short int x[10] = {1,2,3,4,5,6,7,8,9,10};

void main()
{
  int i;
  s=0;
  for (i=0;i<10;i++)
    s += x[i];
  asm("ecall");
  while(1);
}
