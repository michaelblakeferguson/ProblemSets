//Euler11 ~ Largest product in a grid
#include <time.h>
#include <stdio.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	int numbers[20][20];
		
		//Data Entry
		numbers[0][0]  = 8;
		numbers[0][1]  = 2;
		numbers[0][2]  = 22;
		numbers[0][3]  = 97;
		numbers[0][4]  = 38;
		numbers[0][5]  = 15;
		numbers[0][6]  = 0;
		numbers[0][7]  = 40;
		numbers[0][8]  = 0;
		numbers[0][9]  = 75;
		numbers[0][10] = 4;
		numbers[0][11] = 5;
		numbers[0][12] = 7;
		numbers[0][13] = 78;
		numbers[0][14] = 52;
		numbers[0][15] = 12;
		numbers[0][16] = 50;
		numbers[0][17] = 77;
		numbers[0][18] = 91;
		numbers[0][19] = 8;
		
		numbers[1][0]  = 49;
		numbers[1][1]  = 49;
		numbers[1][2]  = 99;
		numbers[1][3]  = 40;
		numbers[1][4]  = 17;
		numbers[1][5]  = 81;
		numbers[1][6]  = 18;
		numbers[1][7]  = 57;
		numbers[1][8]  = 60;
		numbers[1][9]  = 87;
		numbers[1][10] = 17;
		numbers[1][11] = 40;
		numbers[1][12] = 98;
		numbers[1][13] = 43;
		numbers[1][14] = 69;
		numbers[1][15] = 48;
		numbers[1][16] = 4;
		numbers[1][17] = 56;
		numbers[1][18] = 62;
		numbers[1][19] = 0;
		
		numbers[2][0]  = 81;
		numbers[2][1]  = 49;
		numbers[2][2]  = 31;
		numbers[2][3]  = 73;
		numbers[2][4]  = 55;
		numbers[2][5]  = 79;
		numbers[2][6]  = 14;
		numbers[2][7]  = 29;
		numbers[2][8]  = 93;
		numbers[2][9]  = 71;
		numbers[2][10] = 40;
		numbers[2][11] = 67;
		numbers[2][12] = 53;
		numbers[2][13] = 88;
		numbers[2][14] = 30;
		numbers[2][15] = 3;
		numbers[2][16] = 49;
		numbers[2][17] = 13;
		numbers[2][18] = 36;
		numbers[2][19] = 65;
		
		numbers[3][0]  = 52;
		numbers[3][1]  = 70;
		numbers[3][2]  = 95;
		numbers[3][3]  = 23;
		numbers[3][4]  = 4;
		numbers[3][5]  = 60;
		numbers[3][6]  = 11;
		numbers[3][7]  = 42;
		numbers[3][8]  = 69;
		numbers[3][9]  = 24;
		numbers[3][10] = 68;
		numbers[3][11] = 56;
		numbers[3][12] = 1;
		numbers[3][13] = 32;
		numbers[3][14] = 56;
		numbers[3][15] = 71;
		numbers[3][16] = 37;
		numbers[3][17] = 2;
		numbers[3][18] = 36;
		numbers[3][19] = 91;
		
		numbers[4][0]  = 22;
		numbers[4][1]  = 31;
		numbers[4][2]  = 16;
		numbers[4][3]  = 71;
		numbers[4][4]  = 51;
		numbers[4][5]  = 67;
		numbers[4][6]  = 63;
		numbers[4][7]  = 89;
		numbers[4][8]  = 41;
		numbers[4][9]  = 92;
		numbers[4][10] = 36;
		numbers[4][11] = 54;
		numbers[4][12] = 22;
		numbers[4][13] = 40;
		numbers[4][14] = 40;
		numbers[4][15] = 28;
		numbers[4][16] = 66;
		numbers[4][17] = 33;
		numbers[4][18] = 13;
		numbers[4][19] = 80;
		
		numbers[5][0]  = 24;
		numbers[5][1]  = 47;
		numbers[5][2]  = 32;
		numbers[5][3]  = 60;
		numbers[5][4]  = 99;
		numbers[5][5]  = 03;
		numbers[5][6]  = 45;
		numbers[5][7]  = 2;
		numbers[5][8]  = 44;
		numbers[5][9]  = 75;
		numbers[5][10] = 33;
		numbers[5][11] = 53;
		numbers[5][12] = 78;
		numbers[5][13] = 36;
		numbers[5][14] = 84;
		numbers[5][15] = 20;
		numbers[5][16] = 35;
		numbers[5][17] = 17;
		numbers[5][18] = 12;
		numbers[5][19] = 50;
		
		numbers[6][0]  = 32;
		numbers[6][1]  = 98;
		numbers[6][2]  = 81;
		numbers[6][3]  = 28;
		numbers[6][4]  = 64;
		numbers[6][5]  = 23;
		numbers[6][6]  = 67;
		numbers[6][7]  = 10;
		numbers[6][8]  = 26;
		numbers[6][9]  = 38;
		numbers[6][10] = 40;
		numbers[6][11] = 67;
		numbers[6][12] = 59;
		numbers[6][13] = 54;
		numbers[6][14] = 70;
		numbers[6][15] = 66;
		numbers[6][16] = 18;
		numbers[6][17] = 38;
		numbers[6][18] = 64;
		numbers[6][19] = 70;
		
		numbers[7][0]  = 67;
		numbers[7][1]  = 26;
		numbers[7][2]  = 20;
		numbers[7][3]  = 68;
		numbers[7][4]  = 2;
		numbers[7][5]  = 62;
		numbers[7][6]  = 12;
		numbers[7][7]  = 20;
		numbers[7][8]  = 95;
		numbers[7][9]  = 63;
		numbers[7][10] = 94;
		numbers[7][11] = 39;
		numbers[7][12] = 63;
		numbers[7][13] = 8;
		numbers[7][14] = 40;
		numbers[7][15] = 91;
		numbers[7][16] = 66;
		numbers[7][17] = 49;
		numbers[7][18] = 94;
		numbers[7][19] = 21;
		
		numbers[8][0]  = 24;
		numbers[8][1]  = 55;
		numbers[8][2]  = 58;
		numbers[8][3]  = 5;
		numbers[8][4]  = 66;
		numbers[8][5]  = 73;
		numbers[8][6]  = 99;
		numbers[8][7]  = 26;
		numbers[8][8]  = 97;
		numbers[8][9]  = 17;
		numbers[8][10] = 78;
		numbers[8][11] = 78;
		numbers[8][12] = 96;
		numbers[8][13] = 83;
		numbers[8][14] = 14;
		numbers[8][15] = 88;
		numbers[8][16] = 34;
		numbers[8][17] = 89;
		numbers[8][18] = 63;
		numbers[8][19] = 72;
		
		numbers[9][0]  = 21;
		numbers[9][1]  = 36;
		numbers[9][2]  = 23;
		numbers[9][3]  = 9;
		numbers[9][4]  = 75;
		numbers[9][5]  = 0;
		numbers[9][6]  = 76;
		numbers[9][7]  = 44;
		numbers[9][8]  = 20;
		numbers[9][9]  = 45;
		numbers[9][10] = 35;
		numbers[9][11] = 14;
		numbers[9][12] = 0;
		numbers[9][13] = 61;
		numbers[9][14] = 33;
		numbers[9][15] = 97;
		numbers[9][16] = 34;
		numbers[9][17] = 31;
		numbers[9][18] = 33;
		numbers[9][19] = 95;
		
		numbers[10][0]  = 78;
		numbers[10][1]  = 17;
		numbers[10][2]  = 53;
		numbers[10][3]  = 28;
		numbers[10][4]  = 22;
		numbers[10][5]  = 75;
		numbers[10][6]  = 31;
		numbers[10][7]  = 67;
		numbers[10][8]  = 15;
		numbers[10][9]  = 94;
		numbers[10][10] = 3;
		numbers[10][11] = 80;
		numbers[10][12] = 4;
		numbers[10][13] = 62;
		numbers[10][14] = 16;
		numbers[10][15] = 14;
		numbers[10][16] = 9;
		numbers[10][17] = 53;
		numbers[10][18] = 56;
		numbers[10][19] = 92;
		
		numbers[11][0]  = 16;
		numbers[11][1]  = 39;
		numbers[11][2]  = 5;
		numbers[11][3]  = 42;
		numbers[11][4]  = 96;
		numbers[11][5]  = 35;
		numbers[11][6]  = 31;
		numbers[11][7]  = 47;
		numbers[11][8]  = 55;
		numbers[11][9]  = 58;
		numbers[11][10] = 88;
		numbers[11][11] = 24;
		numbers[11][12] = 0;
		numbers[11][13] = 17;
		numbers[11][14] = 54;
		numbers[11][15] = 24;
		numbers[11][16] = 36;
		numbers[11][17] = 29;
		numbers[11][18] = 85;
		numbers[11][19] = 57;
		
		numbers[12][0]  = 86;
		numbers[12][1]  = 56;
		numbers[12][2]  = 0;
		numbers[12][3]  = 48;
		numbers[12][4]  = 35;
		numbers[12][5]  = 71;
		numbers[12][6]  = 89;
		numbers[12][7]  = 7;
		numbers[12][8]  = 5;
		numbers[12][9]  = 44;
		numbers[12][10] = 44;
		numbers[12][11] = 37;
		numbers[12][12] = 44;
		numbers[12][13] = 60;
		numbers[12][14] = 21;
		numbers[12][15] = 58;
		numbers[12][16] = 51;
		numbers[12][17] = 54;
		numbers[12][18] = 17;
		numbers[12][19] = 58;
		
		numbers[13][0]  = 19;
		numbers[13][1]  = 80;
		numbers[13][2]  = 81;
		numbers[13][3]  = 68;
		numbers[13][4]  = 5;
		numbers[13][5]  = 94;
		numbers[13][6]  = 47;
		numbers[13][7]  = 69;
		numbers[13][8]  = 28;
		numbers[13][9]  = 73;
		numbers[13][10] = 92;
		numbers[13][11] = 13;
		numbers[13][12] = 86;
		numbers[13][13] = 52;
		numbers[13][14] = 17;
		numbers[13][15] = 77;
		numbers[13][16] = 4;
		numbers[13][17] = 89;
		numbers[13][18] = 55;
		numbers[13][19] = 40;
		
		numbers[14][0]  = 4;
		numbers[14][1]  = 52;
		numbers[14][2]  = 8;
		numbers[14][3]  = 83;
		numbers[14][4]  = 97;
		numbers[14][5]  = 35;
		numbers[14][6]  = 99;
		numbers[14][7]  = 16;
		numbers[14][8]  = 7;
		numbers[14][9]  = 97;
		numbers[14][10] = 57;
		numbers[14][11] = 32;
		numbers[14][12] = 16;
		numbers[14][13] = 26;
		numbers[14][14] = 26;
		numbers[14][15] = 79;
		numbers[14][16] = 33;
		numbers[14][17] = 27;
		numbers[14][18] = 98;
		numbers[14][19] = 66;
		
		numbers[15][0]  = 88;
		numbers[15][1]  = 36;
		numbers[15][2]  = 68;
		numbers[15][3]  = 87;
		numbers[15][4]  = 57;
		numbers[15][5]  = 62;
		numbers[15][6]  = 20;
		numbers[15][7]  = 72;
		numbers[15][8]  = 3;
		numbers[15][9]  = 46;
		numbers[15][10] = 33;
		numbers[15][11] = 67;
		numbers[15][12] = 46;
		numbers[15][13] = 55;
		numbers[15][14] = 12;
		numbers[15][15] = 32;
		numbers[15][16] = 63;
		numbers[15][17] = 93;
		numbers[15][18] = 53;
		numbers[15][19] = 69;
		
		numbers[16][0]  = 4;
		numbers[16][1]  = 42;
		numbers[16][2]  = 16;
		numbers[16][3]  = 73;
		numbers[16][4]  = 38;
		numbers[16][5]  = 25;
		numbers[16][6]  = 39;
		numbers[16][7]  = 11;
		numbers[16][8]  = 24;
		numbers[16][9]  = 94;
		numbers[16][10] = 72;
		numbers[16][11] = 18;
		numbers[16][12] = 8;
		numbers[16][13] = 46;
		numbers[16][14] = 29;
		numbers[16][15] = 32;
		numbers[16][16] = 40;
		numbers[16][17] = 62;
		numbers[16][18] = 76;
		numbers[16][19] = 36;
		
		numbers[17][0]  = 20;
		numbers[17][1]  = 69;
		numbers[17][2]  = 36;
		numbers[17][3]  = 41;
		numbers[17][4]  = 72;
		numbers[17][5]  = 30;
		numbers[17][6]  = 23;
		numbers[17][7]  = 88;
		numbers[17][8]  = 34;
		numbers[17][9]  = 62;
		numbers[17][10] = 99;
		numbers[17][11] = 69;
		numbers[17][12] = 82;
		numbers[17][13] = 67;
		numbers[17][14] = 59;
		numbers[17][15] = 85;
		numbers[17][16] = 74;
		numbers[17][17] = 4;
		numbers[17][18] = 36;
		numbers[17][19] = 16;
		
		numbers[18][0]  = 20;
		numbers[18][1]  = 73;
		numbers[18][2]  = 35;
		numbers[18][3]  = 29;
		numbers[18][4]  = 78;
		numbers[18][5]  = 31;
		numbers[18][6]  = 90;
		numbers[18][7]  = 1;
		numbers[18][8]  = 74;
		numbers[18][9]  = 31;
		numbers[18][10] = 49;
		numbers[18][11] = 71;
		numbers[18][12] = 48;
		numbers[18][13] = 86;
		numbers[18][14] = 81;
		numbers[18][15] = 16;
		numbers[18][16] = 23;
		numbers[18][17] = 57;
		numbers[18][18] = 5;
		numbers[18][19] = 54;
		
		numbers[19][0]  = 1;
		numbers[19][1]  = 70;
		numbers[19][2]  = 54;
		numbers[19][3]  = 71;
		numbers[19][4]  = 83;
		numbers[19][5]  = 51;
		numbers[19][6]  = 54;
		numbers[19][7]  = 69;
		numbers[19][8]  = 16;
		numbers[19][9]  = 92;
		numbers[19][10] = 33;
		numbers[19][11] = 48;
		numbers[19][12] = 61;
		numbers[19][13] = 43;
		numbers[19][14] = 52;
		numbers[19][15] = 1;
		numbers[19][16] = 89;
		numbers[19][17] = 19;
		numbers[19][18] = 67;
		numbers[19][19] = 48;
		
		//Vertical Check
		int product = 1;
		int largestProduct = 1;
		for(int y = 0; y <= 16; y++)
		{
			for(int x = 0; x <= 19; x++)
			{
				product = product * numbers[y][x];
				product = product * numbers[y+1][x];
				product = product * numbers[y+2][x];
				product = product * numbers[y+3][x];
				
				if(product > largestProduct)
				{
					largestProduct = product;
				}
				product = 1;
			}
			
		}
		
		//Horizontal Check
		for(int y = 0; y <= 19; y++)
		{
			for(int x = 0; x <= 16; x++)
			{
				product = product * numbers[y][x];
				product = product * numbers[y][x+1];
				product = product * numbers[y][x+2];
				product = product * numbers[y][x+3];
				
				if(product > largestProduct)
				{
					largestProduct = product;
				}
				product = 1;
			}
			
		}
		
		//Diagonal Right Check
		for(int y = 0; y <= 16; y++)
		{
			for(int x = 0; x <= 16; x++)
			{
				product = product * numbers[y][x];
				product = product * numbers[y+1][x+1];
				product = product * numbers[y+2][x+2];
				product = product * numbers[y+3][x+3];
				
				if(product > largestProduct)
				{
					largestProduct = product;
				}
				product = 1;
			}	
		}
		
		//Diagonal Left Check
		for(int y = 0; y <= 16; y++)
		{
			for(int x = 19; x > 3; x--)
			{
				product = product * numbers[y][x];
				product = product * numbers[y+1][x-1];
				product = product * numbers[y+2][x-2];
				product = product * numbers[y+3][x-3];
				
				if(product > largestProduct)
				{
					largestProduct = product;
				}
				product = 1;
			}
		}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",largestProduct);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}