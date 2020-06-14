library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.tipos.all;

entity CLINT is
	port (
		mtime, mtimecmp: in st_csr_64;
		int_clk: out std_logic
	);
end CLINT;

architecture compor of CLINT is
begin
	int_clk <= '1' when mtime >= mtimecmp else '0';
end;
