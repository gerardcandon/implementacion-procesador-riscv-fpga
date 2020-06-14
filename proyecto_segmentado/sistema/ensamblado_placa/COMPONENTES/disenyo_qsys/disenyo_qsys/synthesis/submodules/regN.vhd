--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.retardos.all;
use work.constantes.all;
use work.tipos.all;

entity regN is
	generic(tam: natural := 5);
	port (reloj, Pcero: in std_logic;
         e: in std_logic_vector(tam-1 downto 0);
         s: out std_logic_vector(tam-1 downto 0)
	);
end regN;

architecture comportamiento of regN is
begin
	flanco: process (reloj, pcero) begin
		if Pcero = '1' then s <= (others => '0') after ret_reg32;
		elsif rising_edge(reloj) then
			s <= e after ret_reg32;
		end if;
	end process;
end;
