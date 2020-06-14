library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity recolectorEventos is
	port(
		mip, mie, mstatus: in st_csr;
		ultimo_ciclo, excep, excep_SYS: in std_logic;
		excep_causa, excep_causa_SYS: in dato_camino;
		int_CSR, excep_CSR: out std_logic;
		int_causa_CSR, excep_causa_CSR: out dato_camino
	);
end recolectorEventos;

architecture compor of recolectorEventos is

begin

int_y_excep: process(ultimo_ciclo, excep, excep_SYS, excep_causa, excep_causa_SYS, mip, mie, mstatus)
variable v_int_CSR, v_excep_CSR: std_logic;
variable v_int_causa_CSR, v_excep_causa_CSR: dato_camino;
begin

	v_int_CSR := '0';
	v_excep_CSR := '0';
	v_int_causa_CSR := (others => '0');
	v_excep_causa_CSR := (others => '0');
	
	--interrupciones
	if (mstatus(bMIE) = '1' and ultimo_ciclo = '1') then
		if (mip(bMTIP) = '1' and mie(bMTIE) = '1') then --reloj
			v_int_CSR := '1';	
			v_int_causa_CSR := causa_int_clk;
		elsif (mip(bMEIP) = '1' and mie(bMEIE) = '1') then --teclado PS/2
			v_int_CSR := '1';
			v_int_causa_CSR := causa_int_PS2;
		end if;
	end if;
		
	--excepciones
	if (excep = '1' or excep_SYS = '1') then
		v_excep_CSR := '1';
		v_excep_causa_CSR := excep_causa or excep_causa_SYS; -- nunca se produciran al mismo tiempo
	end if;
	
	int_CSR         <= v_int_CSR after ret_gestorEventos;
	excep_CSR 		 <= v_excep_CSR after ret_gestorEventos;
	int_causa_CSR   <= v_int_causa_CSR after reT_gestorEventos;
	excep_causa_CSR <= v_excep_causa_CSR after reT_gestorEventos;
	
end process;

end;
