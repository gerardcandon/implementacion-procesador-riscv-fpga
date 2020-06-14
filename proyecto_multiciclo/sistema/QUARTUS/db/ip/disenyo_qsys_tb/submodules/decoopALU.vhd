library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.retardos.all;
use work.tipos.all;
use work.constantes.all;

entity decoopALU is 
  port (instr: in st_instr;
		estado: in st_estado;
		opALU: out st_opALU);
end decoopALU;

architecture compor of decoopALU is

procedure ALU_cal(constant v_opera: in std_logic; v_modificador: std_logic; funct3: in st_funct3; signal opALU: out st_opALU) is
begin
	opALU <= v_opera & v_modificador & funct3;

end procedure;

begin

decoopALU:	process(estado, instr)
variable funct3: st_funct3;
variable funct7: st_funct7;

constant suma: st_funct3:= F3_ADD_SUB;

begin
	funct3:= instr(14 downto 12);
	funct7:= instr(31 downto 25);

	case estado is
		when FETCH | DECODE =>
			ALU_cal('1', '0', suma, opALU);
			
		when LUI_FMT | AUIPC_ALU =>
			ALU_cal('1', '0', suma, opALU);

		when JAL_RD | JAL_CP | JALR_RD | JALR_CP =>
			ALU_cal('1', '0', suma, opALU);

		when BRANCH_EVAL =>
			ALU_cal('1', '1', suma, opALU);
			
		when LOAD_DIR | LOAD_FMT | STORE_DIR =>
			ALU_cal('1', '0', suma, opALU);

		when OP_IMM_ALU =>
			case funct3 is
				when F3_ADD_SUB | F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
							ALU_cal('1', '0', funct3, opALU);
			    when F3_SR_LA =>
					case funct7 is
						when F7_SRAI  | F7_RESTO =>
							ALU_cal('1', funct7(5), funct3, opALU);
						when others =>  
							ALU_cal('0', '0', suma, opALU);
					end case;
				when others => 
					ALU_cal('0', '0', suma, opALU);
			end case; 

		when OP_ALU =>
			case funct3 is
				when F3_ADD_SUB | F3_SR_LA =>
					case funct7 is 
						when F7_SUB | F7_RESTO =>  
							ALU_cal('1', funct7(5), funct3, opALU);
						when others => 
							ALU_cal('0', '0', suma, opALU);
					end case;
				when F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
					case funct7 is 
						when F7_RESTO =>
							ALU_cal('1', funct7(5), funct3, opALU);
						when others => 
							ALU_cal('0', '0', suma, opALU);
					end case;
				when others =>
					ALU_cal('0', '0', suma, opALU);
			end case;

		when others => 
			ALU_cal('0', '0', suma, opALU);

	end case;
end process;

end;


