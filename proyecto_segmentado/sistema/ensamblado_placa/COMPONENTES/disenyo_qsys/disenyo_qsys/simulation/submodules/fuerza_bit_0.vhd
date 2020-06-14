--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity fuerza_bit_0 is
	port(
		bit_0: in std_logic;
		dato_e: in dato_camino;
		dato_s: out dato_camino
	);
end fuerza_bit_0;

architecture compor of fuerza_bit_0 is
begin
	dato_s(31 downto 1) <= dato_e(31 downto 1);
	dato_s(0) <= dato_e(0) and (not bit_0);
end;
