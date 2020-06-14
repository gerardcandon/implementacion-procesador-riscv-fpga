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
		read, write, read_csr, write_csr: out std_logic;
		address: in mem_direcc);
end decoMem;

architecture comportamiento of decoMem is

begin

decoMem:	process(instr, estado, address)
variable funct3: st_funct3;
variable v_read, v_write, v_read_csr, v_write_csr: std_logic;
variable v_byteenable: st_byteenable;

begin

	no_acceso_mem(v_read, v_write, v_read_csr, v_write_csr);
	v_byteenable := "1111";
	
	funct3 := instr(14 downto 12);
	
	--logica de lectura / escritura
	case estado is
		when ESPERA =>
			lectura_mem(v_read);
		
		when LOAD_DIR =>
			if acceso_reg_mapeado_en_mem(address) then
				lectura_reg_mapeado_en_mem(v_read_csr);
			else
				lectura_mem(v_read);
			end if;
		
		when STORE_DIR =>
			if acceso_reg_mapeado_en_mem(address) then
				escritura_reg_mapeado_en_mem(v_write_csr);
			else
				escritura_mem(v_write);
			end if;
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
	read_csr		<= v_read_csr;
	write_csr	<= v_write_csr;
	byteenable 	<= v_byteenable;
	
end process;

	
end;


