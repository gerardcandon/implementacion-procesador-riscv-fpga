--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity FMTE is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmte: in st_fmte_tipo);
end FMTE;

architecture comportamiento of FMTE is

begin

format: process(dato_e, fmte)
variable v_dato_s: dato_camino;
begin

	v_dato_s := (others => '0');
	
	case fmte is
		
		when FMTE_desp_1_bytes =>
			v_dato_s (31 downto 8) := dato_e(23 downto 0);
		when FMTE_desp_2_bytes =>
			v_dato_s (31 downto 16) := dato_e(15 downto 0);
		when FMTE_desp_3_bytes => 
			v_dato_s (31 downto 24) := dato_e(7 downto 0);
		when others =>
			v_dato_s := dato_e;
	end case;
	
	dato_s <= v_dato_s after ret_FMT;
end process;
	


end;


