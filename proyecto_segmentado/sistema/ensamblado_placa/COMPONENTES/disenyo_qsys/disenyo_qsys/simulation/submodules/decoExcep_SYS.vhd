library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;

entity decoExcep_SYS is
	port(
		estadoSYS: in st_estadoSYS;
		instr: in st_instr;
		excep_SYS: out std_logic;
		excep_causa_SYS: out dato_camino;
		modo_csr: in st_modo
	);
end decoExcep_SYS;		
				
architecture compor of decoExcep_SYS is
begin
decoExcep: process(estadoSYS, instr, modo_csr)
variable coop: st_coop;
variable funct3: st_funct3;
variable funct12: st_funct12;
variable v_excep_SYS: std_logic;
variable v_excep_causa_SYS: dato_camino;

begin
	coop := instr(6 downto 0);
	funct3 := instr(14 downto 12);
	funct12 := instr(31 downto 20);
	
	v_excep_SYS := '0';
	v_excep_causa_SYS := causa_no;

	case estadoSYS is
		when DECODE =>
			case coop is
				when SYSTEM =>
					--comprobamos si tenemos el privilegio como para interpretar la instruccion
					if (modo_csr /= modo_M) then
						v_excep_SYS := '1';
						v_excep_causa_SYS := causa_instrPrivilegiada;
					end if;
					--comprobamos que no sea una instr ilegal
					case funct3 is
						when F3_CSRRW | F3_CSRRS | F3_CSRRC | F3_CSRRWI | F3_CSRRSI | F3_CSRRCI =>
						when F3_PRIV =>
							case funct12 is
								when F12_MRET | F12_ECALL =>
									if (instr(19 downto 15) /= "00000" or instr(11 downto 7) /= "00000") then
										v_excep_SYS := '1';
										v_excep_causa_SYS := causa_instrIlegal;
									elsif (funct12 = F12_ECALL) then
										v_excep_SYS := '1';
										v_excep_causa_SYS := causa_syscall;
									end if;
								when others =>
									v_excep_SYS := '1';
									v_excep_causa_SYS := causa_instrIlegal;
							end case;
						
						when others =>
							v_excep_SYS := '1';
							v_excep_causa_SYS := causa_instrIlegal;
					end case;
				when others =>
			end case;
		when others =>
	end case;
	
	excep_SYS <= v_excep_SYS;
	excep_causa_SYS <= v_excep_causa_SYS;
end process;
end;