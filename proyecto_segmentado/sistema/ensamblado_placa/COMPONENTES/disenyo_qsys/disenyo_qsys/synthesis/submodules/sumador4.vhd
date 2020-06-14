--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity sumador4 is
	port(
		e: in dato_camino;
		s: out dato_camino
	);
end sumador4;

architecture compor of sumador4 is
begin

s <= e + x"00000004";

end;
