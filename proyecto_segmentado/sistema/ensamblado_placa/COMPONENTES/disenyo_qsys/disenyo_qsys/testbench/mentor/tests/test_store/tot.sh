#!/bin/bash

# comprova parametres
if [ $# -lt 1 ] ; then
	echo "us: $0 programa"
	exit 1
fi

set -e
set -x

# compila programa prova
riscv32-unknown-linux-gnu-gcc -nostdlib -c -o ${1}.o ${1}.c
#riscv32-unknown-linux-gnu-gcc -O2 -nostdlib -c -o ${1}.o ${1}.c
#riscv32-unknown-linux-gnu-gcc -O3 -nostdlib -c -o ${1}.o ${1}.c

# enllaca objectes
riscv32-unknown-linux-gnu-ld -o ${1}.bin -T prog-link.ld ${1}.o

# genera memoria instruccions
riscv32-unknown-linux-gnu-objcopy -O binary --only-section=.text* ${1}.bin ${1}.imem # extreu codi
hexdump -v -e '"%08x\n"' ${1}.imem > ${1}_imem.hex # posicions de 4 bytes

# genera memoria dades
riscv32-unknown-linux-gnu-objcopy -O binary --only-section=.data ${1}.bin ${1}.dmem # extreu dades
hexdump -v -e '"%08x\n"' ${1}.dmem > ${1}_dmem.hex # posicions de 4 bytes

# genera desenssamblat
riscv32-unknown-linux-gnu-objdump -d -M numeric -M no-aliases ${1}.bin > ${1}.disassembled

# neteja
rm ${1}.o ${1}.bin ${1}.imem ${1}.dmem
