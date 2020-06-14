--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.constantes.all;
use work.tipos.all;
use std.textio.all;

entity mem is
port (
	reloj: in std_logic;
	Pcero: in std_logic;
	read: in std_logic;
	write: in std_logic;
	address: in mem_direcc;
	writedata: in dato_camino;
	byteenable: in st_byteenable;
	readdata: out dato_camino;
	waitrequest: out std_logic;
	readdatavalid: out std_logic);
end mem;

architecture compor of mem is

component ram is
port (
	reloj: in std_logic;
	Pcero: in std_logic;
	write, read: in std_logic;
	address: in mem_direcc;
	writedata: in dato_camino;
	byteenable: in st_byteenable;
	readdata: out dato_camino);
end component;

signal count: std_logic_vector(1 downto 0) := "00";
signal write_s, read_s, read_ram, write_ram: std_logic;
signal byteenable_s, byteenable_ram: st_byteenable;
signal address_s, address_ram: mem_direcc;
signal writedata_s: dato_camino;
signal writedata_ram, readdata_ram: dato_camino;

begin

memoria: ram port map(reloj => reloj, Pcero => Pcero, write => write_ram, read => read_ram, address => address_ram,
				 writedata => writedata_ram, readdata => readdata_ram, byteenable => byteenable_ram);

rlj: process(Pcero, reloj, read, write)
begin
	
	if rising_edge(reloj) then
	
		if Pcero = '1' then
			waitrequest <= '0';
			readdatavalid <= '0';
			count <= "00";
		end if;
		
		--count sirve para simular el tiempo de servicio de la memoria.
		--Cuando pasan 3 ciclos de reloj, se sirve la transferencia.
		readdatavalid <= '0';
		case count is
			when "00" =>
				if (read = '1' or write = '1') then
					count <= "01";
					waitrequest <= '1';
					read_s <= read;
					write_s <= write;
					byteenable_s <= byteenable;
					address_s <= address(tam_mem_direcc-1 downto 2) & (1 downto 0 => '0');
					writedata_s <= writedata;
						
				else
					waitrequest <= '0';
				end if;
			when "01" =>
				count <= "10";
				write_ram <= write_s;
				read_ram <= read_s;
				address_ram <= address_s;
				writedata_ram <= writedata_s;
				byteenable_ram <= byteenable_s;
			when "10" =>
				count <= "11";
			when "11" =>
				count <= "00";
				waitrequest <= '0';
				readdata <= readdata_ram;
				if read_s = '1' then
					readdatavalid <= '1';
				end if;
			when others =>
		end case;
	end if;
end process;
end;
			
			
