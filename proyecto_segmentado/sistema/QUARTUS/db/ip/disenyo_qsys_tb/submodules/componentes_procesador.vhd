library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_procesador is

component ensambladoUC is
	port(
		--reloj, puesta a cero y reset
		reloj, start, reset: in std_logic;					
		Pcero: out std_logic;
		
		--camino
		instr: in st_instr;										
		ig, me, meu: in std_logic;
		bit_0: out std_logic;
		opALU: out st_opALU;
		direccion_mem: in mem_direcc;
		
		--multiplexores
		mdir_sel, mRLDM_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel: out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel;
		
		--permisos de escritura
		peCP, peCPinst, peRI, PBR, peRsec: out std_logic;	
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;							
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--señales para Avalon_MM
		address: in mem_direcc;
		byteenable: out st_byteenable;
		read, write: out std_logic;
		waitrequest: in std_logic;
		readvalid: in std_logic;
		
		--registros mapeados en memoria
		read_csr, write_csr: out std_logic;
		
		--excepciones e interrupciones
		ultimo_ciclo, decodificacion, excep: out std_logic;
		excep_causa: out dato_camino
	);

end component;

component ensambladoUP is
	port (
		--reloj y puesta a cero
		reloj, Pcero: in std_logic;
		
		--camino
		instr: out st_instr;
		ig, me, meu: out std_logic;
		bit_0: in std_logic;
		opALU: in st_opALU;
		
		--permisos de escritura
		peCP, peRI, PBR, peRsec, peCPinst: in std_logic;
		
		--multiplexores
		mdir_sel, mRLDM_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel, mCP_sel: in st_mx2_sel;
		mLa_sel, mLb_sel: in st_mx3_sel;
		
		--formateadores
		fmti_tipo: in st_fmti_tipo;
		fmte_tipo: in st_fmte_tipo;
		fmtl_tipo: in st_fmtl_tipo;
		fmtl_ext_sig: in st_fmtl_ext_sig;
		
		--señales para AvalonMM
		writedata: out dato_camino;
		readdata: in dato_camino;
		address: out mem_direcc;
		
		--registros mapeados en memoria
		readdata_csr: in dato_camino;
		
		--excepciones e interrupciones
		CP_e: in dato_camino;
		CP_s, CPinst_s: out dato_camino;
		
		--camino privilegiado
		L1: out dato_camino;
		L_CSR: in dato_camino;
		mESCSR_sel: in st_mx2_sel
	);
end component;

component ensambladoUSYS is
	port(
		--reloj, puesta a cero y reset
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
end component;
end package componentes_procesador;
