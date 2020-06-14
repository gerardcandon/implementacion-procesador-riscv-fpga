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
		mret_CSR, peCP_sys, peCSR, PBR_sys: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		opCSR: out st_opCSR;
		modo_csr: in st_modo
	);
end decoSYS;

architecture compor of decoSYS is

begin
	
	decoCam_sys: decoCamino_SYS port map (estadoSYS => estadoSYS, excep_CSR => excep_CSR,
													  int_CSR => int_CSR, mret_CSR => mret_CSR, mCP_sel => mCP_sel,
													  mALU_CSR_sel => mALU_CSR_sel, mESCSR_sel => mESCSR_sel,
													  peCP_sys => peCP_sys, peCSR => peCSR, PBR_sys => PBR_sys,
													  opCSR => opCSR);
													  
	decoExc_sys: decoExcep_SYS port map (estadoSYS => estadoSYS, instr => instr, excep_SYS => excep_SYS,
												    excep_causa_SYS => excep_causa_SYS, modo_csr => modo_csr);
end;