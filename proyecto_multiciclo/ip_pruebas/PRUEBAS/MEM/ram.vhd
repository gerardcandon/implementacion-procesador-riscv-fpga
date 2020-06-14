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
--test_saltoNoAlineado
--test_loadFueraDeRango
--test_loadNoAlineado
--test_storeFueraDeRango
--test_storeNoAlineado
--test_syscall


entity ram is
port (
	reloj: in std_logic;
	Pcero: in std_logic;
	write, read: in std_logic;
	address: in mem_direcc;
	writedata: in dato_camino;
	byteenable: in st_byteenable;
	readdata: out dato_camino
	);
end ram;

architecture compor of ram is

signal memoria: tipo_ram;

procedure readFile (signal memoria :out tipo_ram) is
        -- Open File in Read Mode
        file romfile   :text open read_mode is
			"../../../PRUEBAS/tests/test_saltoNoAlineado/mem.hex";
        variable lbuf  :line;
        variable i     :integer := 0;
        variable fdata :st_byte;
    begin
        while i < num_direcciones and (not endfile(romfile)) loop
            -- read data from input file
            readline(romfile, lbuf);
            hread(lbuf, fdata);
            memoria(i) <= fdata;

            i := i+1;
        end loop;
    end procedure;

begin
	rlj: process(reloj)
	begin
			
		if rising_edge(reloj) then
	
			if Pcero = '1' then
				readFile(memoria);
			end if;
			
			if write = '1' then
				if (byteenable(0) = '1') then
					memoria(to_integer(unsigned(address))) <= writedata(7 downto 0);
				end if;
				if (byteenable(1) = '1') then
					memoria(to_integer(unsigned(address+1))) <= writedata(15 downto 8);
				end if;
				if (byteenable(2) = '1') then
					memoria(to_integer(unsigned(address+2))) <= writedata(23 downto 16);
				end if;
				if (byteenable(3) = '1') then
					memoria(to_integer(unsigned(address+3))) <= writedata(31 downto 24);
				end if;
			end if;
			
			if read = '1' then
				if (byteenable(0) = '1') then
					readdata(7 downto 0) <= memoria(to_integer(unsigned(address)));
				end if;
				if (byteenable(1) = '1') then
					readdata(15 downto 8) <= memoria(to_integer(unsigned(address+1)));
				end if;
				if (byteenable(2) = '1') then
					readdata(23 downto 16) <= memoria(to_integer(unsigned(address+2)));
				end if;
				if (byteenable(3) = '1') then
					readdata(31 downto 24) <= memoria(to_integer(unsigned(address+3)));
				end if;
			end if;
		end if;
	end process;
end;
			
			
