library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;
use work.componentes_decoPriv.all;

entity decoPriv is
	port(
		estadoI: in st_estadoI;
		instr: in st_instr;
		int, excep, ultimo_ciclo: in std_logic;
		excep_causa: in dato_camino;
		excep_causa_CSR: out dato_camino;
		excep_CSR, int_CSR, mret_CSR, int_peCP, peCSR, PBR_priv: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		opCSR: out st_opCSR
	);
end decoPriv;

architecture compor of decoPriv is

signal excep_sys, excep_CSR_s: std_logic;
signal excep_causa_sys: dato_camino;

begin

	excep_CSR_s <= excep or excep_sys;
	excep_causa_CSR <= excep_causa or excep_causa_sys;
	excep_CSR <= excep_CSR_s;
	
	decoCam_sys: decoCamino_SYS port map (estadoI => estadoI, int => int, excep => excep_CSR_s,
													  int_CSR => int_CSR, mret_CSR => mret_CSR, mCP_sel => mCP_sel,
													  mALU_CSR_sel => mALU_CSR_sel, mESCSR_sel => mESCSR_sel,
													  int_peCP => int_peCP, peCSR => peCSR, PBR_priv => PBR_priv,
													  opCSR => opCSR, ultimo_ciclo => ultimo_ciclo);

	decoExc_sys: decoExcep_SYS port map (estadoI => estadoI, instr => instr, excep => excep_sys,
												    excep_causa => excep_causa_sys);
end;