library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_decoPriv is

component decoCamino_SYS is
	port(
		estadoI: in st_estadoI;
		int, excep, ultimo_ciclo: in std_logic;
		int_CSR, mret_CSR: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		int_peCP, peCSR, PBR_priv: out std_logic;
		opCSR: out st_opCSR
	);
end component;

component decoExcep_SYS is
	port(
		estadoI: in st_estadoI;
		instr: in st_instr;
		excep: out std_logic;
		excep_causa: out dato_camino
	);
end component;	

end package componentes_decoPriv;
