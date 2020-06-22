#!/bin/bash

# comprova parametres
if [ $# -lt 1 ] ; then
	echo "us: $0 programa"
	exit 1
fi

set -e
set -x

# assembla codi inicialitzacio
riscv32-unknown-linux-gnu-as -march=rv32i -o init.o init.s

# compila programa prova
riscv32-unknown-linux-gnu-gcc -march=rv32i -nostdlib -c -o ${1}.o ${1}.c
riscv32-unknown-linux-gnu-gcc -march=rv32i -I./ -nostdlib -c -o syscode.o syscode.c
#riscv32-unknown-linux-gnu-gcc -O2 -nostdlib -c -o ${1}.o ${1}.c
#riscv32-unknown-linux-gnu-gcc -O3 -nostdlib -c -o ${1}.o ${1}.c

# enllaca objectes
riscv32-unknown-linux-gnu-ld -o ${1}.bin -T prog-link.ld init.o ${1}.o syscode.o

# genera memoria instruccions
riscv32-unknown-linux-gnu-objcopy -O binary --only-section=.text.inici --only-section=.text ${1}.bin ${1}.imem # extreu codi
hexdump -v -e '"%08x\n"' ${1}.imem > ${1}_imem.hex # posicions de 4 bytes

# genera memoria dades
riscv32-unknown-linux-gnu-objcopy -O binary --only-section=.data ${1}.bin ${1}.dmem # extreu dades
hexdump -v -e '"%08x\n"' ${1}.dmem > ${1}_dmem.hex # posicions de 4 bytes

# genera memoria kernel
riscv32-unknown-linux-gnu-objcopy -O binary --only-section=.text.sys ${1}.bin ${1}.sysmem # extreu codi
hexdump -v -e '"%08x\n"' ${1}.sysmem > ${1}_sysmem.hex # posicions de 4 bytes


# genera desenssamblat
riscv32-unknown-linux-gnu-objdump -d -M no-aliases ${1}.bin > ${1}.disassembled

# neteja
rm ${1}.o ${1}.imem ${1}.dmem
