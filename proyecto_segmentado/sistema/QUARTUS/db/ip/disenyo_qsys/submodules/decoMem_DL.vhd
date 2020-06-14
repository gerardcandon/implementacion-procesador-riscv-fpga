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

entity decoMem_DL is 
  port (
		instr: in st_instr;
		val_DL: in std_logic;
		read, write: out std_logic
		);
end decoMem_DL;

architecture comportamiento of decoMem_DL is

begin

decoMem:	process(instr, val_DL)
variable coop: st_coop;
variable v_read, v_write: std_logic;

begin

	no_acceso_mem(v_read, v_write);
	
	coop := instr(6 downto 0);
	
	if (val_DL = '1') then
		case coop is
			
			when LOAD =>
				lectura_mem(v_read);
			
			when STORE =>
				escritura_mem(v_write);
				
			when others =>
		end case;
	end if;
	
	read 			<= v_read;
	write 		<= v_write;
	
end process;

	
end;


