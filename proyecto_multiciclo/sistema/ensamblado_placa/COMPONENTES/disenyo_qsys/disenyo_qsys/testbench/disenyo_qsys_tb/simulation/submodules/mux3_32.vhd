--
--Gerard Candón Arenas, 2020
--

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;
use work.retardos.all;

entity mux3_32 is
   port (d0, d1, d2: in dato_camino;
	SEL: in st_mx3_sel;
	s: out dato_camino);
end mux3_32;

architecture comportamiento of mux3_32 is
begin
	with SEL select
		s <= d0 after ret_mux when "00",
			d1 after ret_mux when "01",
			d2 after ret_mux when "10",
			(others => '-') after ret_mux when others; 
end comportamiento;
