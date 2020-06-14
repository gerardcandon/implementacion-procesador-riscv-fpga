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
		
		--unidad de proceso
		instr: in st_instr;
		mCP_sel, mESCSR_sel: out st_mx2_sel;
		CP_e, L_CSR: out dato_camino;
		CP_s, CPinst_s, L1: in dato_camino;
		int_peCP, PBR_sys: out std_logic;
		
		--registros mapeados en memoria
		read_csr, write_csr: in std_logic;
		readdata_csr: out dato_camino;
		writedata_csr: in dato_camino;
		address: in mem_direcc;
		byteenable_csr: in st_byteenable;
		
		
		--interrupciones y excepciones
		irq: in st_irq;
		excep: in std_logic;
		excep_causa: in dato_camino
	);

end ensambladoUSYS;

architecture compor of ensambladoUSYS is

signal int_causa_CSR, excep_causa_CSR, excep_causa_SYS, L_CSR_s, imm, ID_CSR, DE_CSR: dato_camino;
signal mie_CSR_CLINT, mstatus_CSR_gestor, mip_CSR_gestor: st_csr;
signal mtime_CSR_CLINT, mtimecmp_CSR_CLINT: st_csr_64;
signal int_CSR, excep_sys, excep_CSR, int_clk_CLINT_CSR, mret_CSR, peCSR: std_logic;
signal opCSR: st_opCSR;
signal mALU_CSR_sel: st_mx2_sel;

begin

imm <= (tam_dato_camino-1 downto 5 => '0') & instr(11 downto 7);
ID_CSR <= (tam_dato_camino-1 downto 12 => '0') & instr(tam_dato_camino-1 downto tam_dato_camino-12);
L_CSR <= L_CSR_s;

csr: BR_CSR port map ( reloj => reloj, Pcero => Pcero, int_causa_CSR => int_causa_CSR, int_CSR => int_CSR,
							  mret_CSR => mret_CSR, CP_s => CP_s, CP_e => CP_e, CPinst_s => CPinst_s,
							  mstatus_s => mstatus_CSR_gestor, excep_causa_CSR => excep_causa_CSR, excep_CSR => excep_CSR, 
							  L => L_CSR_s, ID => ID_CSR, DE => DE_CSR, peCSR => peCSR, int_clk => int_clk_CLINT_CSR,
							  read_csr => read_csr, write_csr => write_csr, readdata_csr => readdata_csr,
							  writedata_csr => writedata_csr, byteenable_csr => byteenable_csr, address => address,
							  mip_s => mip_CSR_gestor, mie_s => mie_CSR_CLINT, mtime_s => mtime_CSR_CLINT,
							  mtimecmp_s => mtimecmp_CSR_CLINT);
							  
							  
contSYS: control_SYS port map(reloj => reloj, Pcero => Pcero,
										instr => instr, decodificacion => decodificacion, excep_CSR => excep_CSR, int_CSR => int_CSR,
										mret_CSR => mret_CSR, int_peCP => int_peCP, peCSR => peCSR, PBR_sys => PBR_sys, mCP_sel => mCP_sel, 
										mALU_CSR_sel => mALU_CSR_sel, mESCSR_sel => mESCSR_sel, opCSR => opCSR,
										excep_SYS => excep_SYS, excep_causa_SYS => excep_causa_SYS);
													  
caminoSYS: camino_SYS port map(L_CSR => L_CSR_s, L1 => L1, imm => imm, DE_CSR => DE_CSR, opCSR => opCSR,
										 mALU_CSR_sel => mALU_CSR_sel);
							  
localinterruptor: CLINT port map(mtime => mtime_CSR_CLINT, mtimecmp => mtimecmp_CSR_CLINT, mie => mie_CSR_CLINT,
											int_clk => int_clk_CLINT_CSR);
										
gestEv: gestorEventos port map(irq => irq, mip => mip_CSR_gestor, mstatus => mstatus_CSR_gestor, ultimo_ciclo => ultimo_ciclo,
										 excep => excep, excep_SYS => excep_SYS, excep_causa => excep_causa, excep_causa_SYS => excep_causa_SYS,
										 int_CSR => int_CSR, excep_CSR => excep_CSR, int_causa_CSR => int_causa_CSR,
										 excep_causa_CSR => excep_causa_CSR);
end;	
