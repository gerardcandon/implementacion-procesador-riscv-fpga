--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.constantes.all;
use work.tipos.all;
use work.retardos.all;

entity ALU_CSR is
	port (
		a, b: in dato_camino;
		opCSR: in st_opCSR;
		s: out dato_camino
	);
end ALU_CSR;

architecture compor of ALU_CSR is
begin

op: process(a, b, opCSR)
variable v_s: dato_camino;
begin

	v_s := (others => '0');

	case opCSR is
		when ALU_W =>
			v_s := a;
		when ALU_S =>
			v_s := b or a;
		when ALU_C =>
			v_s := b and (not a);
	end case;
	
	s <= v_s after ret_alu_sys;
end process;

end;
