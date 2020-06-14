--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentesUC.all;

entity ensambladoUC is
	port(
		--reloj, puesta a cero y reset
		reloj, Pcero: in std_logic;
		
		--camino
		instr_DL: in st_instr;										
		ig, me, meu: in std_logic;
		IDL1_DL, IDL2_DL, IDE_DL: in reg_direcc;
		IDE_F: out reg_direcc;
		bit_0: out std_logic;
		opALU: out st_opALU;
		
		--multiplexores
		msec_sel, mLa_sel, mLb_sel: out st_mx2_sel;
		mEBR_sel: out st_mx4_sel;
		
		--permisos de escritura
		PBR: out std_logic;	
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;							
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--memoria
		alu_s: in mem_direcc;
		byteenable_M: out st_byteenable;
		read_B, read_M, write_M: out std_logic;
		waitrequest_B, waitrequest_M: in std_logic;
		readvalid_B, readvalid_M: in std_logic;
		
		--bloqueo e inyeccion
		bloq_CP, bloq_DL, bloq_A, bloq_M, inyec_DL, inyec_A: out std_logic;
		
		val_buff, fifo_llena: in std_logic;
		
		secuenciamiento: out std_logic;
		parar: out std_logic
	);

end ensambladoUC;

architecture compor of ensambladoUC is

signal instr_A: st_instr;
signal s_bit_0, s_PBR, read_DL, write_DL: std_logic;
signal s_read_M, s_write_M: std_logic;
signal s_opALU: st_opALU;
signal s_mLa_sel, s_mLb_sel: st_mx2_sel;
signal s_mEBR_sel: st_mx4_sel;
signal s_fmtl_tipo: st_fmtl_tipo;
signal s_fmtl_ext_sig: st_fmtl_ext_sig;
signal PBR_A, PBR_M, PBR_F, PBR_ES: std_logic;
signal val_IDL1, val_IDL2: std_logic;
signal bloq_etapa_CP, bloq_etapa_DL, bloq_etapa_A, bloq_etapa_M: std_logic;
signal s_bloq_CP, s_bloq_DL, s_bloq_A, s_bloq_M: std_logic;
signal inyec_DL_bloqueo_B, inyec_DL_secu: std_logic;
signal inyec_A_secu, inyec_A_riesgo_datos: std_logic;
signal s_inyec_B, s_inyec_DL, s_inyec_A, s_inyec_M, s_inyec_F: std_logic;
signal s_val_CP, s_val_DL, s_val_A, s_val_M, s_val_F: std_logic;
signal anula_read_B, anula_pet_M: std_logic;
signal s_IDE_A, s_IDE_M, s_IDE_F, s_IDE_ES: reg_direcc;
signal s_secuenciamiento: std_logic;
signal s_read_A, s_write_A: std_logic;

begin

s_val_CP <= not Pcero; -- Asumimos que CP tiene datos validos siempre que Pcero no sea 1

anula_read_B <= fifo_llena; -- Si la fifo no puede mas espacio, no se realizan mas busquedas

s_inyec_B <= s_secuenciamiento;
s_inyec_DL <= s_secuenciamiento;
inyec_A_secu <= s_secuenciamiento;
s_inyec_A  <= inyec_A_riesgo_datos or inyec_A_secu;
							 
camcont: camino_control port map(reloj => reloj, Pcero => Pcero, instr_e => instr_DL, instr_s => instr_A,
											bit_0_e => s_bit_0, bit_0_s => bit_0, opALU_e => s_opALU, opALU_s => opALU,
											mLa_sel_e => s_mLa_sel, mLa_sel_s => mLa_sel, mLb_sel_e => s_mLb_sel, 
											mLb_sel_s => mLb_sel, mEBR_sel_e => s_mEBR_sel, mEBR_sel_s => mEBR_sel, 
											PBR_e => s_PBR, PBR_A => PBR_A, PBR_M => PBR_M, PBR_F => PBR_F, PBR_ES => PBR_ES,
											IDE_e => IDE_DL, IDE_A => s_IDE_A, IDE_M => s_IDE_M, IDE_F => s_IDE_F,
											IDE_ES => s_IDE_ES,
											fmtl_tipo_e => s_fmtl_tipo, fmtl_tipo_s => fmtl_tipo, 
											fmtl_ext_sig_e => s_fmtl_ext_sig, fmtl_ext_sig_s => fmtl_ext_sig, read_e => read_DL, 
											read_A => s_read_A, read_M => s_read_M, write_e => write_DL, 
											write_A => s_write_A, write_M => s_write_M, 
											bloq_DL => s_bloq_DL, bloq_A => s_bloq_A, 
											bloq_M => s_bloq_M, inyec_B => s_inyec_B, inyec_DL => s_inyec_DL, 
											inyec_A => s_inyec_A, inyec_M => s_inyec_M, inyec_F => s_inyec_F,
											val_DL => s_val_DL, val_A => s_val_A, 
											val_M => s_val_M, val_F => s_val_F,
											val_buff => val_buff);
						
dec_DL: decoder_DL port map(instr_DL => instr_DL, bit_0 => s_bit_0, opALU => s_opALU, mLa_sel => s_mLa_sel, 
							       mLb_sel => s_mLb_sel, mEBR_sel => s_mEBR_sel, PBR => s_PBR, fmti_tipo => fmti_tipo, 
							       read => read_DL, write => write_DL, parar => parar, val_DL => s_val_DL, 
							       val_IDL1 => val_IDL1, val_IDL2 => val_IDL2);
							 
dec_A: decoder_A port map(instr_A => instr_A, val_A => s_val_A, msec_sel => msec_sel, ig => ig, me => me,
								  meu => meu, byteenable => byteenable_M, fmte_tipo => fmte_tipo,
								  fmtl_tipo => s_fmtl_tipo, fmtl_ext_sig => s_fmtl_ext_sig, address_A => alu_s,
								  secuenciamiento => s_secuenciamiento);
													  
bloqCP: bloqueo_CP port map (valido => s_val_CP, waitrequest => waitrequest_B,
									  memoria_ocupada => bloq_etapa_CP);
									  								 
bloqA: bloqueo_A port map (memoria_ocupada => bloq_etapa_A, valido => s_val_A, write => s_write_A,
									read => s_read_A, waitrequest => waitrequest_M, inyec_M => s_inyec_M);
									
bloqM: bloqueo_M port map (load_en_curso => bloq_etapa_M, readvalid => readvalid_M, valido => s_val_M,
									write => s_write_M, read => s_read_M, inyec_F => s_inyec_F,
									anula_pet_M => anula_pet_M);
									
riesgDatos: riesgo_datos port map (IDL1_DL => IDL1_DL, IDL2_DL => IDL2_DL, IDE_A => s_IDE_A, IDE_M => s_IDE_M,
											IDE_F => s_IDE_F, IDE_ES => s_IDE_ES, PBR_A => PBR_A, PBR_M => PBR_M, 
											PBR_F => PBR_F, PBR_ES => PBR_ES, val_IDL1 => val_IDL1, val_IDL2 => val_IDL2,
											bloq_etapa_DL => bloq_etapa_DL, inyec_A => inyec_A_riesgo_datos);
											
LIBloq: LIB port map (bloq_etapa_CP => bloq_etapa_CP, 
							 bloq_etapa_DL => bloq_etapa_DL, bloq_etapa_A => bloq_etapa_A,
							 bloq_etapa_M => bloq_etapa_M, bloq_CP => s_bloq_CP,
							 bloq_DL => s_bloq_DL, bloq_A => s_bloq_A, bloq_M => s_bloq_M,
							 val_DL => s_val_DL, val_A => s_val_A, val_M => s_val_M);
		
--Asignacion de las señales de salida
PBR <= PBR_F;
IDE_F <= s_IDE_F;
secuenciamiento <= s_secuenciamiento;

--Asignacion de las señales de interfaz Avalon-MM
read_B <= s_val_CP and not(anula_read_B);
read_M <= s_read_A and not (anula_pet_M);
write_M <= s_write_A and not (anula_pet_M);
	 
--Asignacion de las señales de bloqueo e inyeccion de salida
bloq_CP  <= s_bloq_CP;
bloq_DL  <= s_bloq_DL;
bloq_A   <= s_bloq_A;
bloq_M   <= s_bloq_M;
inyec_DL <= s_inyec_DL;
inyec_A  <= s_inyec_A;
end;
