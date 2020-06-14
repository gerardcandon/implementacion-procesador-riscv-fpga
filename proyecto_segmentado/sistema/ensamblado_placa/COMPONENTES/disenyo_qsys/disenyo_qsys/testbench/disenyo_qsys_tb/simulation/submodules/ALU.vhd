--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity ALU is
    port (opALU : in  st_opALU;
          a	: in  dato_camino;
          b	: in  dato_camino;
          s	: out dato_camino);
end ALU;

architecture compor of ALU is

begin
	alu_p: process (opALU, a, b)
variable sa, sb: signed(tam_dato_camino-1 downto 0);
variable ua, ub: unsigned(tam_dato_camino-1 downto 0);

begin
	sa := signed(a);
	sb := signed(b);
	ua := unsigned(a);
	ub := unsigned(b);
    
	case (opALU) is
		when ALU_ADD  =>
			s <= std_logic_vector(ua + ub) after ret_alu;
		when ALU_SUB  => 
			s <= std_logic_vector(ua - ub) after ret_alu;
		when ALU_SLT =>
			if sa < sb then
				s <= (tam_dato_camino-1 downto 1 => '0', 0 => '1') after ret_alu;
			else
				s <= (others => '0') after ret_alu;
			end if;
		when ALU_SLTU =>
			if ua < ub then
				s <= (tam_dato_camino-1 downto 1 => '0', 0 => '1') after ret_alu;
			else
				s <= (others => '0') after ret_alu;
			end if;

		when ALU_AND => s <= a and b after ret_alu;
		when ALU_OR  => s <= a or b after ret_alu;
		when ALU_XOR => s <= a xor b after ret_alu;
		when ALU_SLL => s <= std_logic_vector(shift_left(ua, to_integer(ub(4 downto 0)))) after ret_alu;
		when ALU_SRA => s <= std_logic_vector(shift_right(sa, to_integer(ub(4 downto 0)))) after ret_alu;
		when ALU_SRL => s <= std_logic_vector(shift_right(ua, to_integer(ub(4 downto 0)))) after ret_alu;
		when others  => s <= a after ret_alu;
	end case;
	
end process;
end;
