#!/bin/bash

PROGRAM_NAME="irq"

arm-none-eabi-gdb -tui --command=/home/student/.gdbinit/qemu -se $PROGRAM_NAME.elf
