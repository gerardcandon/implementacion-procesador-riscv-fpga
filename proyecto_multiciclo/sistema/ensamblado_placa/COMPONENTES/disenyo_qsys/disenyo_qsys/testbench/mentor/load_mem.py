import binascii
import os
import sys

INSTR_ADDR = "0x00000000"

#comprobamos el numero de argumentos
if len(sys.argv) != 2:
	print("USAGE: python load_mem.py [test_name]\n")
	sys.exit(0)

#obtenemos el directorio de trabajo y los nombres de los ficheros hex y bin para memoria de instrucciones y datos
test_name = sys.argv[1]
cwd = os.getcwd()

ihex_name = cwd + '/tests/test_' + test_name + '/' + test_name + '_imem.hex'
ibin_name = cwd + '/tests/test_' + test_name + '/' + test_name + '.dat'

#escribimos en el formato correcto
ihex_file = open(ihex_name, "r")
ibin_file = open(ibin_name, "w+b")

i=0

for line in ihex_file:
    ibin_file.write("@"+hex(i)+"\n")
    ibin_file.write(line)
    i = i + 4
