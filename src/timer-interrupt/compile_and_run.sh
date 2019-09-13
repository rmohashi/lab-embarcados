#!/bin/bash

C_FILE_NAME="handler"
ASSEMBLY_FILE_NAME="irq"
LINKER_SCRIPT_FILE_NAME="$ASSEMBLY_FILE_NAME"
LINKER_SCRIPT_FILE_NAME+="ld"

if arm-none-eabi-gcc -c -mcpu=arm926ej-s -Wall -Wextra -g $C_FILE_NAME.c -o $C_FILE_NAME.o ; then
  if arm-none-eabi-as -c -mcpu=arm926ej-s -g $ASSEMBLY_FILE_NAME.s -o $ASSEMBLY_FILE_NAME.o ; then
    if arm-none-eabi-ld -T $LINKER_SCRIPT_FILE_NAME.ld $ASSEMBLY_FILE_NAME.o $C_FILE_NAME.o -o $ASSEMBLY_FILE_NAME.elf ; then
      if arm-none-eabi-objcopy -O binary $ASSEMBLY_FILE_NAME.elf $ASSEMBLY_FILE_NAME.bin ; then
        qemu $ASSEMBLY_FILE_NAME.bin
      fi
    fi
  fi
fi
