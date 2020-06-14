library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_decoSYS is

component decoCamino_SYS is
	port(
		estadoSYS: in st_estadoSYS;
		int_CSR, excep_CSR: in std_logic;
		mret_CSR: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		int_peCP, peCSR, PBR_sys: out std_logic;
		opCSR: out st_opCSR
	);
end component;

component decoExcep_SYS is
	port(
		estadoSYS: in st_estadoSYS;
		instr: in st_instr;
		excep_SYS: out std_logic;
		excep_causa_SYS: out dato_camino
	);
end component;	

end package componentes_decoSYS;
