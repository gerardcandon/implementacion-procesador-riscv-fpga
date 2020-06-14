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
	procedure permiso_escritura_si(variable pe: out std_logic);
	procedure permiso_escritura_no(variable pe: out std_logic);
	procedure lectura_mem(variable read: out std_logic);
	procedure escritura_mem(variable write: out std_logic);
	procedure lectura_reg_mapeado_en_mem(variable read_csr: out std_logic);
	procedure escritura_reg_mapeado_en_mem(variable write_csr: out std_logic);
	procedure no_acceso_mem(variable read, write: out std_logic);
	function lectura_mem_valida(valida: std_logic) return boolean;
	function alu_eval_igual(ig: std_logic) return boolean;
	function alu_eval_distintos(ig: std_logic) return boolean;
	function alu_eval_mayor_igual_que(me: std_logic) return boolean;
	function alu_eval_mayor_igual_que_unsigned(meu: std_logic) return boolean;
	function alu_eval_menor_que(me: std_logic) return boolean;
	function alu_eval_menor_que_unsigned(meu: std_logic) return boolean;
	function direccion_fuera_de_rango(address: mem_direcc) return boolean;
	function direccion_protegida(address: mem_direcc) return boolean;
	function load_no_alineado(dirbits: std_logic_vector(1 downto 0); funct3: st_funct3) return boolean;
	function store_no_alineado(dirbits: std_logic_vector(1 downto 0); funct3: st_funct3) return boolean;
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
	
	procedure lectura_reg_mapeado_en_mem(variable read_csr: out std_logic) is
	begin
		read_csr := '1';
	end lectura_reg_mapeado_en_mem;
	
	procedure escritura_reg_mapeado_en_mem(variable write_csr: out std_logic) is
	begin
		write_csr := '1';
	end escritura_reg_mapeado_en_mem;
	
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
	
	function direccion_fuera_de_rango(address: mem_direcc) return boolean is
	begin
		if ((address > sdram_sys_addr_end and address < ps2_controller_addr_begin) or
			 (address > ps2_controller_addr_end and address < dma_controller_addr_begin) or
			 (address > dma_controller_addr_end and address < sram_addr_begin) or
			 (address > sram_addr_end and address < csr_addr_begin) or
			 (address > csr_addr_end)) then
			return true;
		else
			return false;
		end if;
	end direccion_fuera_de_rango;
	
	function direccion_protegida(address: mem_direcc) return boolean is
	begin
		if (address > sdram_usr_addr_end) then
			return true;
		else
			return false;
		end if;
	end direccion_protegida;
	
	function load_no_alineado(dirbits: std_logic_vector(1 downto 0); funct3: st_funct3) return boolean is
	variable ret: boolean;
	begin
		ret := false;
		case funct3 is
			when F3_LDST_H | F3_LD_HU =>
				if (dirbits /= "00" and dirbits /= "10") then
					ret := true;
				end if;
			when F3_LDST_W =>
				if (dirbits /= "00") then
					ret := true;
				end if;
			when others =>
		end case;
		return ret;
	end load_no_alineado;
	
	function store_no_alineado(dirbits: std_logic_vector(1 downto 0); funct3: st_funct3) return boolean is
	variable ret: boolean;
	begin
		ret := false;
		case funct3 is
			when F3_LDST_H =>
				if (dirbits /= "00" and dirbits /= "10") then
					ret := true;
				end if;
			when F3_LDST_W =>
				if (dirbits /= "00") then
					ret := true;
				end if;
			when others =>
		end case;
		return ret;
	end store_no_alineado;
	
end package body;
