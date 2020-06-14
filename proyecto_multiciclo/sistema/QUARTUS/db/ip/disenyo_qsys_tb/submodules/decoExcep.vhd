library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;

entity decoExcep is 
  port (
	  estado: in st_estado;
	  instr: in st_instr;
	  direccion_mem: in mem_direcc;
	  excep: out std_logic;
	  excep_causa: out dato_camino
	  );
end decoExcep;

architecture comportamiento of decoExcep is

begin

exception: process(estado, instr, direccion_mem)
variable coop: st_coop;
variable funct3: st_funct3;
variable funct7: st_funct7;
variable dirbits: std_logic_vector(1 downto 0);
variable v_excep: std_logic;
variable v_excep_causa: dato_camino;

begin

	coop := instr(6 downto 0);
	funct3 := instr(14 downto 12);
	funct7 := instr(31 downto 25);
	dirbits := direccion_mem(1 downto 0);
	v_excep := '0';
	v_excep_causa := causa_no;
	
	case estado is
		when BRANCH_EVAL | JAL_CP | JALR_CP =>
			--Comprobamos que la direccion de la instruccion a la que se salta
			--este alineada
			if (dirbits /= "00") then
				v_excep := '1';
				v_excep_causa := causa_instrNoAlineada;
			elsif (direccion_mem(tam_mem_direcc-1 downto 26) /= "00") then
				v_excep := '1';
				v_excep_causa := causa_instrFueraDeRango;
			end if;
			
		when LOAD_DIR =>
			--Comprobamos que la direccion este alineada y dentro del rango
			--if (direccion_mem(tam_mem_direcc-1 downto 26) /= "00") then
			--	v_excep := '1';
			--	v_excep_causa := causa_loadFueraDeRango;
			--else
				case funct3 is
					when F3_LDST_H | F3_LD_HU =>
						if (dirbits /= "00" and dirbits /= "10") then
							v_excep := '1';
							v_excep_causa := causa_loadNoAlineado;
						end if;
					when F3_LDST_W =>
						if (dirbits /= "00") then
							v_excep := '1';
							v_excep_causa := causa_loadNoAlineado;
						end if;
					when others =>
				end case;
			--end if;
			
		when STORE_DIR =>
			--Comprobamos que la direccion este alineada y dentro del rango
			--if (direccion_mem(tam_mem_direcc-1 downto 26) /= "00") then
			--	v_excep := '1';
			--	v_excep_causa := causa_storeFueraDeRango;
			--else
				case funct3 is
					when F3_LDST_H =>
						if (dirbits /= "00" and dirbits /= "10") then
							v_excep := '1';
							v_excep_causa := causa_storeNoAlineado;
						end if;
					when F3_LDST_W =>
						if (dirbits /= "00") then
							v_excep := '1';
							v_excep_causa := causa_storeNoAlineado;
						end if;
					when others =>
				end case;
			--end if;
			
		when DECODE =>
			--En la etapa de decodificacion detectamos instrucciones ilegales
			case coop is
			
				when OP_IMM =>
					case funct3 is
						when F3_ADD_SUB | F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND => --No se comprueba f7, porque son immediatos							
						when F3_SR_LA =>
							case funct7 is
								when F7_SRAI | F7_RESTO =>
								when others =>
									v_excep := '1';
									v_excep_causa := causa_instrIlegal;
							end case;
						when others =>
							v_excep := '1';
							v_excep_causa := causa_instrIlegal;
					end case;
					
				when OP =>
					case funct3 is
						when F3_ADD_SUB | F3_SR_LA =>
							case funct7 is
								when F7_SUB | F7_RESTO => --F7_SUB y F7_SRA son lo mismo
								when others =>
									v_excep := '1';
									v_excep_causa := causa_instrIlegal;
							end case;
						when F3_SLL | F3_SLT | F3_SLTU | F3_XOR | F3_OR | F3_AND =>
							case funct7 is
								when F7_RESTO =>
								when others =>
									v_excep := '1';
									v_excep_causa := causa_instrIlegal;
							end case;
						when others =>
							v_excep := '1';
							v_excep_causa := causa_instrIlegal;
					end case;
							
				when LOAD =>
					case funct3 is
						when F3_LDST_B | F3_LDST_H | F3_LDST_W | F3_LD_BU | F3_LD_HU =>
						when others =>
							v_excep := '1';
							v_excep_causa := causa_instrIlegal;
						end case;
				
				when STORE =>
					case funct3 is
						when F3_LDST_B | F3_LDST_H | F3_LDST_W =>
						when others =>
							v_excep := '1';
							v_excep_causa := causa_instrIlegal;
					end case;
				
				when BRANCH =>
					case funct3 is
						when COND_BEQ | COND_BNE | COND_BLT | COND_BGE | COND_BLTU | COND_BGEU =>
						when others =>
							v_excep := '1';
							v_excep_causa := causa_instrIlegal;
					end case;
				
				when lui | auipc | jal =>
				
				when jalr =>
					if (funct3 /= F3_JALR) then
						v_excep := '1';
						v_excep_causa := causa_instrIlegal;
					end if;
				
				when SYSTEM =>
					--Se comprueban en decoExcep_SYS
					
				when NOP =>
				
				when others =>
					v_excep := '1';
					v_excep_causa := causa_instrIlegal;
			end case;
			
		when others =>
	end case;
	
	excep <= v_excep;
	excep_causa <= v_excep_causa;
end process;

end;

