library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.constantes.all;
use work.tipos.all;

entity gateway is
	port(
		reloj, Pcero: in std_logic;
		irq, int_completada: in std_logic;
		int_req: out std_logic
	);
end gateway;

architecture compor of gateway is

signal enviada: std_logic;

begin

proc: process(reloj, Pcero, enviada)
variable v_enviada: std_logic;
variable v_int_req: std_logic;
begin	
		
	if (rising_edge(reloj)) then
		v_enviada := enviada;
		v_int_req := '0';
		
		if (Pcero = '1' or int_completada = '1') then
			v_enviada := '0';
			
		elsif (irq = '1' and enviada = '0') then
			v_enviada := '1';
			v_int_req := '1';
		end if;
	end if;
		
   

	enviada <= v_enviada;
	int_req <= v_int_req;
end process;
end;