library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.constantes.all;
use work.tipos.all;

entity PLIC_gateway is
	port(
		reloj, Pcero: in std_logic;
		irq, int_completada: in std_logic_vector(tam_irq-1 downto 0);
		int_req: out std_logic_vector(tam_irq-1 downto 0)
	);
end PLIC_gateway;

architecture compor of PLIC_gateway is

component gateway is
	port(
		reloj, Pcero: in std_logic;
		irq, int_completada: in std_logic;
		int_req: out std_logic
	);
end component;

begin
	
	bucle: for i in 0 to tam_irq-1 generate
		gw: gateway port map (reloj => reloj, Pcero => Pcero, irq => irq(i),
									 int_completada => int_completada(i), int_req => int_req(i));
	end generate;

end;
