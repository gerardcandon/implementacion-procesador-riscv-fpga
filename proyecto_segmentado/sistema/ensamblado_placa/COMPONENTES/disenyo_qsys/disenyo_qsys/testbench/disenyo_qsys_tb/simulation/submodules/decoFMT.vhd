library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.retardos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;

entity decoFMT is 
  port (
		instr_DL, instr_A: in st_instr;
		address_A: in mem_direcc;
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo);
end decoFMT;

architecture compor of decoFMT is

begin

decoFMT:	process(instr_DL, instr_A, address_A)

variable coop_DL, coop_A: st_coop;
variable funct3_A: st_funct3;
variable v_fmti_tipo: st_fmti_tipo;
variable v_fmte_tipo: st_fmte_tipo;
variable v_fmtl_tipo: st_fmtl_tipo;
variable v_fmtl_ext_sig: st_fmtl_ext_sig;

begin

	v_fmti_tipo := FMTI_I;
	v_fmte_tipo := FMTE_desp_0_bytes;
	v_fmtl_tipo := FMTL_desp_0_bytes;
	v_fmtl_ext_sig := FMTL_no_ext;
	
	coop_DL := instr_DL(6 downto 0);
	
	coop_A := instr_A(6 downto 0);
	funct3_A := instr_A(14 downto 12);
	
	case coop_DL is
	
		when BRANCH =>
			v_fmti_tipo := FMTI_B;
		when STORE =>
			v_fmti_tipo := FMTI_S;
		when lui | auipc =>
			v_fmti_tipo := FMTI_U;
		when jal =>
			v_fmti_tipo := FMTI_J;
		when others =>
		
	end case;
		
	case coop_A is
		when LOAD =>
		case funct3_A is
			when F3_LDST_B | F3_LD_BU =>
				case address_A(1 downto 0) is
					when "00" =>
					when "01" =>
						v_fmtl_tipo := FMTL_desp_1_bytes;
					when "10" =>
						v_fmtl_tipo := FMTL_desp_2_bytes;
					when others =>
						v_fmtl_tipo := FMTL_desp_3_bytes;
				end case;
				
				if (funct3_A = F3_LDST_B) then
					v_fmtl_ext_sig := FMTL_ext_sig_byte_0;
				else v_fmtl_ext_sig := FMTL_ext_cero_byte_0;
				end if;
				
			when F3_LDST_H | F3_LD_HU =>
				case address_A(1 downto 0) is
					when "00" | "01" =>
					when others =>
						v_fmtl_tipo := FMTL_desp_2_bytes;
				end case;
				
				if (funct3_A = F3_LDST_H) then
					v_fmtl_ext_sig := FMTL_ext_sig_byte_1;
				else v_fmtl_ext_sig := FMTL_ext_cero_byte_1;
				end if;
				
			when others =>
				--word
		end case;
		
	when STORE =>
		case funct3_A is
			when F3_LDST_B =>
				case address_A(1 downto 0) is
					when "00" =>
					when "01" =>
						v_fmte_tipo := FMTE_desp_1_bytes;
					when "10" =>
						v_fmte_tipo := FMTE_desp_2_bytes;
					when others =>
						v_fmte_tipo := FMTE_desp_3_bytes;
				end case;
				
			when F3_LDST_H =>
				case address_A(1 downto 0) is
					when "00" | "01" =>
					when others =>
						v_fmte_tipo := FMTE_desp_2_bytes;
				end case;
			when others =>
				--word
		end case;
		when others =>
	end case;
	
	fmti_tipo 		<= v_fmti_tipo;
	fmte_tipo 		<= v_fmte_tipo;
	fmtl_tipo 		<= v_fmtl_tipo;
	fmtl_ext_sig 	<= v_fmtl_ext_sig;
end process;

end;
			
		
			
