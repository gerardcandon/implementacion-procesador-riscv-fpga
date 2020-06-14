--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentesUP is

component etapaCP is
	port(
		reloj, Pcero: in std_logic;
		CPsec: in dato_camino;
		msec_sel: in st_mx2_sel;
		bloq_CP: in std_logic;
		
		CP_s, address_B: out dato_camino
	);
end component;

component etapaB is
	port(
		reloj, Pcero: in std_logic;
		CP_e: in dato_camino;
		instr_s: out dato_camino;
		readdata_B: in dato_camino;
		read_B, waitrequest_B: in std_logic;
		vaciado_fifo, readvalid_B, bloq_DL: in std_logic;
		val_buff, fifo_llena: out std_logic;
		buff_CP_s: out dato_camino
	);
end component;

component etapaDL is
	port(
		reloj, Pcero: in std_logic;
		instr_e, CP_e, DE: in dato_camino;
		fmti_tipo: in st_fmti_tipo;
		IDE_e: in reg_direcc;
		PBR: in std_logic;
		instr_s, CP_s, L1, L2, imm: out dato_camino;
		IDL1_s, IDL2_s, IDE_s: out reg_direcc;
		bloq_DL, inyec_DL: in std_logic
	);
end component;

component etapaA is
	port(
		reloj, Pcero: in std_logic;
		CP_e, L1, L2, imm_e: in dato_camino;
		opALU: in st_opALU;
		fmte_tipo: in st_fmte_tipo;
		mLa_sel, mLb_sel: in st_mx2_sel;
		bit_0: in std_logic;
		CP_s, alu_s, EDM, imm_s: out dato_camino;
		ig, me, meu: out std_logic;
		bloq_A, inyec_A: in std_logic
	);
end component;

component etapaM is
	port(
		reloj, Pcero: in std_logic;
		CP_e, alu_e, EDM_e, imm_e, readdata_M: in dato_camino;
		CP_s, alu_s, writedata_M, imm_s, LDM_s: out dato_camino;
		bloq_M: in std_logic
	);
end component;

component etapaF is
	port(
		reloj, Pcero: in std_logic;
		CP, alu, LDM, imm: in dato_camino;
		mEBR_sel: in st_mx4_sel;
		fmtl_tipo: in st_fmtl_tipo;
		fmtl_ext_sig: in st_fmtl_ext_sig;
		DE: out dato_camino
	);
end component;

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

end package componentesUP;
