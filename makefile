CC := clang
CFLAGS := -Wall -O3 -std=c2x

DATA_FILE := text_data_file.txt
DATA_FILE_INC := data.h
TARGET := mock-utility


# Executable must be provided a text file to read
$(TARGET): faux-eco.o
	@echo "Linking...";
	$(CC) $< -o $(TARGET)

# Embed the text file inside the executable
static: faux-eco-static.o
	@echo "Static compliation selected";
	@echo "Linking...";
	$(CC) $< -o $(TARGET)


faux-eco-static.o: $(DATA_FILE_INC) faux-eco-static.c
	@echo "Building...";
	$(CC) $(CFLAGS) -c faux-eco-static.c -o $@

# This is a hack to be able to embed the data in $(DATA_FILE) into the executable
# Use the xxd utility to hexdump $(DATA_FILE) into a C-style array,
# contained as a header file
# We can then #include $(DATA_FILE_INC) whereby it will be embedded into the final executable
# The C23 standard will include a #embed directive that will solve this problem.
$(DATA_FILE_INC): $(DATA_FILE)
	# This way we don't have to change variable name in makefile and header and source file
	xxd -include < $(DATA_FILE) > $(DATA_FILE_INC)

faux-eco.o: faux-eco.c
	@echo "Building...";
	$(CC) $(CFLAGS) -c $< -o $@


clean:
	@echo "Cleaning...";
	# Using -f to not report an error if file does not exist
	rm -f *.o $(DATA_FILE_INC) $(TARGET)

.PHONY: clean static
