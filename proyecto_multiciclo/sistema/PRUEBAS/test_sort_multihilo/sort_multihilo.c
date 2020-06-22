/* ordenación con el algoritmo de la burbuja */
 

int vector1[100] = {20, -18, 16, 17, 20, -9, 13, -10, 4, 2, 0, 2, 4, 10, -8, 13, 20, 18, 16, 19};
int vector2[100] = {-44, 7, -37, -61, -20, -22, 6, 15, -83, 0, 58, -22, -19, 9, -35, 45, -51, -2, -16, -44};
int main() 
{

	int i = 0, j, tmp, canvis;
 
	int n = 20;
	do
	{
		canvis = 0;
		for ( j=0 ; j<n-i-1 ; j++)
		{
			if (vector1[j] > vector1[j+1])
			{
				tmp = vector1[j];
				vector1[j] = vector1[j+1];
				vector1[j+1] = tmp;
				canvis++;
			}
		}
		i++;
	} while (canvis != 0);
	asm("ecall");
	while(1);
}

int main2() 
{

	int i = 0, j, tmp, canvis;
 
	int n = 20;
	do
	{
		canvis = 0;
		for ( j=0 ; j<n-i-1 ; j++)
		{
			if (vector2[j] > vector2[j+1])
			{
				tmp = vector2[j];
				vector2[j] = vector2[j+1];
				vector2[j+1] = tmp;
				canvis++;
			}
		}
		i++;
	} while (canvis != 0);
	asm("ecall");
	while(1);
}
