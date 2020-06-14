--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.retardos.all;
use work.tipos.all;
use work.constantes.all;

entity decoopALU is 
  port (instr: in st_instr;
		val_DL: in std_logic;
		opALU: out st_opALU);
end decoopALU;

architecture compor of decoopALU is

procedure ALU_cal(constant v_opera: in std_logic; v_modificador: std_logic; funct3: in st_funct3; signal opALU: out st_opALU) is
begin
	opALU <= v_opera & v_modificador & funct3;

end procedure;

begin

decoopALU:	process(instr, val_DL)
variable coop: st_coop;
variable funct3: st_funct3;
variable funct7: st_funct7;

constant suma: st_funct3:= F3_ADD_SUB;

begin
	coop := instr(6 downto 0);
	funct3:= instr(14 downto 12);
	funct7:= instr(31 downto 25);
	
	if (val_DL = '1') then
		case coop is
			when BRANCH | lui | auipc | jalr | jal | LOAD | STORE =>
				ALU_cal('1', '0', suma, opALU);

			when OP_IMM =>
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

			when OP =>
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
	end if;
end process;

end;


