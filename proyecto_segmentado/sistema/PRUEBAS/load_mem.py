import binascii
import os
import sys

INSTR_ADDR = "0x00000000"
DATA_ADDR = "0x04000000"

#comprobamos el numero de argumentos
if len(sys.argv) != 2:
	print("USAGE: python load_mem.py [test_name]\n")
	sys.exit(0)

#obtenemos el directorio de trabajo y los nombres de los ficheros hex y bin para memoria de instrucciones y datos
test_name = sys.argv[1]
cwd = os.getcwd()

ihex_name = cwd + '/test_' + test_name + '/' + test_name + '_imem.hex'
ibin_name = cwd + '/test_' + test_name + '/' + test_name + '_imem.bin'
dhex_name = cwd + '/test_' + test_name + '/' + test_name + '_dmem.hex'
dbin_name = cwd + '/test_' + test_name + '/' + test_name + '_dmem.bin'

#escribimos el programa pasando las instrucciones de texto ascii a hexadecimal, para memoria de instrucciones
ihex_file = open(ihex_name, "r")
ibin_file = open(ibin_name, "w+b")

for line in ihex_file:
    ibin_file.write(binascii.unhexlify(line[6]+line[7]+line[4]+line[5]+line[2]+line[3]+line[0]+line[1]))

#escribimos el programa pasando las instrucciones de texto ascii a hexadecimal, para memoria de datos
dhex_file = open(dhex_name, "r")
dbin_file = open(dbin_name, "w+b")

for line in dhex_file:
    dbin_file.write(binascii.unhexlify(line[6]+line[7]+line[4]+line[5]+line[2]+line[3]+line[0]+line[1]))

#generamos el archivo .tcl
tcl_name = cwd + '/test_' + test_name + '/init.tcl'
tcl_file = open(tcl_name, "w+")
script = """set master [claim_service "master" [lindex [get_service_paths "master"] 0] ""]; 
master_write_from_file $master {} {};
master_write_from_file $master {} {};
""".format(ibin_name, INSTR_ADDR, dbin_name, DATA_ADDR)

tcl_file.write(script)

