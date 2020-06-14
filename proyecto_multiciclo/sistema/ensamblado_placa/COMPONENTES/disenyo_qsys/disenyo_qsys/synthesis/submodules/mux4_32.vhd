--
--Gerard Candón Arenas, 2020
--

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;

entity mux4_32 is
   port (d0, d1, d2, d3: in dato_camino;
	SEL: in st_mx4_sel;
	s: out dato_camino);
end mux4_32;

architecture comportamiento of mux4_32 is
begin
	with SEL select
		s <= d0 when "00",
			d1  when "01",
			d2 when "10",
			d3 when "11",
			(others => '-') when others;
end comportamiento;
