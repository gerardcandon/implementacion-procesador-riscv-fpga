library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.constantes.all;
use work.tipos.all;

entity mm_reloj is
port(
	reloj: in std_logic;
	Pcero: in std_logic;
	read: in std_logic;
	write: in std_logic;
	address: in std_logic_vector(3 downto 0);
	writedata: in dato_camino;
	byteenable: in st_byteenable;
	readdata: out dato_camino;
	waitrequest: out std_logic;
	readdatavalid: out std_logic;
	int_clk: out std_logic);
end mm_reloj;
	
architecture compor of mm_reloj is
signal mtime:	 st_csr_64; --0x9000000
signal mtimecmp:st_csr_64; --0x9000008

signal mtime_mas_1: st_csr_64;
begin

int_clk <= '1' when mtime >= mtimecmp else '0';
mtime_mas_1 <= mtime + x"0000000000000001";

rlj: process(reloj, Pcero)
variable v_readdata: dato_camino;
variable v_waitrequest, v_readdatavalid: std_logic;
variable v_mtime: st_csr_64;

begin
	v_readdata := (others => '0');
	v_waitrequest := '0';
	v_readdatavalid := '0';
	
	if (rising_edge(reloj)) then
		if (Pcero = '1') then
			mtime <= (others => '0');
			mtimecmp <= x"0000000000001000";		
		else
			mtime <= mtime_mas_1;
			case address is
				when x"0" =>
					if read = '1' then
						if byteenable(0) = '1' then
							v_readdata(7 downto 0) := mtime(7 downto 0);
						end if;
						if byteenable(1) = '1' then
							v_readdata(15 downto 8) := mtime(15 downto 8);
						end if;
						if byteenable(2) = '1' then
							v_readdata(23 downto 16) := mtime(23 downto 16);
						end if;
						if byteenable(3) = '1' then
							v_readdata(31 downto 24) := mtime(31 downto 24);
						end if;
						v_readdatavalid := '1';
						
					elsif write = '1' then
						if byteenable(0) = '1' then
							mtime(7 downto 0) <= writedata(7 downto 0);
						end if;
						if byteenable(1) = '1' then
							mtime(15 downto 8) <= writedata(15 downto 8);
						end if;
						if byteenable(2) = '1' then
							mtime(23 downto 16) <= writedata(23 downto 16);
						end if;
						if byteenable(3) = '1' then
							mtime(31 downto 24) <= writedata(31 downto 24);
						end if;
					end if;
					
				when x"4" =>
					if read = '1' then
						if byteenable(0) = '1' then
							v_readdata(7 downto 0) := mtime(39 downto 32);
						end if;
						if byteenable(1) = '1' then
							v_readdata(15 downto 8) := mtime(47 downto 40);
						end if;
						if byteenable(2) = '1' then
							v_readdata(23 downto 16) := mtime(55 downto 48);
						end if;
						if byteenable(3) = '1' then
							v_readdata(31 downto 24) := mtime(63 downto 56);
						end if;
						v_readdatavalid := '1';
						
					elsif write = '1' then
						if byteenable(0) = '1' then
							mtime(39 downto 32) <= writedata(7 downto 0);
						end if;
						if byteenable(1) = '1' then
							mtime(47 downto 40) <= writedata(15 downto 8);
						end if;
						if byteenable(2) = '1' then
							mtime(55 downto 48) <= writedata(23 downto 16);
						end if;
						if byteenable(3) = '1' then
							mtime(63 downto 56) <= writedata(31 downto 24);
						end if;
					end if;
				when x"8" =>
					if read = '1' then
						if byteenable(0) = '1' then
							v_readdata(7 downto 0) := mtimecmp(7 downto 0);
						end if;
						if byteenable(1) = '1' then
							v_readdata(15 downto 8) := mtimecmp(15 downto 8);
						end if;
						if byteenable(2) = '1' then
							v_readdata(23 downto 16) := mtimecmp(23 downto 16);
						end if;
						if byteenable(3) = '1' then
							v_readdata(31 downto 24) := mtimecmp(31 downto 24);
						end if;
						v_readdatavalid := '1';
						
					elsif write = '1' then
						if byteenable(0) = '1' then
							mtimecmp(7 downto 0) <= writedata(7 downto 0);
						end if;
						if byteenable(1) = '1' then
							mtimecmp(15 downto 8) <= writedata(15 downto 8);
						end if;
						if byteenable(2) = '1' then
							mtimecmp(23 downto 16) <= writedata(23 downto 16);
						end if;
						if byteenable(3) = '1' then
							mtimecmp(31 downto 24) <= writedata(31 downto 24);
						end if;
					end if;
					
				when x"c" =>
					if read = '1' then
						if byteenable(0) = '1' then
							v_readdata(7 downto 0) := mtimecmp(39 downto 32);
						end if;
						if byteenable(1) = '1' then
							v_readdata(15 downto 8) := mtimecmp(47 downto 40);
						end if;
						if byteenable(2) = '1' then
							v_readdata(23 downto 16) := mtimecmp(55 downto 48);
						end if;
						if byteenable(3) = '1' then
							v_readdata(31 downto 24) := mtimecmp(63 downto 56);
						end if;
						v_readdatavalid := '1';
						
					elsif write = '1' then
						if byteenable(0) = '1' then
							mtimecmp(39 downto 32) <= writedata(7 downto 0);
						end if;
						if byteenable(1) = '1' then
							mtimecmp(47 downto 40) <= writedata(15 downto 8);
						end if;
						if byteenable(2) = '1' then
							mtimecmp(55 downto 48) <= writedata(23 downto 16);
						end if;
						if byteenable(3) = '1' then
							mtimecmp(63 downto 56) <= writedata(31 downto 24);
						end if;
					end if;
				when others =>
			end case;
		end if;
		readdata <= v_readdata;
		readdatavalid <= v_readdatavalid;
		waitrequest <= v_waitrequest;
	end if;
end process;

end;