--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_control_SYS is

component automata_estado_SYS is
	port (
		reloj, Pcero: in std_logic;
		instr: in st_instr;
		decodificacion, excep_CSR: in std_logic;
		estadoSYS: out st_estadoSYS
	);
end component;

component decoSYS is
	port(
		estadoSYS: in st_estadoSYS;
		instr: in st_instr;
		excep_SYS: out std_logic;
		excep_causa_SYS: out dato_camino;
		excep_CSR, int_CSR: in std_logic;
		mret_CSR, peCP_sys, peCSR, PBR_sys: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		opCSR: out st_opCSR;
		modo_csr: in st_modo
	);
end component;

end package componentes_control_SYS;
