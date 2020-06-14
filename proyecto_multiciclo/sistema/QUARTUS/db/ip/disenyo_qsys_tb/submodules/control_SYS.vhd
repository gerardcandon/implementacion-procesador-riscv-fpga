library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentes_control_SYS.all;

--controlSYS, encargado de emitir las señales de control relativas a interrupciones, excepciones y
--camino de datos des sistema. Emite señales relativas a las excepciones producidas por instrucciones
--de sistema (excepSYS y excep_causaSYS). Recibe señales relativas a interrupciones y excepciones
--(int_CSR y excep_CSR).

entity control_SYS is
	port (
		reloj, Pcero: in std_logic;
		instr: in st_instr;
		decodificacion, excep_CSR, int_CSR: in std_logic;
		excep_SYS, mret_CSR, int_peCP, peCSR, PBR_sys: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		excep_causa_SYS: out dato_camino;
		opCSR: out st_opCSR
	);
end control_SYS;

architecture compor of control_SYS is
signal estadoSYS: st_estadoSYS;

begin

decSYS: decoSYS port map (estadoSYS => estadoSYS, instr => instr,
									excep_CSR => excep_CSR, int_CSR => int_CSR, mret_CSR => mret_CSR, int_peCP => int_peCP, 
									peCSR => peCSR, PBR_sys => PBR_sys, mCP_sel => mCP_sel, mALU_CSR_sel => mALU_CSR_sel, 
									mESCSR_sel => mESCSR_sel, opCSR => opCSR,
									excep_SYS => excep_SYS, excep_causa_SYS => excep_causa_SYS);

aeSYS: automata_estado_SYS port map( reloj => reloj, Pcero => Pcero, instr => instr, decodificacion => decodificacion,
											    estadoSYS => estadoSYS, excep_CSR => excep_CSR);

end;