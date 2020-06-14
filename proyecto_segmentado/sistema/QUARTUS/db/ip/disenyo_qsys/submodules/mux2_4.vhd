--
--Gerard Candón Arenas, 2020
--

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;
use work.retardos.all;

entity mux2_4 is
   port (d0, d1: in std_logic_vector(3 downto 0);
	SEL: in st_mx2_sel;
	s: out std_logic_vector(3 downto 0));
end mux2_4;

architecture comportamiento of mux2_4 is
begin
	with SEL select
		s <= d0 after ret_mux when '0',
			d1 after ret_mux when '1',
			(others => '-') after ret_mux when others; 
end comportamiento;
