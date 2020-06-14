library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.constantes.all;
use work.tipos.all;

entity controlador_interrupciones is
	port(
		irq: in st_irq;
		mcause: out dato_camino;
		mstatus: in dato_camino;
		int: out std_logic
	);
end controlador_interrupciones;

architecture compor of controlador_interrupciones is
constant zero: std_logic_vector(tam_dato_camino-1 downto 0) := x"00000000";
signal mie: std_logic;

begin

mie <= mstatus(3);

inter: process(irq)
begin
	if (irq(0) = '1' and mie = '1') then
		mcause <= x"00000001";
		int <= '1';
	else
		int <= '0';
	end if;
end process;

end;
