library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_decoder is
	
component decocamino is 
  port (
		instr: in st_instr;
		val_DL: in std_logic;
		PBR, bit_0: out std_logic;
		mEBR_sel: out st_mx4_sel;
		mLa_sel, mLb_sel: out st_mx2_sel;
		val_IDL1, val_IDL2: out std_logic;
		parar: out std_logic
	);
end component;

component decoFMT is 
  port (
		instr_DL, instr_A: in st_instr;
		address_A: in mem_direcc;
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo);
end component;

component decoMem is 
  port (
		instr: in st_instr;
		val_A: in std_logic;
		byteenable: out st_byteenable;
		read, write: out std_logic;
		address: in mem_direcc);
end component;

component decoopALU is 
  port (instr: in st_instr;
		val_DL: in std_logic;
		opALU: out st_opALU);
end component;

component decoSec is 
  port (instr: in st_instr;
		val_A, leyendo_B: in std_logic;
		ig, me, meu: in std_logic;
		msec_sel: out st_mx2_sel;
		bloq_etapa_A, inyec_B, inyec_DL, inyec_A, inyec_M: out std_logic
	);
end component;


end package componentes_decoder;
