--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentesUSYS.all;

entity ensambladoUSYS is
	port(
		--reloj y puesta a cero
		reloj, Pcero: in std_logic;
		
		--unidad de control
		ultimo_ciclo: in std_logic;
		decodificacion: in std_logic;
		modo_csr: out st_modo;
		
		--unidad de proceso
		instr: in st_instr;
		address: in mem_direcc;
		mCP_sel, mESCSR_sel: out st_mx2_sel;
		CP_e, L_CSR: out dato_camino;
		CP_s, CPinst_s, L1: in dato_camino;
		peCP_sys, PBR_sys: out std_logic;
		
		--interrupciones y excepciones
		irq: in st_irq;
		excep: in std_logic;
		excep_SYS: out std_logic;
		excep_causa: in dato_camino
	);

end ensambladoUSYS;

architecture compor of ensambladoUSYS is

signal int_causa_CSR, excep_causa_CSR, excep_causa_SYS, L_CSR_s, imm, ID_CSR, DE_CSR: dato_camino;
signal mstatus_CSR_recolector, mip_CSR_recolector, mie_CSR_recolector: st_csr;
signal modo_csr_s: st_modo;
signal int_CSR, excep_SYS_s, excep_CSR, mret_CSR, peCSR: std_logic;
signal opCSR: st_opCSR;
signal mALU_CSR_sel: st_mx2_sel;

begin

imm <= (tam_dato_camino-1 downto 5 => '0') & instr(11 downto 7);
ID_CSR <= (tam_dato_camino-1 downto 12 => '0') & instr(tam_dato_camino-1 downto tam_dato_camino-12);
L_CSR <= L_CSR_s;
modo_csr <= modo_csr_s;
excep_SYS <= excep_SYS_s;

csr: BR_CSR port map ( reloj => reloj, Pcero => Pcero, int_causa_CSR => int_causa_CSR, int_CSR => int_CSR,
							  mret_CSR => mret_CSR, CP_s => CP_s, CP_e => CP_e, CPinst_s => CPinst_s,
							  instr => instr, address => address,
							  mstatus_s => mstatus_CSR_recolector, excep_causa_CSR => excep_causa_CSR, excep_CSR => excep_CSR, 
							  L => L_CSR_s, ID => ID_CSR, DE => DE_CSR, peCSR => peCSR, mip_s => mip_CSR_recolector, 
							  mie_s => mie_CSR_recolector, irq => irq, modo_csr_s => modo_csr_s);
							  
							  
contSYS: control_SYS port map(reloj => reloj, Pcero => Pcero,
										instr => instr, decodificacion => decodificacion, excep_CSR => excep_CSR, int_CSR => int_CSR,
										mret_CSR => mret_CSR, peCP_sys => peCP_sys, peCSR => peCSR, PBR_sys => PBR_sys, mCP_sel => mCP_sel, 
										mALU_CSR_sel => mALU_CSR_sel, mESCSR_sel => mESCSR_sel, opCSR => opCSR,
										excep_SYS => excep_SYS_s, excep_causa_SYS => excep_causa_SYS, modo_csr => modo_csr_s);
													  
caminoSYS: camino_SYS port map(L_CSR => L_CSR_s, L1 => L1, imm => imm, DE_CSR => DE_CSR, opCSR => opCSR,
										 mALU_CSR_sel => mALU_CSR_sel);
							  										
recoEv: recolectorEventos port map(mip => mip_CSR_recolector, mstatus => mstatus_CSR_recolector, ultimo_ciclo => ultimo_ciclo,
										 excep => excep, excep_SYS => excep_SYS_s, excep_causa => excep_causa, excep_causa_SYS => excep_causa_SYS,
										 int_CSR => int_CSR, excep_CSR => excep_CSR, int_causa_CSR => int_causa_CSR,
										 excep_causa_CSR => excep_causa_CSR, mie => mie_CSR_recolector);
end;	
