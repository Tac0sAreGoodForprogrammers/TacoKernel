CC = gcc
CFLAGS = -ffreestanding -O2 -Wall -Wextra -I./include -m64
LDFLAGS = -T linker.ld -nostdlib -lgcc -m64  # Ensure the linker script is used and don't link against standard libraries

SRC = src/kernel.c
OBJ = $(SRC:.c=.o)
OUT = kernel.bin

# Default target
all: $(OUT)

$(OUT): $(OBJ)
	$(CC) $(OBJ) -o $(OUT) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(OUT)

run: $(OUT)
	qemu-system-x86_64 -drive format=raw,file=$(OUT)
