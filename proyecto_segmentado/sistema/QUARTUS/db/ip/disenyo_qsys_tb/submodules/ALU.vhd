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
          s	: out dato_camino;
			 bit_0: in std_logic;
	  me, meu, ig: out std_logic);
end ALU;

architecture compor of ALU is

begin
	alu_p: process (opALU, a, b, bit_0)
variable sa, sb: signed(tam_dato_camino-1 downto 0);
variable ua, ub: unsigned(tam_dato_camino-1 downto 0);

begin
	sa := signed(a);
	sb := signed(b);
	ua := unsigned(a);
	ub := unsigned(b);
    
	case (opALU) is
		when ALU_ADD  =>
			if bit_0 = '0' then
				s <= std_logic_vector(ua + ub) after ret_alu;
			else
				s <= std_logic_vector(ua + ub) and x"fffffffe" after ret_alu;
			end if;
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
	
	if sa < sb then
				me <= '1' after ret_alu;
	else me <= '0' after ret_alu;
	end if;
	if ua < ub then
				meu <= '1' after ret_alu;
	else meu <= '0' after ret_alu;
	end if;
	if ua = ub then
				ig <= '1' after ret_alu;
	else ig <= '0' after ret_alu;
	end if;
end process;
end;
