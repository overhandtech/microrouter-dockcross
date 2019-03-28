#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[])
{
	double value = fabs(0.3*argc);

	printf("%f\n", exp(value));

	return 0;
}
