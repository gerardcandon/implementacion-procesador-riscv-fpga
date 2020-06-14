library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity automata_estado_int is
	port (
		reloj, start, reset: in std_logic;
		instr: in st_instr;
		decodificacion, excep: in std_logic;
		estadoI: out st_estadoI
	);
end automata_estado_int;

architecture compor of automata_estado_int is

signal prx_estadoI_s: st_estadoI;
signal estadoI_s: st_estadoI;

begin

rlj: process(reset, reloj)
variable v_estadoI: st_estadoI;
begin
	if reset = '1' then
		v_estadoI := RESTART;
	elsif rising_edge(reloj) then
		v_estadoI := prx_estadoI_s;
	end if;
	estadoI_s <= v_estadoI after ret_estado;
end process;

prx_esta: process(estadoI_s, start, instr, decodificacion, excep)
variable v_prx_estadoI: st_estadoI;
variable coop: st_coop;
variable funct3: st_funct3;
variable funct12: st_funct12;

begin

	coop := instr(6 downto 0);
	funct3 := instr(14 downto 12);
	funct12 := instr(31 downto 20);
	case estadoI_s is
	
		when RESTART =>
			v_prx_estadoI := INI;
			
		when INI =>
			if (start = '1') then
				v_prx_estadoI := NO_INT;
			else v_prx_estadoI := INI;
			end if;
		
		when NO_INT =>
						
			if (decodificacion = '1') then
				v_prx_estadoI := DECODE;
			else
				v_prx_estadoI := NO_INT;
			end if;
			
		when DECODE =>
			v_prx_estadoI := NO_INT;
			case coop is
				when SYSTEM =>
					case funct3 is
						when F3_PRIV =>
							case funct12 is
								when F12_MRET =>
									v_prx_estadoI := MRET;
								when others =>
							end case;
						when F3_CSRRW =>
							v_prx_estadoI := CSRRW;
						when F3_CSRRS =>
							v_prx_estadoI := CSRRS;
						when F3_CSRRC =>
							v_prx_estadoI := CSRRC;
						when F3_CSRRWI =>
							v_prx_estadoI := CSRRWI;
						when F3_CSRRSI =>
							v_prx_estadoI := CSRRSI;
						when F3_CSRRCI =>
							v_prx_estadoI := CSRRCI;
						when others =>
					end case;
				when others =>
			end case;
			
		when MRET | CSRRW | CSRRS | CSRRC | CSRRWI | CSRRSI | CSRRCI =>
			v_prx_estadoI := NO_INT;
			
		when others =>
	end case;
	
	if (excep = '1') then
		v_prx_estadoI := NO_INT;
	end if;
		
	prx_estadoI_s 	<= v_prx_estadoI;

end process;

estadoI <= estadoI_s;
end;
