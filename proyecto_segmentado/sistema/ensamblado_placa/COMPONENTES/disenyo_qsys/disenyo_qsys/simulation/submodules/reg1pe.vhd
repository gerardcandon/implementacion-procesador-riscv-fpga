--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.retardos.all;
use work.constantes.all;
use work.tipos.all;

entity reg1pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in std_logic;
         s: out std_logic);
end reg1pe;

architecture comportamiento of reg1pe is
begin
	flanco: process (reloj, pcero, pe) begin
		if Pcero = '1' then s <= '0' after ret_reg32;
		elsif rising_edge(reloj) and pe = '1' then
			s <= e after ret_reg32;
		end if;
	end process;
end;
