--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;
use work.componentes_camino_control.all;

entity camino_control is
	port(
		reloj, Pcero: in std_logic;
		instr_e: in st_instr;
		bit_0_e, PBR_e, read_e, write_e: in std_logic;
		opALU_e: in st_opALU;
		mLa_sel_e, mLb_sel_e: in st_mx2_sel;
		mEBR_sel_e: in st_mx4_sel;
		fmtl_tipo_e: in st_fmtl_tipo;
		fmtl_ext_sig_e: in st_fmtl_ext_sig;
		IDE_e: in reg_direcc;
		
		instr_s: out st_instr;
		bit_0_s: out std_logic;
		opALU_s: out st_opALU;
		mLa_sel_s, mLb_sel_s: out st_mx2_sel;
		mEBR_sel_s: out st_mx4_sel;
		fmtl_tipo_s: out st_fmtl_tipo;
		fmtl_ext_sig_s: out st_fmtl_ext_sig;
		IDE_A, IDE_M, IDE_F, IDE_ES: out reg_direcc;
		PBR_A, PBR_M, PBR_F, PBR_ES: out std_logic;
		
		read_A, write_A, read_M, write_M: out std_logic;
		
		val_buff: in std_logic;
		
		bloq_DL, bloq_A, bloq_M, inyec_B, inyec_DL, inyec_A, inyec_M, inyec_F: in std_logic;
		val_DL, val_A, val_M, val_F: out std_logic
	);
end camino_control;

architecture compor of camino_control is
signal s_val_B, s_val_DL, s_val_A, s_val_M, s_val_F: std_logic;

signal minyec_instr_A_s: dato_camino;
signal minyec_val_B_s, minyec_val_DL_s, minyec_val_A_s, minyec_val_M_s, minyec_val_F_s: std_logic;
signal minyec_PBR_A_s, minyec_PBR_M_s, minyec_PBR_F_s: std_logic;
signal minyec_read_A_s, minyec_read_M_s, minyec_write_A_s, minyec_write_M_s: std_logic;

signal read_AM, write_AM: std_logic;
signal mEBR_sel_AM, mEBR_sel_MF: st_mx4_sel;
signal fmtl_tipo_MF: st_fmtl_tipo;
signal fmtl_ext_sig_MF: st_fmtl_ext_sig;
signal s_byteenable_M: st_byteenable;
signal PBR_AM, PBR_MF, PBR_FES: std_logic;
signal IDE_AM, IDE_MF, IDE_FES: reg_direcc;

signal peRDL_val: std_logic;

signal no_bloq_DL, no_bloq_A, no_bloq_M: std_logic;
begin

--señales de bloqueo negadas, para permisos de escritura de los registros de desacoplo
no_bloq_DL <= not bloq_DL;
no_bloq_A  <= not bloq_A;
no_bloq_M  <= not bloq_M;

--ETAPA DL
	--inyeccion de NOPs
minyec_DL: mux2_1 port map (d0 => val_buff, d1 => '0', SEL => inyec_DL, s => minyec_val_DL_s);
	--registros de desacoplo
peRDL_val <= no_bloq_DL or inyec_DL;
RDL_val:	reg1pe port map (reloj => reloj, Pcero => Pcero, pe => peRDL_val, e => minyec_val_DL_s, s => s_val_DL);

--ETAPA A
	--inyeccion de NOPs
minyec_instr_A: mux2_32 port map (d0 => instr_e, d1 => (others => '0'), SEL => inyec_A, s => minyec_instr_A_s);
minyec_PBR_A:   mux2_1 port map (d0 => PBR_e,    d1 => '0', SEL => inyec_A, s => minyec_PBR_A_s);
minyec_val_A:   mux2_1 port map (d0 => s_val_DL, d1 => '0', SEL => inyec_A, s => minyec_val_A_s);
minyec_read_A:  mux2_1 port map (d0 => read_e,   d1 => '0', SEL => inyec_A, s => minyec_read_A_s);
minyec_write_A: mux2_1 port map (d0 => write_e,  d1 => '0', SEL => inyec_A, s => minyec_write_A_s);

	--Registros de desacoplo
RA_instr:		  reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => minyec_instr_A_s,
											 s => instr_s);
RA_val:			  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => minyec_val_A_s, 
											 s => s_val_A);
RA_opALU:		  regNpe generic map (tam => tam_st_opALU)
								port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => opALU_e,
											 s => opALU_s);
RA_mLa_sel: 	  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => mLa_sel_e,      
											 s => mLa_sel_s);
RA_mLb_sel:		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => mLb_sel_e,      
											 s => mLb_sel_s);
RA_bit_0:  		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => bit_0_e,        
											 s => bit_0_s);
RA_mEBR_sel:  	  regNpe generic map (tam => tam_st_mx4_sel)
								port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => mEBR_sel_e,     
											 s => mEBR_sel_AM);
RA_IDE:			  reg5pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => IDE_e,
											 s => IDE_AM);
RA_PBR:  		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => minyec_PBR_A_s,       
											 s => PBR_AM);
RA_read:			  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => minyec_read_A_s,
											 s => read_AM);
RA_write:		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => minyec_write_A_s,
											 s => write_AM);
--ETAPA M
	--inyeccion de NOPs
minyec_PBR_M:   mux2_1 port map (d0 => PBR_AM,   d1 => '0', SEL => inyec_M, s => minyec_PBR_M_s);
minyec_val_M:   mux2_1 port map (d0 => s_val_A,  d1 => '0', SEL => inyec_M, s => minyec_val_M_s);
minyec_read_M:  mux2_1 port map (d0 => read_AM,  d1 => '0', SEL => inyec_M, s => minyec_read_M_s);
minyec_write_M: mux2_1 port map (d0 => write_AM, d1 => '0', SEL => inyec_M, s => minyec_write_M_s);

	--registros de desacoplo
RM_val:			  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => minyec_val_M_s,  
											 s => s_val_M);
RM_read:  		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => minyec_read_M_s, 
											 s => read_M);
RM_write:  		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => minyec_write_M_s,
											 s => write_M);
RM_fmtl_tipo:    regNpe generic map (tam => tam_st_fmtl_tipo)
								port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => fmtl_tipo_e,     
										    s => fmtl_tipo_MF);
RM_fmtl_ext_sig: regNpe generic map (tam => tam_st_fmtl_ext_sig)
								port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => fmtl_ext_sig_e,  
											 s => fmtl_ext_sig_MF);
RM_mEBR_sel:  	  regNpe generic map (tam => tam_st_mx4_sel)
								port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => mEBR_sel_AM,     
											 s => mEBR_sel_MF);
RM_IDE:		     reg5pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => IDE_AM,
											 s => IDE_MF);
RM_PBR:  		  reg1pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => minyec_PBR_M_s,  
											 s => PBR_MF);
											 
--ETAPA F
	--inyeccion de NOPs
minyec_PBR_F: mux2_1 port map (d0 => PBR_MF,  d1 => '0', SEL => inyec_F, s => minyec_PBR_F_s);
minyec_val_F: mux2_1 port map (d0 => s_val_M, d1 => '0', SEL => inyec_F, s => minyec_val_F_s);

	--registros de desacoplo
RF_val:			  reg1 port map (reloj => reloj, Pcero => Pcero, e => minyec_val_F_s, s => s_val_F);
RF_fmtl_tipo:    regN generic map (tam => tam_st_fmtl_tipo)
								port map (reloj => reloj, Pcero => Pcero, e => fmtl_tipo_MF, s => fmtl_tipo_s);
RF_fmtl_ext_sig: regN generic map (tam => tam_st_fmtl_ext_sig)
								port map (reloj => reloj, Pcero => Pcero, e => fmtl_ext_sig_MF, s => fmtl_ext_sig_s);
RF_mEBR_sel:  	  regN generic map (tam => tam_st_mx4_sel)
								port map (reloj => reloj, Pcero => Pcero, e => mEBR_sel_MF, s => mEBR_sel_s);
RF_IDE:			  reg5 port map (reloj => reloj, Pcero => Pcero, e => IDE_MF, s => IDE_FES);
RF_PBR:  		  reg1 port map (reloj => reloj, Pcero => Pcero,e => minyec_PBR_F_s, s => PBR_FES);

--ETAPA ES
	--registros de desacoplo
RES_IDE:			  reg5   port map (reloj => reloj, Pcero => Pcero, e => IDE_FES, s => IDE_ES);
RES_PBR:			  reg1   port map (reloj => reloj, Pcero => Pcero, e => PBR_FES, s => PBR_ES);

--asignacion de señales de salida
PBR_A <= PBR_AM;
PBR_M <= PBR_MF;
PBR_F <= PBR_FES;

IDE_A <= IDE_AM;
IDE_M <= IDE_MF;
IDE_F <= IDE_FES;

read_A <= read_AM;
write_A <= write_AM;

val_DL <= s_val_DL;
val_A  <= s_val_A;
val_M  <= s_val_M;
val_F  <= s_val_F;

end;
