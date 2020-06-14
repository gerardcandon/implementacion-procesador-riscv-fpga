library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;


entity decoSec is 
  port (instr: in st_instr;
		estado: in st_estado;
		ig, me, meu: in std_logic;
		msec_sel, mdirsec_sel: out st_mx2_sel;
		peCP: out std_logic;
		peCPinst: out std_logic;
		readvalid: in std_logic);
end decoSec;

architecture comportamiento of decoSec is

begin

decoSecu:	process(estado, ig, me, meu, instr, readvalid)
variable funct3: st_funct3;
variable v_msec_sel, v_mdirsec_sel: st_mx2_sel;
variable v_peCP, v_peCPinst: std_logic;



begin
	funct3:= instr(14 downto 12);
	seleccion_mx2(v_msec_sel, msec_mdato);
	seleccion_mx2(v_mdirsec_sel, mdirsec_CP);
	permiso_escritura_no(v_peCP);
	permiso_escritura_no(v_peCPinst);
	
	case estado is
	
		when FETCH =>
			if (lectura_mem_valida(readvalid)) then
				permiso_escritura_si(v_peCP);
				permiso_escritura_si(v_peCPinst);
			end if;			
		
		when JAL_CP | JALR_CP =>
			permiso_escritura_si(v_peCP);
		
		when BRANCH_EVAL =>
			seleccion_mx2(v_msec_sel, msec_Rsec);
			case funct3 is
				when COND_BEQ =>
					if alu_eval_igual(ig) then
						permiso_escritura_si(v_peCP);
						seleccion_mx2(v_mdirsec_sel, mdirsec_salto);
					end if;
				when COND_BNE =>
					if alu_eval_distintos(ig) then
						permiso_escritura_si(v_peCP);
						seleccion_mx2(v_mdirsec_sel, mdirsec_salto);
					end if;
				when COND_BLT =>
					if alu_eval_menor_que(me) then
						permiso_escritura_si(v_peCP);
						seleccion_mx2(v_mdirsec_sel, mdirsec_salto);
					end if;
				when COND_BGE =>
					if alu_eval_mayor_igual_que(me) then
						permiso_escritura_si(v_peCP);
						seleccion_mx2(v_mdirsec_sel, mdirsec_salto);
					end if;
				when COND_BLTU =>
					if alu_eval_menor_que_unsigned(meu) then
						permiso_escritura_si(v_peCP);
						seleccion_mx2(v_mdirsec_sel, mdirsec_salto);
					end if;
				when COND_BGEU =>
					if alu_eval_mayor_igual_que_unsigned(meu) then
						permiso_escritura_si(v_peCP);
						seleccion_mx2(v_mdirsec_sel, mdirsec_salto);
					end if;
				when others =>
			end case;

		when others =>

	end case;
	
	msec_sel 	<= v_msec_sel;
	mdirsec_sel <= v_mdirsec_sel;
	peCP 			<= v_peCP;
	peCPinst 	<= v_peCPinst;
	
end process;

end;


