library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity acceso_M is
	port(
		reloj, Pcero: in std_logic;
		waitrequest, readvalid, mread_M: in std_logic;
		anula_read_M: out std_logic
	);
end acceso_M;

architecture compor of acceso_M is
signal estado, prx_estado: st_acceso_M_estado;
begin

rlj: process(Pcero, reloj)
variable v_estado: st_acceso_M_estado;
begin
	if Pcero = '1' then
		v_estado := ACCESO_M_ESPERA;
	elsif rising_edge(reloj) then
		v_estado := prx_estado;
	end if;
	estado <= v_estado after ret_estado;
end process;

prx_esta: process(estado, waitrequest, readvalid, mread_M)
variable v_prx_estado: st_acceso_M_estado;

begin
	v_prx_estado := ACCESO_M_ESPERA;
	
	case estado is
		when ACCESO_M_ESPERA =>
			if (mread_M = '1' and waitrequest = '0') then
				v_prx_estado := ACCESO_M_LD;
			end if;
			
		when ACCESO_M_LD =>
			if (readvalid = '1') then
				if (mread_M = '1' and waitrequest = '0') then
					v_prx_estado := ACCESO_M_LD;
				else
					v_prx_estado := ACCESO_M_ESPERA;
				end if;
			else
				v_prx_estado := ACCESO_M_LD;
			end if;
		
		when others =>
	end case;
	prx_estado <= v_prx_estado;
end process;

logica_salida: process(estado, readvalid)
variable v_anula_read_M: std_logic;

begin
	v_anula_read_M := '0';
	
	case estado is
		when ACCESO_M_ESPERA =>
		
		when ACCESO_M_LD =>
			if (readvalid = '0') then
				v_anula_read_M := '1';
			end if;
			
		when others =>
	end case;
	
	anula_read_M <= v_anula_read_M;
	
end process;

end;		