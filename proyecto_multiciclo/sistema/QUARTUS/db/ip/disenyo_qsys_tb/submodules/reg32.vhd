library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.retardos.all;
use work.constantes.all;
use work.tipos.all;

entity reg32 is							-- registro con inicializacion a cero asincrona
	port (reloj, Pcero: in std_logic;		-- Pcero: senyal de inicializacion
         e: in dato_camino;
         s: out dato_camino);
end reg32;

architecture comportamiento of reg32 is
begin
	flanco: process (reloj, pcero) begin
		if Pcero = '1' then s <= (others => '0') after ret_reg32;
		elsif reloj'event and reloj = '1' then
			s <= e after ret_reg32;
		end if;
	end process;
end;