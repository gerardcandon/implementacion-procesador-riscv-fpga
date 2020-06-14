library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.tipos.all;

package BR_CSR_procedimientos_pkg is
	procedure esc_csr_mm(signal writedata_csr: in dato_camino; signal byteenable_csr: in st_byteenable;
							signal registro: out st_csr);
	procedure cambio_modo_trap(signal modo: out st_modo; signal mstatus: inout st_csr);
	procedure cambio_modo_mret(signal modo: out st_modo; signal mstatus: inout st_csr);
end BR_CSR_procedimientos_pkg;

package body BR_CSR_procedimientos_pkg is

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
	
	procedure cambio_modo_trap(signal modo: out st_modo; signal mstatus: inout st_csr) is
	begin
		modo <= modo_M;
		mstatus(MPIE) <= mstatus(MIE);
		mstatus(MIE) <= '0';
		mstatus(MPP1 downto MPP0) <= modo_U;
	end cambio_modo_trap;
	
	procedure cambio_modo_mret(signal modo: out st_modo; signal mstatus: inout st_csr) is
	begin
		modo <= mstatus(MPP1 downto MPP0);
		mstatus(MIE) <= mstatus(MPIE);
		mstatus(MPIE) <= '1';
		mstatus(MPP1 downto MPP0) <= modo_U;
	end cambio_modo_mret;
	
end BR_CSR_procedimientos_pkg;
	