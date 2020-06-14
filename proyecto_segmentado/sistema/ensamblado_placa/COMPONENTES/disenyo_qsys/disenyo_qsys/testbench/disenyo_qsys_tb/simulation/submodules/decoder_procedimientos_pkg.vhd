--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package decoder_procedimientos_pkg is
	procedure seleccion_mx2(variable selector: out st_mx2_sel; constant seleccion: in st_mx2_sel);
	procedure seleccion_mx3(variable selector: out st_mx3_sel; constant seleccion: in st_mx3_sel);
	procedure seleccion_mx4(variable selector: out st_mx4_sel; constant seleccion: in st_mx4_sel);
	procedure permiso_escritura_si(variable pe: out std_logic);
	procedure permiso_escritura_no(variable pe: out std_logic);
	procedure lectura_mem(variable read: out std_logic);
	procedure escritura_mem(variable write: out std_logic);
	procedure no_acceso_mem(variable read, write: out std_logic);
	function lectura_mem_valida(valida: std_logic) return boolean;
	function alu_eval_igual(ig: std_logic) return boolean;
	function alu_eval_distintos(ig: std_logic) return boolean;
	function alu_eval_mayor_igual_que(me: std_logic) return boolean;
	function alu_eval_mayor_igual_que_unsigned(meu: std_logic) return boolean;
	function alu_eval_menor_que(me: std_logic) return boolean;
	function alu_eval_menor_que_unsigned(meu: std_logic) return boolean;
end package;

package body decoder_procedimientos_pkg is

	procedure seleccion_mx2(variable selector: out st_mx2_sel; constant seleccion: in st_mx2_sel) is
	begin
		selector := seleccion;
	end seleccion_mx2;
	
	procedure seleccion_mx3(variable selector: out st_mx3_sel; constant seleccion: in st_mx3_sel) is
	begin
		selector := seleccion;
	end seleccion_mx3;
	
	procedure seleccion_mx4(variable selector: out st_mx4_sel; constant seleccion: in st_mx4_sel) is
	begin
		selector := seleccion;
	end seleccion_mx4;
	
	procedure permiso_escritura_si(variable pe: out std_logic) is
	begin
		pe := '1';
	end permiso_escritura_si;
	
	procedure permiso_escritura_no(variable pe: out std_logic) is
	begin
		pe := '0';
	end permiso_escritura_no;
	
	procedure lectura_mem(variable read: out std_logic) is
	begin
		read := '1';
	end lectura_mem;
	
	procedure escritura_mem(variable write: out std_logic) is
	begin
		write := '1';
	end escritura_mem;
	
	procedure no_acceso_mem(variable read, write: out std_logic) is
	begin
		read := '0';
		write := '0';
	end no_acceso_mem;
	
	function lectura_mem_valida(valida: std_logic) return boolean is
	begin
		if (valida = '1') then
			return true;
		else
			return false;
		end if;
	end lectura_mem_valida;
	
	function alu_eval_igual(ig: std_logic) return boolean is
	begin
		if (ig = '1') then
			return true;
		else
			return false;
		end if;
	end alu_eval_igual;
	
	function alu_eval_distintos(ig: std_logic) return boolean is
	begin
		if (ig = '0') then
			return true;
		else
			return false;
		end if;
	end alu_eval_distintos;
	
	function alu_eval_mayor_igual_que(me: std_logic) return boolean is
	begin
		if (me = '0') then
			return true;
		else
			return false;
		end if;
	end alu_eval_mayor_igual_que;
	
	function alu_eval_mayor_igual_que_unsigned(meu: std_logic) return boolean is
	begin
		if (meu = '0') then
			return true;
		else
			return false;
		end if;
	end alu_eval_mayor_igual_que_unsigned;
	
	function alu_eval_menor_que(me: std_logic) return boolean is
	begin
		if (me = '1') then
			return true;
		else
			return false;
		end if;
	end alu_eval_menor_que;
	
	function alu_eval_menor_que_unsigned(meu: std_logic) return boolean is
	begin
		if (meu = '1') then
			return true;
		else
			return false;
		end if;
	end alu_eval_menor_que_unsigned;
	
end package body;
