library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;

entity FMTMS is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmtms: in st_fmtms_tipo;
	ext_sig: in st_fmtms_ext_sig);
end FMTMS;

architecture comportamiento of FMTMS is

begin

format: process(dato_e, fmtms, ext_sig)
variable v_dato_s: dato_camino;

begin

	--fmtms decide cuantos bytes corremos los bytes de mayor peso
	case fmtms is
		when "00" =>
			v_dato_s := dato_e;
		when "01" =>
			v_dato_s (23 downto 0) := dato_e(31 downto 8);
		when "10" =>
			v_dato_s (15 downto 0) := dato_e(31 downto 16);
		when others =>
			v_dato_s (7 downto 0) := dato_e(31 downto 24);
	end case;
	
	--ext_sig decide a partir de que byte extendemos de signo. bit 2 decide si extendemos signo o llenamos de 0
	case ext_sig is
		when "000" | "100" =>
		
		when "001" =>
			v_dato_s (31 downto 24) := (others => '0');
		when "010" =>
			v_dato_s (31 downto 16) := (others => '0');
		when "011" =>
			v_dato_s (31 downto 8) := (others => '0');
			
		when "101" =>
			v_dato_s (31 downto 24) := (others => v_dato_s(23));
		when "110" =>
			v_dato_s (31 downto 16) := (others => v_dato_s(15));
		when others =>
			v_dato_s (31 downto 8) := (others => v_dato_s(7));

	end case;
	
	dato_s <= v_dato_s;
end process;

end;


