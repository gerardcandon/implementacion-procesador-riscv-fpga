--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;
use work.componentes_decoder_A.all;

entity decoder_A is
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
		
end decoder_A;

architecture compor of decoder_A is

signal fmte_tipo_s: st_fmte_tipo;
signal fmtl_tipo_s: st_fmtl_tipo;
signal fmtl_ext_sig_s: st_fmtl_ext_sig;
signal byteenable_s: st_byteenable;
signal msec_sel_s: st_mx2_sel;
signal secuenciamiento_s: std_logic;
begin

MEMORIA_A: decoMem_A port map (instr_A => instr_A, val_A => val_A, address_A => address_A,
										 byteenable => byteenable_s);

FMT_A: decoFMT_A port map (instr_A => instr_A, val_A => val_A, address_A => address_A, 
									fmte_tipo => fmte_tipo_s, fmtl_tipo => fmtl_tipo_s, 
									fmtl_ext_sig => fmtl_ext_sig_s);

SEC: decoSec port map (instr_A => instr_A, val_A => val_A, ig => ig, me => me, meu => meu,
							  msec_sel => msec_sel_s, secuenciamiento => secuenciamiento_s);
									
fmte_tipo 	    <= fmte_tipo_s	    after ret_decoder;
fmtl_tipo 	    <= fmtl_tipo_s 	    after ret_decoder;
fmtl_ext_sig    <= fmtl_ext_sig_s    after ret_decoder;
byteenable 	    <= byteenable_s 	    after ret_decoder;
msec_sel 	    <= msec_sel_s 	    after ret_decoder;
secuenciamiento <= secuenciamiento_s after ret_decoder;
end;

