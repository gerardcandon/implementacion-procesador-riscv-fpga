--
--Gerard Candón Arenas, 2020
--

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;
use work.retardos.all;

entity mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end mux2_32;

architecture comportamiento of mux2_32 is
begin
	with SEL select
		s <= d0 after ret_mux when '0',
			d1 after ret_mux when '1',
			(others => '-') after ret_mux when others; 
end comportamiento;
