--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentesUC is

component bloqueo_CP is
	port(
		valido, waitrequest: in std_logic;
		memoria_ocupada: out std_logic
	);
end component;


component bloqueo_B is
	port(
		fifo_llena: in std_logic;
		bloq_etapa_B, anula_read_B: out std_logic
	);
end component;

component bloqueo_A is
	port(
		valido, write, read, waitrequest: in std_logic;
		memoria_ocupada, inyec_M: out std_logic
	);
end component;

component bloqueo_M is
	port(
		readvalid, valido, write, read: in std_logic;
		load_en_curso, inyec_F, anula_pet_M: out std_logic
	);
end component;

component LIB is
	port(
		bloq_etapa_CP, bloq_etapa_DL, bloq_etapa_A, bloq_etapa_M: in std_logic;
		bloq_CP, bloq_DL, bloq_A, bloq_M: out std_logic;
		val_DL, val_A, val_M: in std_logic
	);
end component;

component riesgo_datos is
	port(
		IDL1_DL, IDL2_DL, IDE_A, IDE_M, IDE_F, IDE_ES: in reg_direcc;
		val_IDL1, val_IDL2, PBR_A, PBR_M, PBR_F, PBR_ES: in std_logic;
		bloq_etapa_DL, inyec_A: out std_logic
	);
end component;

component vaciado_segmentacion is 
  port (
		busqueda_en_curso, secuenciamiento: in std_logic;
		bloq_etapa_A, inyec_M, vaciado_segm: out std_logic
	);
end component;

component decoder_DL is
  port (
		--camino
		instr_DL: in st_instr;
		opALU: out st_opALU;
		bit_0: out std_logic;
		
		--permisos de escritura
		PBR: out std_logic;
		
		--multiplexores
		mLa_sel, mLb_sel: out st_mx2_sel;
		mEBR_sel: out st_mx4_sel;
		
		--formateadores
		fmti_tipo: out st_fmti_tipo;
		
		--señales para Avalon_MM
		read: out std_logic;
		write: out std_logic;
		
		--señales de validez
		val_DL: in std_logic;
		val_IDL1, val_IDL2: out std_logic;
				
		parar: out std_logic
	);
end component;

component decoder_A is
  port (
		--camino
		instr_A: in st_instr;
		address_A: in mem_direcc;
		ig, me, meu: in std_logic;
		
		--multiplexores
		msec_sel: out st_mx2_sel;
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		
		--señales para Avalon_MM
		byteenable: out st_byteenable;
		
		--señales de validez
		val_A: in std_logic;
		secuenciamiento: out std_logic
	);
		
end component;

component camino_control is
	port(
		reloj, Pcero: in std_logic;
		instr_e: in st_instr;
		bit_0_e, PBR_e, read_e, write_e: in std_logic;
		opALU_e: in st_opALU;
		mLa_sel_e, mLb_sel_e: in st_mx2_sel;
		mEBR_sel_e: in st_mx4_sel;
		fmtl_tipo_e: in st_fmtl_tipo;
		fmtl_ext_sig_e: in st_fmtl_ext_sig;
		IDE_e: in reg_direcc;
		
		instr_s: out st_instr;
		bit_0_s: out std_logic;
		opALU_s: out st_opALU;
		mLa_sel_s, mLb_sel_s: out st_mx2_sel;
		mEBR_sel_s: out st_mx4_sel;
		fmtl_tipo_s: out st_fmtl_tipo;
		fmtl_ext_sig_s: out st_fmtl_ext_sig;
		IDE_A, IDE_M, IDE_F, IDE_ES: out reg_direcc;
		PBR_A, PBR_M, PBR_F, PBR_ES: out std_logic;
		
		read_A, write_A, read_M, write_M: out std_logic;
		
		val_buff: in std_logic;
		
		bloq_DL, bloq_A, bloq_M, inyec_B, inyec_DL, inyec_A, inyec_M, inyec_F: in std_logic;
		val_DL, val_A, val_M, val_F: out std_logic
	);
end component;

end package componentesUC;
