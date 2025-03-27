// kernel.c
#include "kernel.h"

// Kernel entry point
void _start() {
    // Basic kernel setup goes here
    // This will be the entry point for your kernel
    // Print or perform any initialization here
    while (1) {}  // Infinite loop to halt the kernel (for now)
}

void kernel_main(void) {
    const char *str = "Hello, Kernel!\n";
    
    // Print each character of the string
    while (*str) {
        putchar(*str++);
    }
}

// Function to print a character to the screen using VGA
void putchar(char c) {
    unsigned short *vga = (unsigned short *) 0xB8000;  // VGA memory location
    static unsigned int offset = 0;  // Keeps track of where to print

    // Store the character in the VGA buffer (0x0F00 is white text on black background)
    vga[offset] = (unsigned short) (c | 0x0F00);
    offset++;  // Move to the next position
}
