library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.tipos.all;

--Este componente actua como un sustituto a la memoria sdram de la placa. Solo es usado para poder
--simular el comportamiento del procesador usando Modelsim.

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
--comprobar si se ha de capturar el dato y la direccion al empezar la transferencia.
signal write_s, read_s: std_logic;
signal byteenable_s: st_byteenable;
signal address_s: mem_direcc;

begin
	address_s <= address(tam_mem_direcc-1 downto 2) & (1 downto 0 => '0');
	rlj: process(Pcero, reloj, read, write)
	begin
	
		
		if rising_edge(reloj) then
		
			if Pcero = '1' then
			
			--LOAD
				--lw r1, 4(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00100000";
--				ram(2)  <= "01000000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "11111111";
--				ram(5)  <= "11111111";
--				ram(6)  <= "11111111";
--				ram(7)  <= "11111111";

				--lhu r1, 4(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "01010000";
--				ram(2)  <= "01000000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "11111111";
--				ram(5)  <= "11111111";
--				ram(6)  <= "11111111";
--				ram(7)  <= "11111111";
				
				--lhu r1, 6(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "01010000";
--				ram(2)  <= "01100000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "11111111";
--				ram(5)  <= "11111111";
--				ram(6)  <= "11111111";
--				ram(7)  <= "11111111";
				
				--lh r1, 6(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00010000";
--				ram(2)  <= "01100000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "11111111";
--				ram(5)  <= "11111111";
--				ram(6)  <= "11111111";
--				ram(7)  <= "11111111";

				--SIN EXTENSION DE SIGNO
				--lb r1, 4(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01000000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "00000100";

				--lb r1, 5(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01010000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "00000100";

				--lb r1, 6(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01100000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "00000100";

				--lb r1, 7(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01110000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "00000100";

				--CON EXTENSION DE SIGNO
				--lb r1, 4(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01000000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "10000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "00000100";

				--lb r1, 5(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01010000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "10000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "00000100";

				--lb r1, 6(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01100000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "10000011";
--				ram(7)  <= "00000100";

				--lb r1, 7(r0)
--				ram(0)  <= "10000011";
--				ram(1)  <= "00000000";
--				ram(2)  <= "01110000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00000001";
--				ram(5)  <= "00000010";
--				ram(6)  <= "00000011";
--				ram(7)  <= "10000100";
				
			--LUI
				--lui r1, 0xFFF00
--				ram(0)  <= "10110111";
--				ram(1)  <= "00000000";
--				ram(2)  <= "11110000";
--				ram(3)  <= "11111111";
				
			--AUIPC
				--auipc r1, 0xFFF00
--				ram(0)  <= "10010111";
--				ram(1)  <= "00000000";
--				ram(2)  <= "11110000";
--				ram(3)  <= "11111111";

			--OP cargamos operandos en los registros
				--lui r1, 0x00001
				--lui r2, 0x01000
--				ram(0)  <= "10110111";
--				ram(1)  <= "00010000";
--				ram(2)  <= "00000000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00110111";
--				ram(5)  <= "00000001";
--				ram(6)  <= "00000000";
--				ram(7)  <= "00000001";
				
				--add r1, r1, r2
--				ram(8)  <= "10110011";
--				ram(9)  <= "10000000";
--				ram(10) <= "00100000";
--				ram(11) <= "00000000";

				--sub r3, r1, r2
--				ram(8)  <= "10110011";
--				ram(9)  <= "10000001";
--				ram(10) <= "00100000";
--				ram(11) <= "01000000";
				
				--sub r4, r2, r1
--				ram(12) <= "00110011";
--				ram(13) <= "00000010";
--				ram(14) <= "00010001";
--				ram(15) <= "01000000";

			--BRANCH
				--lui r1, 0x00001
				--lui r2, 0x01000
--				ram(0)  <= "10110111";
--				ram(1)  <= "00010000";
--				ram(2)  <= "00000000";
--				ram(3)  <= "00000000";
--				
--				ram(4)  <= "00110111";
--				ram(5)  <= "00000001";
--				ram(6)  <= "00000000";
--				ram(7)  <= "00000001";
				
				--blt 0x008 r1, r2  # se cumple el salto
--				ram(8)  <= "01100011";
--				ram(9)  <= "11000100";
--				ram(10) <= "00100000";
--				ram(11) <= "00000000";

				--blt 0xFFC r1, r2  # se cumple el salto, -4
--				ram(8)  <= "11100011";
--				ram(9)  <= "11001110";
--				ram(10) <= "00100000";
--				ram(11) <= "11111110";

				--blt 0x008 r2, r1  # no se cumple el salto
--				ram(8)  <= "01100011";
--          ram(9)  <= "01000100";
--				ram(10) <= "00010001";
--				ram(11) <= "00000000";
			
			--JAL
			   --lui r1, 0x00001
				ram(0)  <= "10110111";
				ram(1)  <= "00010000";
				ram(2)  <= "00000000";
				ram(3)  <= "00000000";
				
			   --jal r1, 0x0008
--				ram(4)  <= "11101111";
--				ram(5)  <= "00000000";
--				ram(6)  <= "10000000";
--				ram(7)  <= "00000000";

--SI RD = RS1 NO PASA NADA,PORQUE AUNQUE PRIMERO SE ESCRIBA RSD, EN EL MISMO
--CICLO RS1 YA SE HA CAPTURADO EN L1R, POR LO QUE NO SE PIERDE EL DATO

				--jalr r2, r1, 0x0004 
--				ram(4)  <= "01100111";
--				ram(5)  <= "10000001";
--				ram(6)  <= "01000000";
--				ram(7)  <= "00000000";

				--jalr r1, r1, 0x0005  #testeamos forzar el bit 0 a '0' 
				ram(4)  <= "11100111";
				ram(5)  <= "10000000";
				ram(6)  <= "01010000";
				ram(7)  <= "00000000";
				
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
							ram(to_integer(unsigned(address_s))) <= writedata(7 downto 0);
						end if;
						if byteenable_s(1) = '1' then
							ram(to_integer(unsigned(address_s))+1) <= writedata(15 downto 8);
						end if;
						if byteenable_s(2) = '1' then
							ram(to_integer(unsigned(address_s))+2) <= writedata(23 downto 16);
						end if;
						if byteenable_s(3) = '1' then
							ram(to_integer(unsigned(address_s))+3) <= writedata(31 downto 24);
						end if;
					end if;
				when others =>
			end case;
		end if;
	end process;
end;
			
			