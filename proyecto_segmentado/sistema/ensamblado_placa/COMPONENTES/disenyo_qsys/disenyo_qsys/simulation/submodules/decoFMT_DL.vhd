--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.retardos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;

entity decoFMT_DL is 
  port (
		instr_DL: in st_instr;
		val_DL: in std_logic;
		fmti_tipo: out st_fmti_tipo
		);
end decoFMT_DL;

architecture compor of decoFMT_DL is

begin

decoFMT:	process(instr_DL, val_DL)

variable coop: st_coop;
variable v_fmti_tipo: st_fmti_tipo;

begin

	v_fmti_tipo := FMTI_I;
	
	coop := instr_DL(6 downto 0);
	
	if (val_DL = '1') then
		case coop is
		
			when BRANCH =>
				v_fmti_tipo := FMTI_B;
			when STORE =>
				v_fmti_tipo := FMTI_S;
			when lui | auipc =>
				v_fmti_tipo := FMTI_U;
			when jal =>
				v_fmti_tipo := FMTI_J;
			when others =>
	
		end case;
	end if;
	
	fmti_tipo 		<= v_fmti_tipo;
end process;

end;
			
		
			
