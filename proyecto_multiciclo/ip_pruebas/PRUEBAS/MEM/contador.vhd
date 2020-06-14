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

--Este componente actua como un sustituto a la memoria sdram de la placa. Solo es usado para poder
--simular el comportamiento del procesador usando Modelsim.

--Para ejecutar un caso de prueba se ha de sustituir el subdirectorio que sigue a "tests" del fichero a abrir
--en el procedimiento readFile por uno de los siguientes:

--test_lui
--test_auipc
--test_OP
--test_LOAD
--test_STORE
--test_BRANCH
--test_jal
--test_jalr
--test_SYSTEM
--test_mret
--test_instrIlegal
--test_instrPrivilegida
--test_instrProtegida
--test_saltoNoAlineado
--test_loadFueraDeRango
--test_loadProtegido
--test_storeFueraDeRango
--test_storeProtegido
--test_memoryMappedRegister


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

signal ram: tipo_ram := (others => (others => '0'));
signal count: std_logic_vector(1 downto 0) := "00";
signal write_s, read_s: std_logic;
signal byteenable_s: st_byteenable;
signal address_s: mem_direcc;
signal writedata_s: dato_camino;

procedure readFile (signal ram :out tipo_ram) is
        -- Open File in Read Mode
        file romfile   :text open read_mode is
			"../../../PRUEBAS/testbench/tests/test_instrIlegal/mem.hex";
        variable lbuf  :line;
        variable i     :integer := 0;
        variable fdata :st_byte;
    begin
        while i < num_direcciones and (not endfile(romfile)) loop
            -- read data from input file
            readline(romfile, lbuf);
            hread(lbuf, fdata);
            ram(i) <= fdata(7 downto 0);
            i := i+1;
        end loop;
    end procedure;

begin
	rlj: process(Pcero, reloj, read, write)
	begin
	
		
		if rising_edge(reloj) then
		
			if Pcero = '1' then
				readFile(ram);
			end if;
			
			--count sirve para simular el tiempo de servicio de la memoria.
			--Cuando pasan 3 ciclos de reloj, se sirve la transferencia.
			readdatavalid <= '0';
			readdata <= (others => '0');
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
				when "10" =>
					count <= "11";
				when "11" =>
					count <= "00";
					waitrequest <= '0';
					if read_s = '1' then
						if byteenable_s(0) = '1' then
							readdata(7 downto 0) <= ram(to_integer(unsigned(address_s)));
						end if;
						if byteenable_s(1) = '1' then
							readdata(15 downto 8) <= ram(to_integer(unsigned(address_s))+1);
						end if;
						if byteenable_s(2) = '1' then
							readdata(23 downto 16) <= ram(to_integer(unsigned(address_s))+2);
						end if;
						if byteenable_s(3) = '1' then
							readdata(31 downto 24) <= ram(to_integer(unsigned(address_S))+3);
						end if;
						readdatavalid <= '1';
						
					elsif write_s = '1' then
						if byteenable_s(0) = '1' then
							ram(to_integer(unsigned(address_s))) <= writedata_s(7 downto 0);
						end if;
						if byteenable_s(1) = '1' then
							ram(to_integer(unsigned(address_s))+1) <= writedata_s(15 downto 8);
						end if;
						if byteenable_s(2) = '1' then
							ram(to_integer(unsigned(address_s))+2) <= writedata_s(23 downto 16);
						end if;
						if byteenable_s(3) = '1' then
							ram(to_integer(unsigned(address_s))+3) <= writedata_s(31 downto 24);
						end if;
					end if;
				when others =>
			end case;
		end if;
	end process;
end;
			
			
