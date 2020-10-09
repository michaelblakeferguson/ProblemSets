//Euler15 ~ Lattice paths
//Compilation note --> gcc -o Euler15 Euler15.c -lgmp
#include <time.h>
#include <stdio.h>
#include <gmp.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	//Lattice Paths of Cube N --> Central Binomial Coefficients: (2n)!/(n!)^2
	int cubeSize = 20;
	
	//Find the numerator value
	int factorialN = cubeSize*2;
	mpz_t numerator;
	mpz_init(numerator);
	mpz_set_ui(numerator,1);
	for(int i = 1;i <= factorialN; i++)
	{
		mpz_mul_ui(numerator,numerator,i);
	}
	
	//Find the denominator value
	mpz_t denominator;
	mpz_init(denominator);
	mpz_set_ui(denominator,1);
	for(int j = 1;j <= cubeSize; j++)
	{
		mpz_mul_ui(denominator,denominator,j);
	}
	mpz_mul(denominator,denominator,denominator);
	
	//Find path count
	mpz_t solution;
	mpz_init(solution);
	mpz_cdiv_q(solution,numerator,denominator);
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: ");
	mpz_out_str(stdout,10,solution); printf("\n\n");
	printf("Program completed in %.3f seconds.", cpu_time_used);
}