--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;
use work.componentes_decoder_DL.all;

entity decoder_DL is
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
		
end decoder_DL;

architecture compor of decoder_DL is

signal PBR_s: std_logic;
signal fmti_tipo_s: st_fmti_tipo;
signal bit_0_s: std_logic;
signal opALU_s: st_opALU;
signal mLa_sel_s, mLb_sel_s: st_mx2_sel;
signal mEBR_sel_s: st_mx4_sel;
signal read_s: std_logic;
signal write_s: std_logic;
signal parar_s: std_logic;
signal s_val_IDL1, s_val_IDL2: std_logic;

begin

camino: decocamino port map (instr => instr_DL, val_DL => val_DL, mEBR_sel => mEBR_sel_s, PBR => PBR_s,
									  mLa_sel => mLa_sel_s, mLb_sel => mLb_sel_s, bit_0 => bit_0_s, 
									  val_IDL1 => s_val_IDL1, val_IDL2 => s_val_IDL2, parar => parar_s);

ALU: decoopALU port map (instr => instr_DL, val_DL => val_DL, opALU => opALU_s);

MEMORIA_DL: decoMem_DL port map (instr => instr_DL, val_DL => val_DL, read => read_s, write => write_s);

FMT_DL: decoFMT_DL port map (instr_DL => instr_DL, val_DL => val_DL, fmti_tipo => fmti_tipo_s);

mEBR_sel 	  <= mEBR_sel_s      after ret_decoder;
PBR 			  <= PBR_s 		      after ret_decoder;
mLa_sel 		  <= mLa_sel_s 	   after ret_decoder;
mLb_sel 		  <= mLb_sel_s 	   after ret_decoder;
bit_0 		  <= bit_0_s 	      after ret_decoder;
opALU 		  <= opALU_s 	      after ret_decoder;
read 			  <= read_s 	      after ret_decoder;
write         <= write_s 	      after ret_decoder;
fmti_tipo     <= fmti_tipo_s     after ret_decoder;
parar			  <= parar_s			after ret_decoder;
val_IDL1		  <= s_val_IDL1		after ret_decoder;
val_IDL2		  <= s_val_IDL2		after ret_decoder;

end;

