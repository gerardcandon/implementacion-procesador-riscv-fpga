library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.decoder_procedimientos_pkg.all;

entity decoExcep is 
  port (
	  estado: in st_estado;
	  instr: in st_instr;
	  direccion_mem: in mem_direcc;
	  excep: out std_logic;
	  excep_causa: out dato_camino;
	  modo_csr: in st_modo;
	  parar: out std_logic
	  );
end decoExcep;

architecture comportamiento of decoExcep is

begin

exception: process(estado, instr, direccion_mem, modo_csr)
variable coop: st_coop;
variable funct3: st_funct3;
variable funct7: st_funct7;
variable dirbits: std_logic_vector(1 downto 0);
variable v_excep: std_logic;
variable v_excep_causa: dato_camino;
variable v_parar: std_logic;

begin

	coop := instr(6 downto 0);
	funct3 := instr(14 downto 12);
	funct7 := instr(31 downto 25);
	dirbits := direccion_mem(1 downto 0);
	v_excep := '0';
	v_excep_causa := causa_no;
	v_parar := '0';
	
	case estado is
		when OP_ALU | OP_IMM_ALU | LUI_FMT | AUIPC_ALU | LOAD_FMT | STORE_ST | BRANCH_EVAL | 
			  JAL_CP | JALR_CP | SYS | ESPERA =>
			--Comprobamos que la instruccion que se va a interpretar este alineada
			if (dirbits /= "00") then
				v_excep := '1';
				v_excep_causa := causa_instrNoAlineada;
			--Comprobamos que la instruccion que se va a interpretar este dentro del rango
			elsif direccion_fuera_de_rango(direccion_mem) then
				v_excep := '1';
				v_excep_causa := causa_instrFueraDeRango;
			--Comprobamos que se tengan privilegios para interpretar la instruccion
			elsif direccion_protegida(direccion_mem) and modo_csr /= modo_M then
				v_excep := '1';
				v_excep_causa := causa_instrProtegida;
			end if;
			
		when LOAD_DIR =>
			--Comprobamos que la direccion este alineada
			if load_no_alineado(dirbits, funct3) then
				v_excep := '1';
				v_excep_causa := causa_loadNoAlineado;
			--Comprobamos que la direccion este dentro del rango
			elsif direccion_fuera_de_rango(direccion_mem) then
				v_excep := '1';
				v_excep_causa := causa_loadFueraDeRango;
			--Comprobamos que se tengan privilegios para hacer el load
			elsif direccion_protegida(direccion_mem) and modo_csr /= modo_M then
				v_excep := '1';
				v_excep_causa := causa_loadProtegido;
			end if;
			
		when STORE_DIR =>
			--Comprobamos que la direccion este alineada
			if store_no_alineado(dirbits, funct3) then
				v_excep := '1';
				v_excep_causa := causa_storeNoAlineado;
			--Comprobamos que ls direccion este dentro del rango
			elsif direccion_fuera_de_rango(direccion_mem) then
				v_excep := '1';
				v_excep_causa := causa_storeFueraDeRango;
			--Comprobamos que se tengan privilegios para hacer el store
			elsif direccion_protegida(direccion_mem) and modo_csr /= modo_M then
				v_excep := '1';
				v_excep_causa := causa_storeProtegido;
			end if;
			
			
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
				
				when halt =>
					v_parar := '1';
				
				when others =>
					v_excep := '1';
					v_excep_causa := causa_instrIlegal;
			end case;
					
		when others =>
	end case;
	
	excep <= v_excep;
	excep_causa <= v_excep_causa;
	parar <= v_parar;
end process;

end;

