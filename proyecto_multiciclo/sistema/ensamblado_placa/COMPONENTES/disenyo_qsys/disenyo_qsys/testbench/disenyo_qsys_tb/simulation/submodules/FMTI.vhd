--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity FMTI is
	port(instr : in  st_instr;
		fmti_tipo: in st_fmti_tipo;
		s   : out dato_camino);
end FMTI;

architecture compor of FMTI is
begin
format: process(instr, fmti_tipo)
variable s_v: dato_camino;
begin
	case fmti_tipo is
		when FMTI_U => -- U type
			s_v := instr(31 downto 12) & (11 downto 0 => '0');
		when FMTI_I => -- I type
			s_v := (31 downto 11 => instr(31)) & instr(30 downto 20);
		when FMTI_S => -- S type
			s_v := (31 downto 11 => instr(31)) & instr(30 downto 25) & instr(11 downto 7);
		when FMTI_B => -- B type
		   s_v := (31 downto 12 => instr(31)) & instr(7) & instr(30 downto 25) & instr(11 downto 8) & (0 => '0');
		when FMTI_J => -- J type
			s_v := (31 downto 20 => instr(31)) & instr(19 downto 12) & instr(20) & instr(30 downto 21) & (0 => '0');
		when others =>
			s_v := (others => '0');
	end case;
	
s <= s_v after ret_FMT;

end process;

end;

