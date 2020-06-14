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

entity decoFMT is 
  port (
		reloj, Pcero: in std_logic;
		instr: in st_instr;
		estado: in st_estado;
		address: in mem_direcc;
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo);
end decoFMT;

architecture compor of decoFMT is

component reg32pe is							
	port (reloj, Pcero: in std_logic;
			pe: in std_logic;		
         e: in dato_camino;
         s: out dato_camino);
end component;

signal regaddr_pe: std_logic;
signal regaddr_e, regaddr_s: dato_camino;

begin

regaddr_e <= address;

regaddr: reg32pe port map(reloj => reloj, Pcero => Pcero, pe => regaddr_pe, 
								  e => regaddr_e, s => regaddr_s);

decoFMT:	process(instr, estado, regaddr_s, address)

variable funct3: st_funct3;
variable v_fmti_tipo: st_fmti_tipo;
variable v_fmte_tipo: st_fmte_tipo;
variable v_fmtl_tipo: st_fmtl_tipo;
variable v_fmtl_ext_sig: st_fmtl_ext_sig;
variable v_regaddr_pe: std_logic;

begin

	v_fmti_tipo := FMTI_I;
	v_fmte_tipo := FMTE_desp_0_bytes;
	v_fmtl_tipo := FMTL_desp_0_bytes;
	v_fmtl_ext_sig := FMTL_no_ext;
	permiso_escritura_no(v_regaddr_pe);
	
	funct3 := instr(14 downto 12);
	
	case estado is
	
		when DECODE =>
			v_fmti_tipo := FMTI_B;
			
		--guardamos la direccion usada para formatear posteriormente
		when LOAD_DIR =>
			permiso_escritura_si(v_regaddr_pe);
	
		when LOAD_FMT =>
			case funct3 is
				when F3_LDST_B | F3_LD_BU =>
					case regaddr_s(1 downto 0) is
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
					case regaddr_s(1 downto 0) is
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
			
		when STORE_DIR =>
			v_fmti_tipo := FMTI_S;
			case funct3 is
				when F3_LDST_B =>
					case address(1 downto 0) is
						when "00" =>
						when "01" =>
							v_fmte_tipo := FMTE_desp_1_bytes;
						when "10" =>
							v_fmte_tipo := FMTE_desp_2_bytes;
						when others =>
							v_fmte_tipo := FMTE_desp_3_bytes;
					end case;
					
				when F3_LDST_H =>
					case address(1 downto 0) is
						when "00" | "01" =>
						when others =>
							v_fmte_tipo := FMTE_desp_2_bytes;
					end case;
				when others =>
					--word
			end case;
		
		when LUI_FMT | AUIPC_ALU =>
			v_fmti_tipo := FMTI_U;
			
		when JAL_RD | JAL_CP =>
			v_fmti_tipo := FMTI_J;
			
		when others =>
		
		end case;
		
	fmti_tipo 		<= v_fmti_tipo;
	fmte_tipo 		<= v_fmte_tipo;
	fmtl_tipo 		<= v_fmtl_tipo;
	fmtl_ext_sig 	<= v_fmtl_ext_sig;
	regaddr_pe		<= v_regaddr_pe;
end process;

end;
			
		
			
