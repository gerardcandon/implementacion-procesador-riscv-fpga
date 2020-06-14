--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity ensamblado_modelsim is
port (
		reloj, reset, start: in std_logic;
		irq: in st_irq;
		parar: out std_logic
	);
end ensamblado_modelsim;

architecture compor of ensamblado_modelsim is

component ensamblado_procesador is
port (
		reloj, start, reset: in std_logic; 			--reloj, puesta a cero y reset
		Pcero: out std_logic;
		address: out mem_direcc;						--avalonMM
		writedata: out dato_camino;
		readdata: in dato_camino;
		read, write: out std_logic;
		byteenable: out st_byteenable;
		waitrequest, readdatavalid: in std_logic;
		irq: in st_irq;										--interrupciones
		parar: out std_logic
	);
end component;

component mem is
port(
	reloj: in std_logic;
	Pcero: in std_logic;
	read: in std_logic;
	write: in std_logic;
	address: in mem_direcc;
	writedata: in dato_camino;
	byteenable: in st_byteenable;
	readdata: out dato_camino;
	waitrequest: out std_logic;
	readdatavalid: out std_logic
	);
end component;

--sufijo _s para no tener el mismo nombre que los puertos de la entida
signal Pcero_s: std_logic;
signal address_s: mem_direcc;
signal writedata_s: dato_camino;
signal readdata_s: dato_camino;
signal read_s, write_s: std_logic;
signal byteenable_s: st_byteenable;
signal waitrequest_s: std_logic;
signal readdatavalid_s: std_logic;

begin

ensam: ensamblado_procesador port map(reloj => reloj, reset => reset, start => start, Pcero => Pcero_s, address => address_s, writedata => writedata_s, readdata => readdata_s,
												  read => read_s, write => write_s, byteenable => byteenable_s, waitrequest => waitrequest_s, readdatavalid => readdatavalid_s, irq => irq, parar => parar);
											
sdram: mem port map (reloj => reloj, Pcero => Pcero_s, address => address_s, writedata => writedata_s, readdata => readdata_s,
							read => read_s, write => write_s, byteenable => byteenable_s, waitrequest => waitrequest_s, readdatavalid => readdatavalid_s);

end;
