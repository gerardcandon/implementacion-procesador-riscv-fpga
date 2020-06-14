library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentesUSYS is

component control_SYS is
	port (
		reloj, Pcero: in std_logic;
		instr: in st_instr;
		decodificacion, excep_CSR, int_CSR: in std_logic;
		excep_SYS, mret_CSR, peCP_sys, peCSR, PBR_sys: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		excep_causa_SYS: out dato_camino;
		opCSR: out st_opCSR;
		modo_csr: in st_modo
	);
end component;

component BR_CSR is
	port(
		reloj, Pcero: in std_logic;
		
		ID, DE: in dato_camino;
		L: out dato_camino;
		
		peCSR, int_CSR, excep_CSR, mret_CSR: in std_logic;
		int_causa_CSR, excep_causa_CSR: in dato_camino;    

		--camino de datos - alteracion del flujo de interpretacion de instrucciones
		CP_s, CPinst_s: in dato_camino;		  --salida del registro CP y CPinst
		CP_e: out dato_camino;
		--camino de datos - entradas para mtval
		address: in mem_direcc;
		instr: in dato_camino;

		--salida registros CSR
		mstatus_s, mcause_s, mie_s, mip_s: out st_csr;
		modo_csr_s: out st_modo;
		
		--interrupciones
		irq: st_irq
	);
end component;

component camino_SYS is
	port(
		L_CSR, L1, imm: in dato_camino;
		DE_CSR: out dato_camino;
		opCSR: in st_opCSR;
		mALU_CSR_sel: in st_mx2_sel
	);
end component;

component CLINT is
	port(
		mtime, mtimecmp: in st_csr_64;
		int_clk: out std_logic
	);
end component;

component recolectorEventos is
	port(
		mip, mie, mstatus: in st_csr;
		ultimo_ciclo, excep, excep_SYS: in std_logic;
		excep_causa, excep_causa_SYS: in dato_camino;
		int_CSR, excep_CSR: out std_logic;
		int_causa_CSR, excep_causa_CSR: out dato_camino
	);
end component;

end package componentesUSYS;
