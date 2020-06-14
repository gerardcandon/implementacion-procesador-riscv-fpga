library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;
use work.retardos.all;

entity decoCamino_SYS is
	port(
		estadoSYS: in st_estadoSYS;
		int_CSR, excep_CSR: in std_logic;
		mret_CSR: out std_logic;
		mCP_sel, mALU_CSR_sel, mESCSR_sel: out st_mx2_sel;
		peCP_sys, peCSR, PBR_sys: out std_logic;
		opCSR: out st_opCSR
	);
end decoCamino_SYS;

architecture compor of decoCamino_SYS is
begin

decoCam: process(estadoSYS, int_CSR, excep_CSR)
variable v_prx_estadoSYS: st_estadoSYS;
variable v_mret_CSR, v_peCP_sys, v_PBR_sys, v_peCSR: std_logic;
variable v_mCP_sel, v_mALU_CSR_sel, v_mESCSR_sel: st_mx2_sel;
variable v_opCSR: st_opCSR;

begin
	
	v_mCP_sel := mCP_no_int;
	v_peCP_sys := '0';
	v_mret_CSR := '0';
	
	v_PBR_sys := '0';
	v_mESCSR_sel := mESCSR_mEBR;
	v_mALU_CSR_sel := mALU_CSR_L_CSR;
	v_opCSR := ALU_W;
	v_peCSR := '0';
	
	if int_CSR = '1' or excep_CSR = '1' then
		v_mCP_sel := mCP_int;
		v_peCP_sys := '1';
	end if;
	
	case estadoSYS is
	
		when MRET =>
			v_mret_CSR := '1';
			v_mCP_sel := mCP_int;
			v_peCP_sys := '1';
			
		when CSRRW =>
			v_PBR_sys := '1';
			v_mESCSR_sel := mESCSR_L_CSR;
			v_peCSR := '1';
			
		when CSRRS =>
			v_PBR_sys := '1';
			v_mESCSR_sel := mESCSR_L_CSR;
			v_opCSR := ALU_S;
			v_peCSR := '1';
			
		when CSRRC =>
			v_PBR_sys := '1';
			v_mESCSR_sel := mESCSR_L_CSR;
			v_opCSR := ALU_C;
			v_peCSR := '1';
			
		when CSRRWI =>
			v_PBR_sys := '1';
			v_mESCSR_sel := mESCSR_L_CSR;
			v_mALU_CSR_sel := mALU_CSR_imm;
			v_peCSR := '1';
			
		when CSRRSI =>
			v_PBR_sys := '1';
			v_mESCSR_sel := mESCSR_L_CSR;
			v_mALU_CSR_sel := mALU_CSR_imm;
			v_opCSR := ALU_S;
			v_peCSR := '1';
			
		when CSRRCI =>
			v_PBR_sys := '1';
			v_mESCSR_sel := mESCSR_L_CSR;
			v_mALU_CSR_sel := mALU_CSR_imm;
			v_opCSR := ALU_C;
			v_peCSR := '1';
			
		when others =>
	end case;
		
	mret_CSR  <= v_mret_CSR after ret_decoder;
	mCP_sel 	 <= v_mCP_sel after ret_decoder;
	peCP_sys  <= v_peCP_sys after ret_decoder;
	
	PBR_sys     <= v_PBR_sys after ret_decoder;
	mESCSR_sel   <= v_mESCSR_sel after ret_decoder;
	mALU_CSR_sel <= v_mALU_CSR_sel after ret_decoder;
	opCSR        <= v_opCSR after ret_decoder;
	peCSR			 <= v_peCSR after ret_decoder;

end process;	
end;