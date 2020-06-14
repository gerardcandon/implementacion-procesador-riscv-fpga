--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentes_procesador.all;

entity ensamblado_procesador is
port (
		reloj, Pcero: in std_logic; 			--reloj, puesta a cero y reset
		parar: out std_logic;
		address_B, address_M: out mem_direcc;						--avalonMM
		writedata_M: out dato_camino;
		readdata_B, readdata_M: in dato_camino;
		read_B, read_M, write_M: out std_logic;
		byteenable_B, byteenable_M: out st_byteenable;
		waitrequest_B, waitrequest_M, readdatavalid_B, readdatavalid_M: in std_logic
	);
end ensamblado_procesador;

architecture compor of ensamblado_procesador is

signal PBR, ig, me, meu, bit_0: std_logic;
signal alu_s: mem_direcc;
signal msec_sel, mLa_sel, mLb_sel: st_mx2_sel;
signal mEBR_sel: st_mx4_sel;
signal fmti_tipo: st_fmti_tipo;
signal fmte_tipo: st_fmte_tipo;
signal fmtl_tipo: st_fmtl_tipo;
signal fmtl_ext_sig: st_fmtl_ext_sig;
signal opALU: st_opALU;
signal instr_DL: st_instr;
signal IDL1_DL, IDL2_DL, IDE_DL, IDE_F: reg_direcc;
signal bloq_CP, bloq_DL, bloq_A, bloq_M, inyec_DL, inyec_A: std_logic;
signal val_buff, fifo_llena, busqueda_en_curso: std_logic;
signal s_read_B: std_logic;
signal secuenciamiento: std_logic;


begin

UC: ensambladoUC port map (reloj => reloj, Pcero => Pcero,
									instr_DL => instr_DL, ig => ig, me => me, meu => meu, bit_0 => bit_0, opALU => opALU,
									IDL1_DL => IDL1_DL, IDL2_DL => IDL2_DL, IDE_DL => IDE_DL, IDE_F => IDE_F,
									PBR => PBR, msec_sel => msec_sel, mEBR_sel => mEBR_sel, 
									mLa_sel => mLa_sel, mLb_sel => mLb_sel, fmti_tipo => fmti_tipo, fmte_tipo => fmte_tipo, 
									fmtl_tipo => fmtl_tipo,	fmtl_ext_sig => fmtl_ext_sig,
									alu_s => alu_s, byteenable_M => byteenable_M, read_M => read_M, read_B => s_read_B, 
									write_M => write_M, waitrequest_B => waitrequest_B, waitrequest_M => waitrequest_M, 
									readvalid_B => readdatavalid_B, readvalid_M => readdatavalid_M,
									bloq_DL => bloq_DL, bloq_A => bloq_A, bloq_M => bloq_M,
									inyec_DL => inyec_DL, inyec_A => inyec_A, parar => parar,
									val_buff => val_buff, fifo_llena => fifo_llena, secuenciamiento => secuenciamiento,
									bloq_CP => bloq_CP);

UP: ensambladoUP port map (reloj => reloj, Pcero => Pcero, instr_DL => instr_DL, ig => ig, 
									me => me, meu => meu, bit_0 => bit_0, opALU => opALU, IDL1_DL => IDL1_DL, 
									IDL2_DL => IDL2_DL, IDE_DL => IDE_DL, IDE_F => IDE_F,
									PBR => PBR, msec_sel => msec_sel, mEBR_sel => mEBR_sel, 
									mLa_sel => mLa_sel, mLb_sel => mLb_sel, 
									fmti_tipo => fmti_tipo, fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, 
									fmtl_ext_sig => fmtl_ext_sig,	readdata_B => readdata_B, address_B => address_B,
									writedata_M => writedata_M, readdata_M => readdata_M, address_M => address_M, 
									alu_s => alu_s, bloq_DL => bloq_DL, bloq_A => bloq_A,	
									bloq_M => bloq_M, inyec_DL => inyec_DL, inyec_A => inyec_A, val_buff => val_buff,
									readvalid_B => readdatavalid_B, fifo_llena => fifo_llena,
									read_B => s_read_B, waitrequest_B => waitrequest_B, secuenciamiento => secuenciamiento,
									bloq_CP => bloq_CP);
								
read_B <= s_read_B;	
byteenable_B <= "1111";

end;
