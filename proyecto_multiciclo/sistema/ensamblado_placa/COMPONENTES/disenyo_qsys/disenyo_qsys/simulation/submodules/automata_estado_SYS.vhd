--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity automata_estado_SYS is
	port (
		reloj, Pcero: in std_logic;
		instr: in st_instr;
		decodificacion, excep_CSR: in std_logic;
		estadoSYS: out st_estadoSYS
	);
end automata_estado_SYS;

architecture compor of automata_estado_SYS is

signal prx_estadoSYS_s: st_estadoSYS;
signal estadoSYS_s: st_estadoSYS;

begin

rlj: process(Pcero, reloj)
variable v_estadoSYS: st_estadoSYS;
begin
	if Pcero = '1' then
		v_estadoSYS := RESTART;
	elsif rising_edge(reloj) then
		v_estadoSYS := prx_estadoSYS_s;
	end if;
	estadoSYS_s <= v_estadoSYS after ret_estado;
end process;

prx_esta: process(estadoSYS_s, instr, decodificacion, excep_CSR)
variable v_prx_estadoSYS: st_estadoSYS;
variable coop: st_coop;
variable funct3: st_funct3;
variable funct12: st_funct12;

begin

	coop := instr(6 downto 0);
	funct3 := instr(14 downto 12);
	funct12 := instr(31 downto 20);
	v_prx_estadoSYS := ESPERA;
	
	if (excep_CSR /= '1') then
	
		case estadoSYS_s is
			
			when ESPERA =>
				if (decodificacion = '1') then
					v_prx_estadoSYS := DECODE;
				end if;
				
			when DECODE =>
				case coop is
					when SYSTEM =>
						case funct3 is
							when F3_PRIV =>
								case funct12 is
									when F12_MRET =>
										v_prx_estadoSYS := MRET;
									when others =>
								end case;
							when F3_CSRRW =>
								v_prx_estadoSYS := CSRRW;
							when F3_CSRRS =>
								v_prx_estadoSYS := CSRRS;
							when F3_CSRRC =>
								v_prx_estadoSYS := CSRRC;
							when F3_CSRRWI =>
								v_prx_estadoSYS := CSRRWI;
							when F3_CSRRSI =>
								v_prx_estadoSYS := CSRRSI;
							when F3_CSRRCI =>
								v_prx_estadoSYS := CSRRCI;
							when others =>
						end case;
					when others =>
				end case;
			when others =>
		end case;
	end if;
		
	prx_estadoSYS_s 	<= v_prx_estadoSYS;

end process;

estadoSYS <= estadoSYS_s;
end;
