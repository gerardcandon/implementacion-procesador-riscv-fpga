--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;


entity decoSec is 
  port (
		instr_A: in st_instr;
		val_A: in std_logic;
		ig, me, meu: in std_logic;
		msec_sel: out st_mx2_sel;
		secuenciamiento: out std_logic
	);
end decoSec;

architecture comportamiento of decoSec is
begin

decoSecu:	process(ig, me, meu, instr_A, val_A)
variable coop: st_coop;
variable funct3: st_funct3;
variable v_msec_sel: st_mx2_sel;
variable salto, v_secuenciamiento: std_logic;
variable v_bloq_etapa_A, v_inyec_B, v_inyec_DL, v_inyec_A, v_inyec_M: std_logic;

begin
	coop := instr_A(6 downto 0);
	funct3:= instr_A(14 downto 12);
	seleccion_mx2(v_msec_sel, msec_impl);
	v_secuenciamiento := '0';
	salto := '0';
	
	if (val_A = '1') then
		
		case coop is		
			
			when jal | jalr =>
				salto := '1';
			
			when BRANCH =>
				case funct3 is
					when COND_BEQ =>
						if alu_eval_igual(ig) then
							salto := '1';
						end if;
					when COND_BNE =>
						if alu_eval_distintos(ig) then
							salto := '1';
						end if;
					when COND_BLT =>
						if alu_eval_menor_que(me) then
							salto := '1';
						end if;
					when COND_BGE =>
						if alu_eval_mayor_igual_que(me) then
							salto := '1';
						end if;
					when COND_BLTU =>
						if alu_eval_menor_que_unsigned(meu) then
							salto := '1';
						end if;
					when COND_BGEU =>
						if alu_eval_mayor_igual_que_unsigned(meu) then
							salto := '1';
						end if;
					when others =>
				end case;

			when others =>

		end case;
		
		if (salto = '1') then
			seleccion_mx2(v_msec_sel, msec_salto);
			v_secuenciamiento := '1';
		end if;

	end if;
	
	msec_sel <= v_msec_sel;
	secuenciamiento <= v_secuenciamiento;
	
end process;

end;


