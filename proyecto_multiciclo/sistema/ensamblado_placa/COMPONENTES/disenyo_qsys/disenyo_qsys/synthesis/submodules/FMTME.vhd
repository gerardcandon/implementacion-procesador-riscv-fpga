library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;

entity FMTME is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmtme: in st_fmtme_tipo);
end FMTME;

architecture comportamiento of FMTME is

begin

format: process(dato_e, fmtme)
begin
	case fmtme is
		when "00" =>
			dato_s <= dato_e;
		when "01" =>
			dato_s (31 downto 8) <= dato_e(23 downto 0);
		when "10" =>
			dato_s (31 downto 16) <= dato_e(15 downto 0);
		when others => 
			dato_s (31 downto 24) <= dato_e(7 downto 0);
	end case;
end process;
	


end;


