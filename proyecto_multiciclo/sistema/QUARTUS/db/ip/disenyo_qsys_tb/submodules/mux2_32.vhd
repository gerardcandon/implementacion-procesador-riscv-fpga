library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;

entity mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end mux2_32;

architecture comportamiento of mux2_32 is
begin
	with SEL select
		s <= d0 when '0',
			d1  when '1',
			(others => '-') when others; 
end comportamiento;
