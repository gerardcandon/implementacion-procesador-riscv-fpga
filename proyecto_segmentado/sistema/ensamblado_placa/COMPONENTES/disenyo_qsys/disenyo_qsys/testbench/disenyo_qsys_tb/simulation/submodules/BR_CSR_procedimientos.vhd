library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.tipos.all;

package BR_CSR_procedimientos_pkg is
	procedure init_BR_CSR(signal modo_csr: out st_modo; signal mstatus: out st_csr; signal mtvec: out st_csr;
								 signal mscratch: out st_csr; signal mepc: out st_csr; signal mtval: out st_csr;
								 signal mie: out st_csr; signal mip: out st_csr; variable modelsim: boolean);
	procedure esc_csr_mm(signal writedata_csr: in dato_camino; signal byteenable_csr: in st_byteenable;
							signal registro: out st_csr);
	procedure cambio_modo_trap(signal modo: inout st_modo; signal mstatus: inout st_csr);
	procedure cambio_modo_mret(signal modo: out st_modo; signal mstatus: inout st_csr);
	function acceso_no_alineado(signal excep_causa_CSR: in st_csr) return boolean;
end BR_CSR_procedimientos_pkg;

package body BR_CSR_procedimientos_pkg is

	procedure init_BR_CSR(signal modo_csr: out st_modo; signal mstatus: out st_csr; signal mtvec: out st_csr;
								 signal mscratch: out st_csr; signal mepc: out st_csr; signal mtval: out st_csr;
								 signal mie: out st_csr; signal mip: out st_csr; variable modelsim: boolean) is
	begin
		modo_csr <= modo_M;
		mstatus  <= (tam_csr-1 downto bMPIE+1 => '0') & (bMPIE => '1') & (bMPIE-1 downto 0 => '0');
		mtval	   <= (others => '0');
		mscratch <= x"00070000";
		mie      <= (tam_csr-1 downto bMEIE+1 => '0') & (bMEIE => '1') & 
				      (bMEIE-1 downto bMTIE+1 => '0') & (bMTIE => '1') & (bMTIE-1 downto 0 => '0');
		mip      <= (others => '0');
		
		if (modelsim = false) then
			mtvec <= x"00040000";
			mepc  <= x"0000024c";
		else
			mtvec <= x"00000014";
			mepc  <= x"00000008";
		end if;
		
	end init_BR_CSR;

	procedure esc_csr_mm(signal writedata_csr: in dato_camino; signal byteenable_csr: in st_byteenable;
								signal registro: out st_csr) is
	begin

		if (byteenable_csr(0) = '1') then
			registro(7 downto 0) <= writedata_csr(7 downto 0);
		end if;
		if (byteenable_csr(1) = '1') then
			registro(15 downto 8) <= writedata_csr(15 downto 8);
		end if;
		if (byteenable_csr(2) = '1') then
			registro(23 downto 16) <= writedata_csr(23 downto 16);
		end if;
		if (byteenable_csr(3) = '1') then
			registro(31 downto 24) <= writedata_csr(31 downto 24);
		end if;

	end esc_csr_mm;
	
	procedure cambio_modo_trap(signal modo: inout st_modo; signal mstatus: inout st_csr) is
	begin
		mstatus(bMPP1 downto bMPP0) <= modo;
		modo <= modo_M;
		mstatus(bMPIE) <= mstatus(bMIE);
		mstatus(bMIE) <= '0';
	end cambio_modo_trap;
	
	procedure cambio_modo_mret(signal modo: out st_modo; signal mstatus: inout st_csr) is
	begin
		modo <= mstatus(bMPP1 downto bMPP0);
		mstatus(bMPP1 downto bMPP0) <= modo_U;
		mstatus(bMIE) <= mstatus(bMPIE);
		mstatus(bMPIE) <= '1';
	end cambio_modo_mret;
	
	function acceso_no_alineado(signal excep_causa_CSR: in st_csr) return boolean is
	begin
		case excep_causa_CSR is
			when causa_instrNoAlineada|causa_loadNoAlineado|causa_storeNoAlineado =>
				return true;
			when others =>
				return false;
		end case;
	end acceso_no_alineado;
	
end BR_CSR_procedimientos_pkg;
	
