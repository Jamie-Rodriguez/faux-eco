#include <stdio.h>
#include <stdlib.h>


const char text[] = {
#include "data.h"
};


int main(const int argc, char const *argv[]) {
	printf("%.*s", (int) (sizeof(text) / sizeof(text[0])), text);

	return EXIT_SUCCESS;
}
