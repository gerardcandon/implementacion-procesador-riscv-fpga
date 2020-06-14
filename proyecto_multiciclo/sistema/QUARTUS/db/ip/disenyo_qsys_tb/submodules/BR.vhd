library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.retardos.all;
use work.tipos.all;
use work.constantes.all;
--use work.BR_procedimientos.all;

entity BR is
port(
	reloj: in std_logic;
	IDL1: in reg_direcc;
	IDL2: in reg_direcc;
	IDE: in reg_direcc;
	PE: in std_logic;
	DE: in dato_camino;
	L1: out dato_camino;
	L2: out dato_camino);
end BR;

architecture compor of BR is
	
signal registros: tipo_banco;
	
begin

	flanco: process(reloj)
	begin
		--escribimos si tenemos PE y es un flanco ascendente de reloj
		if rising_edge(reloj) then
			if PE = '1' then
				registros(to_integer(unsigned(IDE))) <= DE after ret_banco_esc;
			end if;
		end if;
	end process;
	
	L1 <= registros(to_integer(unsigned(IDL1))) after ret_banco_lec when (to_integer(unsigned(IDL1))) /= 0 else (others => '0')after ret_banco_lec;
	L2 <= registros(to_integer(unsigned(IDL2))) after ret_banco_lec when (to_integer(unsigned(IDL2))) /= 0 else (others => '0')after ret_banco_lec;
end;