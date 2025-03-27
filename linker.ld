ENTRY(_start)

SECTIONS {
  . = 1M;  /* Set the starting address of the kernel to 1MB */

  .text : {
    *(.text)  /* Place all code here */
  }

  .data : {
    *(.data)  /* Place initialized data here */
  }

  .bss : {
    *(.bss)  /* Place uninitialized data here */
  }

  .rodata : {
    *(.rodata)  /* Place read-only data here */
  }

  /DISCARD/ : {
    *(.note.gnu.build-id)  /* Discard any unnecessary sections */
  }
}
