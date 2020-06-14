--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_decoder_DL is
	
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

component decoFMT_DL is 
  port (
		instr_DL: in st_instr;
		val_DL: in std_logic;
		fmti_tipo: out st_fmti_tipo
		);
end component;

component decoMem_DL is 
  port (
		instr: in st_instr;
		val_DL: in std_logic;
		read, write: out std_logic
	);
end component;

component decoopALU is 
  port (instr: in st_instr;
		val_DL: in std_logic;
		opALU: out st_opALU);
end component;


end package componentes_decoder_DL;
