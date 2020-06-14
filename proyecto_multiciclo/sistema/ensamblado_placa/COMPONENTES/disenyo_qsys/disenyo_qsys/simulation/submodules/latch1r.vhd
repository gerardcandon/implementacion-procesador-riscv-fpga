library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.retardos.all;
use work.constantes.all;
use work.tipos.all;

entity latch1r is							
	port (reloj, Pcero: in std_logic;
			r, e: in std_logic;
         s: out std_logic);
end latch1r;

architecture comportamiento of latch1r is
begin
	latch: process (reloj, pcero, r, e) 
	variable v_s: std_logic;
	begin
		if (rising_edge(reloj)) then
			if Pcero = '1' or r = '1' then 
				v_s := '0';
			end if;
		end if;
		if e = '1' then
			v_s := '1';
		end if;
	s <= v_s;
	end process;
end;
