library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;

entity decocamino is 
  port (
		estado: in st_estado;
		instr: in st_instr;
		peRI, PBR, peRsec, bit_0: out std_logic;
		mdir_sel, mRLDM_sel, mEBR_sel, mdato_sel : out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel
		);
end decocamino;

architecture comportamiento of decocamino is

begin

decocamino:	process(estado, instr)


variable v_mdir_sel, v_mRLDM_sel, v_mEBR_sel, v_mdato_sel: st_mx2_sel;
variable v_mLa_sel, v_mLb_sel: st_mx3_sel;
variable v_peRI, v_PBR, v_peRsec, v_bit_0: std_logic;
begin

	seleccion_mx2(v_mdir_sel, mdir_CP);
	seleccion_mx2(v_mRLDM_sel, mRLDM_SDRAM);
	seleccion_mx2(v_mEBR_sel, mEBR_camino);
	seleccion_mx2(v_mdato_sel, mdato_ALU);
	seleccion_mx3(v_mLa_sel, mLa_CP);
	seleccion_mx3(v_mLb_sel, mLb_4);
	permiso_escritura_no(v_peRI);
	permiso_escritura_no(v_PBR);
	permiso_escritura_no(v_peRsec);
	v_bit_0 := '0';
	
	case estado is
	
		when FETCH =>
			permiso_escritura_si(v_peRI);
			
		when DECODE =>
			seleccion_mx3(v_mLa_sel, mLa_CPinst);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
			permiso_escritura_si(v_peRsec);
		
		when OP_ALU =>
			permiso_escritura_si(v_PBR);
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_L2);
			
		when OP_IMM_ALU =>
			permiso_escritura_si(v_PBR);
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
			
		when LOAD_DIR =>
			seleccion_mx2(v_mdir_sel, mdir_camino);
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
		
		when LOAD_LD_CSR =>
			seleccion_mx2(v_mRLDM_sel, mRLDM_CSR);
			
		when LOAD_FMT =>
			seleccion_mx2(v_mEBR_sel, mEBR_mem);
			permiso_escritura_si(v_PBR);
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
			
		when STORE_DIR =>
			seleccion_mx2(v_mdir_sel, mdir_camino);
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
		
		when LUI_FMT =>
			permiso_escritura_si(v_PBR);
			seleccion_mx2(v_mdato_sel, mdato_imm);
			
		when AUIPC_ALU =>
			permiso_escritura_si(v_PBR);
			seleccion_mx3(v_mLa_sel, mLa_CPinst);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
			
		when BRANCH_EVAL =>
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_L2);
			
		when JAL_RD =>
			permiso_escritura_si(v_PBR);
			seleccion_mx3(v_mLa_sel, mLa_CPinst);
			
		when JAL_CP =>
			seleccion_mx2(v_mdir_sel, mdir_camino);
			seleccion_mx3(v_mLa_sel, mLa_CPinst);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
	
		when JALR_RD =>
			permiso_escritura_si(v_PBR);
			seleccion_mx3(v_mLa_sel, mLa_CPinst);
			
		when JALR_CP =>
			seleccion_mx2(v_mdir_sel, mdir_camino);
			seleccion_mx3(v_mLa_sel, mLa_L1);
			seleccion_mx3(v_mLb_sel, mLb_Fmt);
			v_bit_0 := '1';

		when others =>
	end case;
	
	mdir_sel  <= v_mdir_sel;
	mRLDM_sel <= v_mRLDM_sel;
	mEBR_sel  <= v_mEBR_sel;
	mdato_sel <= v_mdato_sel;
	mLa_sel   <= v_mLa_sel;
	mLb_sel   <= v_mLb_sel;
	peRI      <= v_peRI;
	PBR       <= v_PBR;
	peRsec    <= v_peRsec;
	bit_0     <= v_bit_0; 
	
end process;


end;


