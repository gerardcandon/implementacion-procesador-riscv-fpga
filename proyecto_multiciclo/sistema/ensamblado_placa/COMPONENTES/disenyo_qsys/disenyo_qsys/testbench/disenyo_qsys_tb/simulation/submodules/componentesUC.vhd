--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentesUC is

component decoder is
port (
		reloj, Pcero: in std_logic;
		estado: in st_estado;
		
		--camino
		instr: in st_instr;
		ig, me, meu: in std_logic;
		opALU: out st_opALU;
		bit_0: out std_logic;
		direccion_mem: in mem_direcc;
		
		--permisos de escritura
		peCP, peCPinst, peRI, PBR, peRsec: out std_logic;
		
		--multiplexores
		mdir_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel: out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel;
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--señales para Avalon_MM
		address: in mem_direcc;
		byteenable: out st_byteenable;
		read: out std_logic;
		write: out std_logic;
		waitrequest: in std_logic;
		readvalid: in std_logic;
		
		--excepciones
		excep: out std_logic;
		excep_causa: out dato_camino;
		excep_SYS: in std_logic;
		modo_csr: in st_modo;
		
		parar: out std_logic
	);
		
end component;

component automata_estado is
	port (
		reloj, start, reset: in std_logic;
		Pcero: out std_logic;
		instr: in st_instr;
		address: in mem_direcc;
		waitrequest, readvalid: in std_logic;
		estado: out st_estado;
		--interrupciones y excepciones
		ultimo_ciclo, decodificacion: out std_logic;
		excep, excep_SYS: in std_logic
	);
end component;

end package componentesUC;
