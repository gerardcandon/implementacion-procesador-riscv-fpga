--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity bloqueo_A is
	port(
		valido, write, read, waitrequest: in std_logic;
		memoria_ocupada, inyec_M: out std_logic
	);
end bloqueo_A;

architecture compor of bloqueo_A is
signal acceso: std_logic;
begin
	acceso <= valido and (write or read);
	memoria_ocupada <= waitrequest and acceso;
	inyec_M <= waitrequest and acceso;
end;		
