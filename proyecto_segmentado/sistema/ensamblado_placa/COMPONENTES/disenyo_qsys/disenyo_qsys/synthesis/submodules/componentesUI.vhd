library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentesUI is

component automata_estado_int is
	port (
		reloj, start, reset: in std_logic;
		instr: in st_instr;
		decodificacion, excep: in std_logic;
		estadoI: out st_estadoI
	);
end component;

component controlador_interrupciones is
	port(
		irq: in st_irq;
		mcause: out dato_camino;
		mstatus: in dato_camino;
		int: out std_logic
	);
end component;

component BR_CSR is
	port(
		reloj, Pcero: in std_logic;
		
		IDL, DE: in dato_camino;
		L: out dato_camino;
		
		int_causa_CSR: in dato_camino;    --conectado al controlador de interrupciones
		peCSR, int_CSR, mret_CSR: in std_logic;
		CP_s, CPinst_s: in dato_camino;		  --salida del registro CP y CPinst
		
		mstatus_s: out dato_camino;  --conectado al controlador de interrupciones
		CP_e: out dato_camino;		  --entrada al registro CP
		
		excep_causa_CSR: in dato_camino; 
		excep_CSR: in std_logic
	);
end component;

component decoPriv is
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
end component;

component camino_CSR is
	port(
		L_CSR, L1, imm: in dato_camino;
		DE_CSR: out dato_camino;
		opCSR: in st_opCSR;
		mALU_CSR_sel: in st_mx2_sel
	);
end component;

end package componentesUI;
