--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_decoder is
	
component decocamino is 
  port (
		estado: in st_estado;
		instr: in st_instr;
		peRI, PBR, peRsec, bit_0: out std_logic;
		mdir_sel, mEBR_sel, mdato_sel : out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel
		);
end component;

component decoopALU is 
  port (
		instr: in st_instr;
		estado: in st_estado;
		opALU: out st_opALU);
end component;

component decoMem is 
  port (
		instr: in st_instr;
		estado: in st_estado;
		byteenable: out st_byteenable;
		read, write: out std_logic;
		address: in mem_direcc);
end component;

component decoSec is 
  port (instr: in st_instr;
		estado: in st_estado;
		ig, me, meu: in std_logic;
		msec_sel, mdirsec_sel: out st_mx2_sel;
		peCP, peCPinst: out std_logic;
		readvalid: in std_logic);
end component;

component decoFMT is 
  port (
		reloj, Pcero: in std_logic;
		instr: in st_instr;
		estado: in st_estado;
		address: in mem_direcc;
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo);
end component;

component decoExcep is 
  port (
	  estado: in st_estado;
	  instr: in st_instr;
	  direccion_mem: in mem_direcc;
	  excep: out std_logic;
	  excep_causa: out dato_camino;
	  modo_csr: in st_modo;
	  parar: out std_logic
	  );
end component;


end package componentes_decoder;
