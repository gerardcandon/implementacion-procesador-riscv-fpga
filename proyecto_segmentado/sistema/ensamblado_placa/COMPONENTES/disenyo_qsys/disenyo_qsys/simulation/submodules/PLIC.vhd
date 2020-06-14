library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.constantes.all;
use work.tipos.all;

entity PLIC is
	port(
		reloj, Pcero: in std_logic;
		irq: in st_irq;
		int_causa: out dato_camino;
		mstatus: in dato_camino;
		int: out std_logic;
		int_completada, int_claim: in std_logic_vector(tam_irq-1 downto 0)
	);
end PLIC;

architecture compor of PLIC is

component PLIC_core is
	port(
		reloj, Pcero: in std_logic;
		int_req, int_claim: in std_logic_vector(tam_irq-1 downto 0);
		int: out std_logic;
		mstatus: in dato_camino;
		int_causa: out dato_camino
	);
end component;

component PLIC_gateway is
	port(
		reloj, Pcero: in std_logic;
		irq, int_completada: in std_logic_vector(tam_irq-1 downto 0);
		int_req: out std_logic_vector(tam_irq-1 downto 0)
	);
end component;

signal int_req: std_logic_vector(tam_irq-1 downto 0);

begin
	
	gw: PLIC_gateway port map (reloj => reloj, Pcero => Pcero, irq => irq, int_completada => int_completada,
										int_req => int_req);
	core: PLIC_core port map (reloj => reloj, Pcero => Pcero, int_req => int_req, int_claim => int_claim,
									  int => int, mstatus => mstatus, int_causa => int_causa);
	

end;
