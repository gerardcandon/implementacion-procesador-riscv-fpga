--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.retardos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;


entity decoMem is 
  port (
		instr: in st_instr;
		estado: in st_estado;
		byteenable: out st_byteenable;
		read, write: out std_logic;
		address: in mem_direcc);
end decoMem;

architecture comportamiento of decoMem is

begin

decoMem:	process(instr, estado, address)
variable funct3: st_funct3;
variable v_read, v_write: std_logic;
variable v_byteenable: st_byteenable;

begin

	no_acceso_mem(v_read, v_write);
	v_byteenable := "1111";
	
	funct3 := instr(14 downto 12);
	
	--logica de lectura / escritura
	case estado is
		when ESPERA =>
			lectura_mem(v_read);
		
		when LOAD_DIR =>
			lectura_mem(v_read);
		
		when STORE_DIR =>
			escritura_mem(v_write);
			case funct3 is
				when F3_LDST_B =>
					case address(1 downto 0) is
						when "00" =>
							v_byteenable := "0001";
						when "01" =>
							v_byteenable := "0010";
						when "10" =>
							v_byteenable := "0100";
						when others =>
							v_byteenable := "1000";
					end case;
					
				when F3_LDST_H =>
					case address(1 downto 0) is
						when "00" | "01" =>
							v_byteenable := "0011";
						when others =>
							v_byteenable := "1100";
					end case;
					
				when others =>
					--word
			end case;
			
		-- Si la sdram esta lista, se procesara la peticion en el flanco ascendente, al final de la ejecucion
		-- de la instruccion en curso
		when OP_ALU | OP_IMM_ALU | LUI_FMT | AUIPC_ALU | LOAD_FMT | STORE_ST | BRANCH_EVAL | 
			  JAL_CP | JALR_CP | SYS =>
			lectura_mem(v_read);
			
		when others =>
	end case;
	
	read 			<= v_read;
	write 		<= v_write;
	byteenable 	<= v_byteenable;
	
end process;

	
end;


