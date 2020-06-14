library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentesUI.all;

--¿Cambiar nombre a UE (Unidad de Eventos)?
entity ensambladoUI is
	port(
		--reloj, puesta a cero y reset
		reloj, start, reset, Pcero: in std_logic;
		
		--unidad de control
		ultimo_ciclo: in std_logic;
		decodificacion: in std_logic;
		
		--unidad de proceso
		instr: in st_instr;
		mCP_sel, mESCSR_sel: out st_mx2_sel;
		CP_e, L_CSR: out dato_camino;
		CP_s, CPinst_s, L1: in dato_camino;
		int_peCP, PBR_priv: out std_logic;
		
		--interrupciones y excepciones
		irq: in st_irq;
		excep: in std_logic;
		excep_causa: in dato_camino
	);

end ensambladoUI;

architecture compor of ensambladoUI is

signal estadoI: st_estadoI;
signal int_causa_CSR, excep_causa_CSR, mstatus_CSR_cint, L_CSR_s, imm, IDL_CSR, DE_CSR: dato_camino;
signal int, int_CSR, excep_CSR, mret_CSR, peCSR: std_logic;
signal opCSR: st_opCSR;
signal mALU_CSR_sel: st_mx2_sel;

begin

csr: BR_CSR port map ( reloj => reloj, Pcero => Pcero, int_causa_CSR => int_causa_CSR, int_CSR => int_CSR,
							  mret_CSR => mret_CSR, CP_s => CP_s, CP_e => CP_e, CPinst_s => CPinst_s,
							  mstatus_s => mstatus_CSR_cint, excep_causa_CSR => excep_causa_CSR, excep_CSR => excep_CSR, 
							  L => L_CSR_s, IDL => IDL_CSR, DE => DE_CSR, peCSR => peCSR);
							  
cint: controlador_interrupciones port map (irq => irq, mstatus => mstatus_CSR_cint, mcause => int_causa_CSR,
														 int => int);

aei: automata_estado_int port map( reloj => reloj, start => start, reset => reset, instr => instr, decodificacion => decodificacion,
											  estadoI => estadoI, excep => excep_CSR);
		
decoPr: decoPriv port map (estadoI => estadoI, instr => instr, int => int, excep => excep, ultimo_ciclo => ultimo_ciclo,
									excep_causa => excep_causa, excep_CSR => excep_CSR, int_CSR => int_CSR, mret_CSR => mret_CSR,
									excep_causa_CSR => excep_causa_CSR, int_peCP => int_peCP, peCSR => peCSR, PBR_priv => PBR_priv,
									mCP_sel => mCP_sel, mALU_CSR_sel => mALU_CSR_sel, mESCSR_sel => mESCSR_sel, opCSR => opCSR);
													  
camino: camino_CSR port map(L_CSR => L_CSR_s, L1 => L1, imm => imm, DE_CSR => DE_CSR, opCSR => opCSR,
									 mALU_CSR_sel => mALU_CSR_sel);
							  

imm <= (tam_dato_camino-1 downto 5 => '0') & instr(11 downto 7);
IDL_CSR <= (tam_dato_camino-1 downto 12 => '0') & instr(tam_dato_camino-1 downto tam_dato_camino-12);
L_CSR <= L_CSR_s;
end;	
