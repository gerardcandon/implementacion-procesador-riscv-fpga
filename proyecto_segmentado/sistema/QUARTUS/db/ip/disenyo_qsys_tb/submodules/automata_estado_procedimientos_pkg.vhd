library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package automata_estado_procedimientos_pkg is
	function memoria_lista(ocupada: std_logic) return boolean;
	function lectura_mem_valida(valida: std_logic) return boolean;
	function acceso_reg_mapeado_en_mem(direccion: mem_direcc) return boolean;
end package;

package body automata_estado_procedimientos_pkg is

	function memoria_lista(ocupada: std_logic) return boolean is
	begin
		if (ocupada = '0') then
			return true;
		else
			return false;
		end if;
	end memoria_lista;
	
	function lectura_mem_valida(valida: std_logic) return boolean is
	begin
		if (valida = '1') then
			return true;
		else
			return false;
		end if;
	end lectura_mem_valida;
	
	function acceso_reg_mapeado_en_mem(direccion: mem_direcc) return boolean is
	begin
		if (direccion >= csr_addr_begin and direccion <= csr_addr_end) then
			return true;
		else
			return false;
		end if;
	end acceso_reg_mapeado_en_mem;
	
end package body;