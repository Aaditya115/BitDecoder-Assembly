# Makefile for compiling AT&T assembly files

# Compiler and assembler
CC = gcc
AS = as

# Compiler flags
CFLAGS = -g -Wall -Wextra

# Assembler flags (for debugging)
ASFLAGS = -g

# List of object files
OBJ = bit_decode.o create_key.o rotate_right.o rotate_left.o

# Target executable
TARGET = bit_decode

# Default target: build the executable and zip the project
all: $(TARGET) zip

# Create the executable by linking the object files
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile C source files to object files
bit_decode.o: bit_decode.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile AT&T assembly source files to object files
create_key.o: create_key.s
	$(AS) $(ASFLAGS) -o $@ $<

rotate_right.o: rotate_right.s
	$(AS) $(ASFLAGS) -o $@ $<

rotate_left.o: rotate_left.s
	$(AS) $(ASFLAGS) -o $@ $<

# Clean up object files and the executable
clean:
	rm -f *.o $(TARGET) lab6.zip

# Zip project files (excluding binary, object files, and the zip itself)
zip:
	zip -r lab6.zip . -x "$(TARGET)" "*.o" "lab6.zip"

# Prevent file name conflicts
.PHONY: all clean zip

