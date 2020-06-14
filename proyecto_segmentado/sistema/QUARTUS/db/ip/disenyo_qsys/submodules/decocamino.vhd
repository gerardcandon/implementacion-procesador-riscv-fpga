--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;

entity decocamino is 
  port (
		instr: in st_instr;
		val_DL: in std_logic;
		PBR, bit_0: out std_logic;
		mEBR_sel: out st_mx4_sel;
		mLa_sel, mLb_sel: out st_mx2_sel;
		val_IDL1, val_IDL2: out std_logic;
		parar: out std_logic
		);
end decocamino;

architecture comportamiento of decocamino is

begin

decocamino:	process(instr, val_DL)
variable coop: st_coop;
variable v_mEBR_sel: st_mx4_sel;
variable v_mLa_sel, v_mLb_sel: st_mx2_sel;
variable v_val_IDL1, v_val_IDL2, v_PBR, v_bit_0: std_logic;
variable v_parar: std_logic;
begin

	seleccion_mx4(v_mEBR_sel, mEBR_ALU);
	seleccion_mx2(v_mLa_sel, mLa_L1);
	seleccion_mx2(v_mLb_sel, mLb_L2);
	permiso_escritura_no(v_PBR);
	v_bit_0 := '0';
	v_parar := '0';
	v_val_IDL1  := '0';
	v_val_IDL2  := '0';
	
	coop := instr(6 downto 0);
	
	if (val_DL = '1') then
		case coop is
			when LOAD =>
				seleccion_mx4(v_mEBR_sel, mEBR_LDM);
				seleccion_mx2(v_mLb_sel, mLb_imm);
				permiso_escritura_si(v_PBR);
				v_val_IDL1 := '1';
			when STORE =>
				seleccion_mx2(v_mLb_sel, mLb_imm);
				v_val_IDL1 := '1';
				v_val_IDL2 := '1';
			when BRANCH =>
				seleccion_mx2(v_mLa_sel, mLa_CP);
				seleccion_mx2(v_mLb_sel, mLb_imm);
				v_val_IDL1 := '1';
				v_val_IDL2 := '1';
			when jalr =>
				seleccion_mx4(v_mEBR_sel, mEBR_CP);
				seleccion_mx2(v_mLb_sel, mLb_imm);
				permiso_escritura_si(v_PBR);
				v_bit_0 := '1';
				v_val_IDL1 := '1';
			when jal =>
				seleccion_mx4(v_mEBR_sel, mEBR_CP);
				seleccion_mx2(v_mLa_sel, mLa_CP);
				seleccion_mx2(v_mLb_sel, mLb_imm);
				permiso_escritura_si(v_PBR);
			when OP_IMM =>
				seleccion_mx2(v_mLb_sel, mLb_imm);
				permiso_escritura_si(v_PBR);
				v_val_IDL1 := '1';
			when OP =>
				permiso_escritura_si(v_PBR);
				v_val_IDL1 := '1';
				v_val_IDL2 := '1';
			when auipc =>
				seleccion_mx2(v_mLa_sel, mLa_CP);
				seleccion_mx2(v_mLb_sel, mLb_imm);
				permiso_escritura_si(v_PBR);
			when lui =>
				seleccion_mx4(v_mEBR_sel, mEBR_imm);
				permiso_escritura_si(v_PBR);
			when halt =>
				v_parar := '1';
			when others =>
		end case;
	end if;
	
	mEBR_sel  <= v_mEBR_sel;
	mLa_sel   <= v_mLa_sel;
	mLb_sel   <= v_mLb_sel;
	PBR       <= v_PBR;
	bit_0     <= v_bit_0;
	parar		 <= v_parar;
	val_IDL1  <= v_val_IDL1;
	val_IDL2  <= v_val_IDL2;
	
end process;


end;


