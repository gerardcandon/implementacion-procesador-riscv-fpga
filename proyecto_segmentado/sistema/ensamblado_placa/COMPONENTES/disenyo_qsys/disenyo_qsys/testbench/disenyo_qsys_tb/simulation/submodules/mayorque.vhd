library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.retardos.all;
use work.constantes.all;
use work.tipos.all;

entity mayorque is							
	port (	
		a, b: in dato_camino;
      s: out std_logic
	);
end mayorque;

architecture comportamiento of mayorque is
begin
	s <= '1' when (a > b) else '0';
end;
