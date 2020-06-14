--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentesUP.all;

entity ensambladoUP is
	port (
		--reloj y puesta a cero
		reloj, Pcero: in std_logic;
		
		--camino
		instr_DL: out st_instr;
		ig, me, meu: out std_logic;
		bit_0: in std_logic;
		opALU: in st_opALU;
		alu_s: out mem_direcc;
		IDL1_DL, IDL2_DL, IDE_DL: out reg_direcc;
		IDE_F: in reg_direcc;
		
		--permisos de escritura
		PBR: in std_logic;
		
		--multiplexores
		msec_sel, mLa_sel, mLb_sel: in st_mx2_sel;
		mEBR_sel: in st_mx4_sel;
		
		--formateadores
		fmti_tipo: in st_fmti_tipo;
		fmte_tipo: in st_fmte_tipo;
		fmtl_tipo: in st_fmtl_tipo;
		fmtl_ext_sig: in st_fmtl_ext_sig;
				
		--señales para AvalonMM
		writedata_M: out dato_camino;
		readdata_B, readdata_M: in dato_camino;
		address_B, address_M: out mem_direcc;
		read_B, waitrequest_B, readvalid_B: in std_logic;
		
		--bloqueo
		bloq_CP, bloq_DL, bloq_A, bloq_M: in std_logic;
		--inyeccion de NOPs
		inyec_DL, inyec_A: in std_logic;
		
		--control fifo
		val_buff, fifo_llena: out std_logic;
		secuenciamiento: in std_logic
	);
end ensambladoUP;

architecture compor of ensambladoUP is
signal CP_B, CP_BDL, CP_DLA, CP_AM, CP_MF: dato_camino;
signal L1_DLA, L2_DLA: dato_camino;
signal imm_DLA, imm_AM, imm_MF: dato_camino;
signal instr_BDL: mem_direcc;
signal alu_AM, alu_MF: dato_camino;
signal EDM_AM: dato_camino;
signal LDM_MF: dato_camino;
signal DE: dato_camino;
signal buff_CP: dato_camino;

begin

eCP: etapaCP port map (reloj => reloj, Pcero => Pcero, CPsec => alu_AM, msec_sel => msec_sel, CP_s => CP_B,
							  bloq_CP => bloq_CP, address_B => address_B);
eB: etapaB port map (reloj => reloj, Pcero => Pcero, CP_e => CP_B,
							bloq_DL => bloq_DL, readvalid_B => readvalid_B, val_buff => val_buff,
							instr_s => instr_BDL, readdata_B => readdata_B, fifo_llena => fifo_llena,
							buff_CP_s => buff_CP, waitrequest_B => waitrequest_B, read_B => read_B,
							vaciado_fifo => secuenciamiento);
eDL: etapaDL port map (reloj => reloj, Pcero => Pcero, instr_e => instr_BDL, CP_e => buff_CP, DE => DE,
							  fmti_tipo => fmti_tipo, IDE_e => IDE_F, PBR => PBR, instr_s => instr_DL, CP_s => CP_DLA,
							  L1 => L1_DLA, L2 => L2_DLA, imm => imm_DLA, 
							  IDL1_s => IDL1_DL, IDL2_s => IDL2_DL, IDE_s => IDE_DL, bloq_DL => bloq_DL,
							  inyec_DL => inyec_DL);
eA: etapaA port map (reloj => reloj, Pcero => Pcero,
							CP_e => CP_DLA, L1 => L1_DLA, L2 => L2_DLA, imm_e => imm_DLA,
							opALU => opALU, fmte_tipo => fmte_tipo, 
							mLa_sel => mLa_sel, mLb_sel => mLb_sel, CP_s => CP_AM, alu_s => alu_AM, EDM => EDM_AM, 
							imm_s => imm_AM, ig => ig, me => me, meu => meu, bloq_A => bloq_A,
							inyec_A => inyec_A, bit_0 => bit_0);
eM: etapaM port map (reloj => reloj, Pcero => Pcero, CP_e => CP_AM, alu_e => alu_AM, EDM_e => EDM_AM, imm_e => imm_AM,
							CP_s => CP_MF, alu_s => alu_MF, writedata_M => writedata_M, 
							imm_s => imm_MF, bloq_M => bloq_M, readdata_M => readdata_M, LDM_s => LDM_MF);
eF: etapaF port map (reloj => reloj, Pcero => Pcero, CP => CP_MF, alu => alu_MF, LDM => LDM_MF, imm => imm_MF,
							fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, mEBR_sel => mEBR_sel, 
							DE => DE);
							
alu_s <= alu_AM;
address_M <= alu_AM;
end;
