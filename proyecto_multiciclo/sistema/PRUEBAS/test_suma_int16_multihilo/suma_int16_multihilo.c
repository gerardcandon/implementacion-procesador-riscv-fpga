int s1=0, s2=0;
short int x1[10] = {1,2,3,4,5,6,7,8,9,10};
short int x2[10] = {11,12,13,14,15,16,17,18,19,20};

void main()
{
  int i;
  for (i=0;i<10;i++)
    s1 += x1[i];
  asm("ecall");
  while(1);
}

void main2()
{
  int i;
  for (i=0;i<10;i++)
    s2 += x2[i];
  asm("ecall");
  while(1);
}
