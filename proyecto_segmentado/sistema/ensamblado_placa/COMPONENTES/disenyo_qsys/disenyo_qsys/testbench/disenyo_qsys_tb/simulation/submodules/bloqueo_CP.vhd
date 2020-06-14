--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity bloqueo_CP is
	port(
		valido, waitrequest: in std_logic;
		memoria_ocupada: out std_logic
	);
end bloqueo_CP;

architecture compor of bloqueo_CP is
begin

memoria_ocupada <= valido and waitrequest;
	
end;		
