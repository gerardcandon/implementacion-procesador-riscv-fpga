library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;
use work.componentes_decoSYS.all;

entity decoSYS is
	port(
		estadoSYS: in st_estadoSYS;
		instr: in st_instr;
		excep_SYS: out std_logic;
		excep_causa_SYS: out dato_camino;
		excep_CSR, int_CSR: in std_logic;
		mret_CSR, int_peCP, peCSR, PBR_sys: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		opCSR: out st_opCSR
	);
end decoSYS;

architecture compor of decoSYS is

begin
	
	decoCam_sys: decoCamino_SYS port map (estadoSYS => estadoSYS, excep_CSR => excep_CSR,
													  int_CSR => int_CSR, mret_CSR => mret_CSR, mCP_sel => mCP_sel,
													  mALU_CSR_sel => mALU_CSR_sel, mESCSR_sel => mESCSR_sel,
													  int_peCP => int_peCP, peCSR => peCSR, PBR_sys => PBR_sys,
													  opCSR => opCSR);
													  
	decoExc_sys: decoExcep_SYS port map (estadoSYS => estadoSYS, instr => instr, excep_SYS => excep_SYS,
												    excep_causa_SYS => excep_causa_SYS);
end;