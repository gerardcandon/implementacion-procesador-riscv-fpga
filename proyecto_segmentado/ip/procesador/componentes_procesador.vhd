--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_procesador is

component ensambladoUC is
	port(
		--reloj, puesta a cero y reset
		reloj, Pcero: in std_logic;
		
		--camino
		instr_DL: in st_instr;										
		ig, me, meu: in std_logic;
		alu_s: in mem_direcc;
		IDL1_DL, IDL2_DL, IDE_DL: in reg_direcc;
		IDE_F: out reg_direcc;
		bit_0: out std_logic;
		opALU: out st_opALU;
		
		--multiplexores
		msec_sel, mLa_sel, mLb_sel: out st_mx2_sel;
		mEBR_sel: out st_mx4_sel;
		
		--permisos de escritura
		PBR: out std_logic;	
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;							
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--memoria
		byteenable_M: out st_byteenable;
		read_B, read_M, write_M: out std_logic;
		waitrequest_B, waitrequest_M: in std_logic;
		readvalid_B, readvalid_M: in std_logic;
		
		--bloqueo e inyeccion
		bloq_CP, bloq_DL, bloq_A, bloq_M, inyec_DL, inyec_A: out std_logic;
		
		val_buff, fifo_llena: in std_logic;
		
		secuenciamiento: out std_logic;
		parar: out std_logic
	);

end component;

component ensambladoUP is
	port (
		--reloj y puesta a cero
		reloj, Pcero: in std_logic;
		
		--camino
		instr_DL: out st_instr;
		ig, me, meu: out std_logic;
		bit_0: in std_logic;
		opALU: in st_opALU;
		alu_s: out mem_direcc;
		IDL1_DL, IDL2_DL, IDE_DL: out reg_direcc;
		IDE_F: in reg_direcc;
		
		--permisos de escritura
		PBR: in std_logic;
		
		--multiplexores
		msec_sel, mLa_sel, mLb_sel: in st_mx2_sel;
		mEBR_sel: in st_mx4_sel;
		
		--formateadores
		fmti_tipo: in st_fmti_tipo;
		fmte_tipo: in st_fmte_tipo;
		fmtl_tipo: in st_fmtl_tipo;
		fmtl_ext_sig: in st_fmtl_ext_sig;
				
		--señales para AvalonMM
		writedata_M: out dato_camino;
		readdata_B, readdata_M: in dato_camino;
		address_B, address_M: out mem_direcc;
		read_B, waitrequest_B, readvalid_B: in std_logic;
		
		--bloqueo
		bloq_CP, bloq_DL, bloq_A, bloq_M: in std_logic;
		--inyeccion de NOPs
		inyec_DL, inyec_A: in std_logic;
		
		--control fifo
		val_buff, fifo_llena: out std_logic;
		secuenciamiento: in std_logic
	);
end component;

end package componentes_procesador;
