library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;

entity deco_excep_interrupt is 
  port (
	  estado: in st_estado;
	  instr: in st_instr; 
	  mcause, mstatus: in dato_camino;
	  CoErr: out std_logic;
	  trap: out std_logic;
	  mret: out std_logic);			
end deco_excep_interrupt;

architecture comportamiento of deco_excep_interrupt is

begin

interrupciones: process(estado)
begin
	case estado is
		when OP_ALU | OP_IMM_ALU | LOAD_FMT | STORE_ST | JAL_CP | JALR_CP | AUIPC_ALU | BRANCH_EVAL |
			  LUI_FMT =>
			if (mcause /= x"00000000" and mstatus(3) = '1') then
				trap <= '1';
			else
				trap <= '0';
			end if;
			mret <= '0';
		when MRETURN =>
			trap <= '0';
			mret <= '1';
		when others =>
			trap <= '0';
			mret <= '0';
	end case;
end process;

end;

