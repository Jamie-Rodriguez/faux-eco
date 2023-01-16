#include <stdio.h>
#include <stdlib.h>


const char text[] = {
#include "data.h"
};


int main(const int argc, char const *argv[]) {
	printf("%s", text);

	return EXIT_SUCCESS;
}
