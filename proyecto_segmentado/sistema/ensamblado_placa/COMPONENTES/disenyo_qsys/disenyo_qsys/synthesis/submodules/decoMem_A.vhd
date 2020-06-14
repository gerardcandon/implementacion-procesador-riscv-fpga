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

entity decoMem_A is 
  port (
		instr_A: in st_instr;
		val_A: in std_logic;
		byteenable: out st_byteenable;
		address_A: in mem_direcc);
end decoMem_A;

architecture comportamiento of decoMem_A is

begin

decoMem:	process(instr_A, address_A, val_A)
variable coop: st_coop;
variable funct3: st_funct3;
variable v_byteenable: st_byteenable;

begin

	v_byteenable := "1111";
	
	coop := instr_A(6 downto 0);
	funct3 := instr_A(14 downto 12);
	
	if (val_A = '1') then
		case coop is
			
			when STORE =>
				case funct3 is
					when F3_LDST_B =>
						case address_A(1 downto 0) is
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
						case address_A(1 downto 0) is
							when "00" | "01" =>
								v_byteenable := "0011";
							when others =>
								v_byteenable := "1100";
						end case;
						
					when others =>
						--word
				end case;
				
			when others =>
		end case;
	end if;
	
	byteenable 	<= v_byteenable;
	
end process;

	
end;
