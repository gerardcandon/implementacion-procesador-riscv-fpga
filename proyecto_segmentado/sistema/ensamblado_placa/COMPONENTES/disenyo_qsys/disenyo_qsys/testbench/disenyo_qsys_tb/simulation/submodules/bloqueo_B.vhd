library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity bloqueo_B is
	port(
		fifo_llena: in std_logic;
		bloq_etapa_B, anula_read_B: out std_logic
	);
end bloqueo_B;

architecture compor of bloqueo_B is
begin
	bloq_etapa_B <= fifo_llena;
	anula_read_B <= fifo_llena;
end;		