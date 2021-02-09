#include <stdio.h>
#include <stdlib.h>
#include "add.h"
#include "cube.h"

int main(int argc, char *argv[]) {
	char *x = argv[1];
	char *y = argv[2];
	
	unsigned long a = strtol(x, NULL, 10);
	unsigned long b = strtol(y, NULL, 10);
	
	printf("Sum: %d\n", sum(a, b));
	printf("Cube of a: %d\n", cube(a));
	
	return EXIT_SUCCESS;
}
