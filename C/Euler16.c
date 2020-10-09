//Euler16 ~ Power digit sum
//Compilation note --> gcc -o Euler16 Euler16.c -lgmp
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
	
	mpz_t power;
	mpz_init(power);
	mpz_set_ui(power,0);
	
	mpz_t base;
	mpz_init(base);
	mpz_set_ui(base,2);
	
	mpz_pow_ui(power, base, 1000);
	
	size_t length = mpz_sizeinbase(power,10);
	while(length > 1)
	{
		mpz_mod_ui(digit, power, 10);
		
		mpz_add(sum,sum,digit);
		
		mpz_fdiv_q_ui (power, power, 10);
		length = mpz_sizeinbase(power,10);
	}
	
	//Add last digit 1
	mpz_add_ui(sum,sum,1);
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: ");
	mpz_out_str(stdout,10,sum); printf("\n\n");
	printf("Program completed in %.3f seconds.", cpu_time_used);
}