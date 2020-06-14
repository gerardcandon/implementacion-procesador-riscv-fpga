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
		excep_SYS, mret_CSR, int_peCP, peCSR, PBR_sys: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		excep_causa_SYS: out dato_camino;
		opCSR: out st_opCSR
	);
end component;

component BR_CSR is
	port(
		reloj, Pcero: in std_logic;
		
		ID, DE: in dato_camino;
		L: out dato_camino;
		
		peCSR, int_CSR, excep_CSR, mret_CSR: in std_logic;
		int_causa_CSR, excep_causa_CSR: in dato_camino;    

		CP_s, CPinst_s: in dato_camino;		  --salida del registro CP y CPinst
		
		mstatus_s: out dato_camino;  --conectado al controlador de interrupciones
		mcause_s: out dato_camino;   --conectado al gestor de eventos
		CP_e: out dato_camino;		  --entrada al registro CP
		
		--lectura y escritura mapeada en memoria
		read_csr, write_csr: in std_logic;
		byteenable_csr: in st_byteenable;
		writedata_csr: in dato_camino;
		readdata_csr: out dato_camino;
		address: in mem_direcc;
		
		--interrupciones reloj
		int_clk: in std_logic;
		mtime_s, mtimecmp_s: out st_csr_64;
		mie_s, mip_s: out st_csr
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
		mie: in st_csr;
		int_clk: out std_logic
	);
end component;

component gestorEventos is
	port(
		irq: in st_irq;
		mip, mstatus: in st_csr;
		ultimo_ciclo, excep, excep_SYS: in std_logic;
		excep_causa, excep_causa_SYS: in dato_camino;
		int_CSR, excep_CSR: out std_logic;
		int_causa_CSR, excep_causa_CSR: out dato_camino
	);
end component;

end package componentesUSYS;
