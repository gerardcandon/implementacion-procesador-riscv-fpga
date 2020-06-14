library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;
use work.componentes_decoder.all;

entity decoder is
  port (
		--camino
		instr_DL, instr_A: in st_instr;
		ig, me, meu: in std_logic;
		opALU: out st_opALU;
		bit_0: out std_logic;
		
		--permisos de escritura
		PBR: out std_logic;
		
		--multiplexores
		msec_sel, mLa_sel, mLb_sel: out st_mx2_sel;
		mEBR_sel: out st_mx4_sel;
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--señales para Avalon_MM
		address_A: in mem_direcc;
		byteenable: out st_byteenable;
		read: out std_logic;
		write: out std_logic;
		
		--señales de validez
		val_DL, val_A: in std_logic;
		val_IDL1, val_IDL2: out std_logic;
		
		leyendo_B: in std_logic;
		bloq_etapa_A, inyec_B, inyec_DL, inyec_A, inyec_M: out std_logic;
		
		parar: out std_logic
	);
		
end decoder;

architecture compor of decoder is

signal PBR_s: std_logic;
signal fmti_tipo_s: st_fmti_tipo;
signal fmtl_tipo_s: st_fmtl_tipo;
signal fmtl_ext_sig_s: st_fmtl_ext_sig;
signal fmte_tipo_s: st_fmte_tipo;
signal bit_0_s: std_logic;
signal opALU_s: st_opALU;
signal msec_sel_s, maddress_sel_s, mLa_sel_s, mLb_sel_s: st_mx2_sel;
signal mEBR_sel_s: st_mx4_sel;
signal byteenable_s: st_byteenable;
signal read_s: std_logic;
signal write_s: std_logic;
signal parar_s: std_logic;
signal s_bloq_etapa_A, s_inyec_B, s_inyec_DL, s_inyec_A, s_inyec_M: std_logic;
signal s_val_IDL1, s_val_IDL2: std_logic;

begin

camino: decocamino port map (instr => instr_DL, val_DL => val_DL, mEBR_sel => mEBR_sel_s, PBR => PBR_s,
									  mLa_sel => mLa_sel_s, mLb_sel => mLb_sel_s, bit_0 => bit_0_s, 
									  val_IDL1 => s_val_IDL1, val_IDL2 => s_val_IDL2, parar => parar_s);

ALU: decoopALU port map (instr => instr_DL, val_DL => val_DL, opALU => opALU_s);

MEMORIA: decoMem port map (instr => instr_A, val_A => val_A, byteenable => byteenable_s, 
									read => read_s, write => write_s, address => address_A);

SECUEN: decoSec port map (instr => instr_A, val_A => val_A, ig => ig, me => me, meu => meu, msec_sel => msec_sel_s,
								  inyec_B => s_inyec_B, inyec_DL => s_inyec_DL, inyec_A => s_inyec_A, inyec_M => s_inyec_M,
								  bloq_etapa_A => s_bloq_etapa_A, leyendo_B => leyendo_B);

FMT: decoFMT port map (instr_DL => instr_DL, instr_A => instr_A, address_A => address_A, fmte_tipo => fmte_tipo_s, 
							  fmtl_tipo => fmtl_tipo_s, fmtl_ext_sig => fmtl_ext_sig_s, fmti_tipo => fmti_tipo_s);

msec_sel 	  <= msec_sel_s      after ret_decoder;
mEBR_sel 	  <= mEBR_sel_s      after ret_decoder;
PBR 			  <= PBR_s 		      after ret_decoder;
mLa_sel 		  <= mLa_sel_s 	   after ret_decoder;
mLb_sel 		  <= mLb_sel_s 	   after ret_decoder;
bit_0 		  <= bit_0_s 	      after ret_decoder;
opALU 		  <= opALU_s 	      after ret_decoder;
byteenable 	  <= byteenable_s    after ret_decoder;
read 			  <= read_s 	      after ret_decoder;
write         <= write_s 	      after ret_decoder;
fmte_tipo     <= fmte_tipo_s     after ret_decoder;
fmtl_tipo     <= fmtl_tipo_s     after ret_decoder;
fmtl_ext_sig  <= fmtl_ext_sig_s  after ret_decoder;
fmti_tipo     <= fmti_tipo_s     after ret_decoder;
parar			  <= parar_s			after ret_decoder;
inyec_B		  <= s_inyec_B		   after ret_decoder;
inyec_DL		  <= s_inyec_DL		after ret_decoder;
inyec_A		  <= s_inyec_A		   after ret_decoder;
inyec_M		  <= s_inyec_M			after ret_decoder;
bloq_etapa_A  <= s_bloq_etapa_A  after ret_decoder;
val_IDL1		  <= s_val_IDL1		after ret_decoder;
val_IDL2		  <= s_val_IDL2		after ret_decoder;

end;

