--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity EVAL is
    port (a, b: in  dato_camino;
          ig, me, meu: out std_logic);
end EVAL;

architecture compor of EVAL is

begin
	alu_p: process (a, b)
variable sa, sb: signed(tam_dato_camino-1 downto 0);
variable ua, ub: unsigned(tam_dato_camino-1 downto 0);
variable v_ig, v_me, v_meu: std_logic;

begin
	sa := signed(a);
	sb := signed(b);
	ua := unsigned(a);
	ub := unsigned(b);
    
	v_ig  := '0';
	v_me  := '0';
	v_meu := '0';
	
	if (ua = ub) then
		v_ig := '1';
	end if;
	
	if (sa < sb) then
		v_me := '1';
	end if;
	
	if (ua < ub) then
		v_meu := '1';
	end if;
	
	ig  <= v_ig;
	me  <= v_me;
	meu <= v_meu;
end process;
end;
