--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.retardos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;

entity decoFMT_A is 
  port (
		instr_A: in st_instr;
		val_A: in std_logic;
		address_A: in mem_direcc;
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig);
end decoFMT_A;

architecture compor of decoFMT_A is

begin

decoFMT:	process(instr_A, address_A, val_A)

variable coop: st_coop;
variable funct3: st_funct3;
variable v_fmte_tipo: st_fmte_tipo;
variable v_fmtl_tipo: st_fmtl_tipo;
variable v_fmtl_ext_sig: st_fmtl_ext_sig;

begin

	v_fmte_tipo := FMTE_desp_0_bytes;
	v_fmtl_tipo := FMTL_desp_0_bytes;
	v_fmtl_ext_sig := FMTL_no_ext;
	
	
	coop := instr_A(6 downto 0);
	funct3 := instr_A(14 downto 12);
		
	if (val_A = '1') then
		case coop is
			when LOAD =>
			case funct3 is
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
					
					if (funct3 = F3_LDST_B) then
						v_fmtl_ext_sig := FMTL_ext_sig_byte_0;
					else v_fmtl_ext_sig := FMTL_ext_cero_byte_0;
					end if;
					
				when F3_LDST_H | F3_LD_HU =>
					case address_A(1 downto 0) is
						when "00" | "01" =>
						when others =>
							v_fmtl_tipo := FMTL_desp_2_bytes;
					end case;
					
					if (funct3 = F3_LDST_H) then
						v_fmtl_ext_sig := FMTL_ext_sig_byte_1;
					else v_fmtl_ext_sig := FMTL_ext_cero_byte_1;
					end if;
					
				when others =>
					--word
			end case;
			
		when STORE =>
			case funct3 is
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
	end if;
	
	fmte_tipo 		<= v_fmte_tipo;
	fmtl_tipo 		<= v_fmtl_tipo;
	fmtl_ext_sig 	<= v_fmtl_ext_sig;
end process;

end;
