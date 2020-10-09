//Euler20 ~ Factorial digit sum
//Compilation note --> gcc -o Euler20 Euler20.c -lgmp 
#include <time.h>
#include <stdio.h>
#include <gmp.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	mpz_t digit;
	mpz_init(digit);
	mpz_set_ui(digit,0);
	
	mpz_t sum;
	mpz_init(sum);
	mpz_set_ui(sum,0);
	
	mpz_t zero;
	mpz_init(zero);
	mpz_set_ui(zero,0);
	
	mpz_t one;
	mpz_init(one);
	mpz_set_ui(one,1);
	
	mpz_t ten;
	mpz_init(ten);
	mpz_set_ui(ten,10);
	
	mpz_t factorial;
	mpz_init(factorial);
	mpz_set_ui(factorial,100);
	
	for(int i = 99; i > 0; i--)
	{
		mpz_t iBig;
		mpz_init(iBig);
		mpz_set_ui(iBig,i);
		
		mpz_mul(factorial,factorial,iBig);
	}
	
	while(mpz_cmp(factorial,zero))
	{
		mpz_mod(digit,factorial,ten);
		mpz_add(sum,sum,digit);
		mpz_fdiv_q (factorial,factorial,ten);
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: ");
	mpz_out_str(stdout,10,sum); printf("\n\n");
	printf("Program completed in %.3f seconds.", cpu_time_used);
}