/* ordenación con el algoritmo de la burbuja */
 

char vector1[100] = {20, -18, 16, 17, 20, -9, 13, -10, 4, 2, 0, 2, 4, 10, -8, 13, 20, 18, 16, 19};
char vector2[100] = {25, 30, -3, -7, 210, -92, 33, 47, 3, -1, -45, 13, 86, 56, -82, 54, 200, 182, 14, 129};
 
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
