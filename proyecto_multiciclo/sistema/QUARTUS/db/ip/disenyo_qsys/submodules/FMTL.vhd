--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity FMTL is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmtl: in st_fmtl_tipo;
	ext_sig: in st_fmtl_ext_sig);
end FMTL;

architecture comportamiento of FMTL is

begin

format: process(dato_e, fmtl, ext_sig)
variable v_dato_s: dato_camino;

begin

	v_dato_s := (others => '0');

	--fmtl decide cuantos bytes desplazamos los bytes de mayor peso
	case fmtl is
		
		when FMTL_desp_1_bytes =>
			v_dato_s (23 downto 0) := dato_e(31 downto 8);
		when FMTL_desp_2_bytes =>
			v_dato_s (15 downto 0) := dato_e(31 downto 16);
		when FMTL_desp_3_bytes =>
			v_dato_s (7 downto 0) := dato_e(31 downto 24);
			v_dato_s (31 downto 8) := (others => '0');
		when others =>
			v_dato_s := dato_e;
	end case;
	
	--ext_sig decide a partir de que byte extendemos de signo o de ceros.
	case ext_sig is
		
		when FMTL_ext_sig_byte_2 =>
			v_dato_s (31 downto 24) := (others => v_dato_s(23));
		when FMTL_ext_sig_byte_1 =>
			v_dato_s (31 downto 16) := (others => v_dato_s(15));
		when FMTL_ext_sig_byte_0 =>
			v_dato_s (31 downto 8) := (others => v_dato_s(7));
		
		when FMTL_ext_cero_byte_2 =>
			v_dato_s (31 downto 24) := (others => '0');
		when FMTL_ext_cero_byte_1 =>
			v_dato_s (31 downto 16) := (others => '0');
		when FMTL_ext_cero_byte_0 =>
			v_dato_s (31 downto 8) := (others => '0');
			
		when others =>

	end case;
	
	dato_s <= v_dato_s after ret_FMT;
end process;

end;


