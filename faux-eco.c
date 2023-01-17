#include <stdio.h>
#include <stdlib.h>

// 1 MiB
#define BUFFER_SIZE 0x100000


int main(const int argc, char const *argv[]) {
	if (argc < 2) {
		printf("Error: data file not provided as command line argument\n");
		exit(EXIT_FAILURE);
	}
	if (argc > 2) {
		printf("Error: too many command line arguments provided\n");
		exit(EXIT_FAILURE);
	}


	FILE *fptr = fopen(argv[1], "r");

	if (fptr == NULL) {
		printf("Unable to open file \"%s\"\n", argv[1]);
		exit(EXIT_FAILURE);
	}

	char buffer[BUFFER_SIZE];

	while (fgets(buffer, BUFFER_SIZE, fptr) != NULL) {
		printf("%s", buffer);
	}

	fclose(fptr);

	return EXIT_SUCCESS;
}
