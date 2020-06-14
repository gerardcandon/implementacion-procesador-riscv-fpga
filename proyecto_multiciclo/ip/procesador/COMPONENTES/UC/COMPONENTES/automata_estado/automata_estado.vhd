--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

use work.automata_estado_procedimientos_pkg.all;

entity automata_estado is
	port (
		reloj, start, reset: in std_logic;
		Pcero: out std_logic;
		instr: in st_instr;
		address: in mem_direcc;
		waitrequest, readvalid: in std_logic;
		estado: out st_estado;
		--interrupciones y excepciones
		ultimo_ciclo, decodificacion: out std_logic;
		excep, excep_SYS: in std_logic
	);
end automata_estado;

architecture compor of automata_estado is

signal prx_estado_s: st_estado;
signal estado_s: st_estado;

begin

rlj: process(reset, reloj)
variable v_estado: st_estado;
begin
	if reset = '1' then
		v_estado := RESTART;
	elsif rising_edge(reloj) then
		v_estado := prx_estado_s;
	end if;
	estado_s <= v_estado after ret_estado;
end process;

prx_esta: process(estado_s, start, waitrequest, instr, readvalid, excep, excep_SYS, address)
variable v_Pcero: std_logic;
variable v_prx_estado: st_estado;
variable coop: st_coop;
variable v_ultimo_ciclo, v_decodificacion: std_logic;
begin

	v_ultimo_ciclo := '0';
	v_decodificacion := '0';
	v_Pcero := '0';
	coop := instr(6 downto 0);
	
	--falta hacer que cuando se detecta una excepcion, decoMem inicie una lectura
	--si la memoria esta lista
	if (excep = '1' or excep_SYS = '1') then
		v_prx_estado := ESPERA;
		v_ultimo_ciclo := '1';
	
	else
		case estado_s is
		
			when RESTART =>
				v_Pcero := '1';
				v_prx_estado := INI;
				
			when INI =>
				if (start = '1') then
					v_prx_estado := ESPERA;
				else v_prx_estado := INI;
				end if;
				
			when ESPERA =>			
				if memoria_lista(waitrequest) then
					v_prx_estado := FETCH;
				else
					v_prx_estado := ESPERA;
				end if;
			
			when FETCH =>
				if lectura_mem_valida(readvalid) then
					v_prx_estado := DECODE;
					v_decodificacion := '1';
				else
					v_prx_estado := FETCH;
				end if;
			
			when DECODE =>
				case coop is
					when LOAD =>
						v_prx_estado := LOAD_DIR;
					when STORE =>
						v_prx_estado := STORE_DIR;
					when BRANCH =>
						v_prx_estado := BRANCH_EVAL;
					when jalr =>
						v_prx_estado := JALR_RD;
					when jal =>
						v_prx_estado := JAL_RD;
					when OP_IMM =>
						v_prx_estado := OP_IMM_ALU;
					when OP =>
						v_prx_estado := OP_ALU;
					when auipc =>
						v_prx_estado := AUIPC_ALU;
					when lui =>
						v_prx_estado := LUI_FMT;
					when SYSTEM =>
						v_prx_estado := SYS;
					when halt =>
						v_prx_estado := PARAR;
					when others =>
						v_prx_estado := ESPERA;
				end case;
			
			when LOAD_DIR =>
				if memoria_lista(waitrequest) then
					v_prx_estado := LOAD_LD;
				else
					v_prx_estado := LOAD_DIR;
				end if;
			when LOAD_LD =>
				if lectura_mem_valida(readvalid) then
					v_prx_estado := LOAD_FMT;
				else
					v_prx_estado := LOAD_LD;
				end if;
			
			when STORE_DIR =>
				if memoria_lista(waitrequest) then
					v_prx_estado := STORE_ST;
				else
					v_prx_estado := STORE_DIR;
				end if;
	
			when JAL_RD =>
				v_prx_estado := JAL_CP;
			
			when JALR_RD =>
				v_prx_estado := JALR_CP;
				
			when OP_ALU | OP_IMM_ALU | LUI_FMT | AUIPC_ALU | LOAD_FMT | STORE_ST | BRANCH_EVAL | 
				  JAL_CP | JALR_CP | SYS =>
				if memoria_lista(waitrequest) then
					v_prx_estado := FETCH;
				else
					v_prx_estado := ESPERA;
				end if;
				v_ultimo_ciclo := '1';
				
			when PARAR =>
				v_prx_estado := PARAR;
				
			when others =>
				v_prx_estado := PARAR;
				
		end case;
	end if;
	
	Pcero <= v_Pcero;
	prx_estado_s <= v_prx_estado;
	ultimo_ciclo <= v_ultimo_ciclo;
	decodificacion <= v_decodificacion;

end process;	

estado <= estado_s;
end;
