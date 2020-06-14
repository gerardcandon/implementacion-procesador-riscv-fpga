--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_decoder_A is
	
component decoSec is 
  port (
		instr_A: in st_instr;
		val_A: in std_logic;
		ig, me, meu: in std_logic;
		msec_sel: out st_mx2_sel;
		secuenciamiento: out std_logic
	);
end component;

component decoMem_A is 
  port (
		instr_A: in st_instr;
		val_A: in std_logic;
		byteenable: out st_byteenable;
		address_A: in mem_direcc);
end component;

component decoFMT_A is 
  port (
		instr_A: in st_instr;
		val_A: in std_logic;
		address_A: in mem_direcc;
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig);
end component;

end package componentes_decoder_A;
