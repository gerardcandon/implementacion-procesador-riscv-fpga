--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;

entity testbench is 
generic (semiperiodo: time := 25 ns;
		pasoapaso: boolean:= false);
end entity;

architecture prueba of testbench is

component ensamblado_modelsim is
port (
	reloj: in std_logic;
	reset, start: in std_logic;
	irq: in st_irq;
	parar: out std_logic);
end component;

signal reloj: std_logic;
signal reset: std_logic := '1';
signal start: std_logic := '0';
signal irq: st_irq := "00";
signal parar: std_logic := '0';

begin

ensam: ensamblado_modelsim port map(reloj => reloj, start => start, reset => reset, irq => irq, parar => parar);
process
begin
	wait until rising_edge(reloj);
	wait until rising_edge(reloj);
	reset <= '0';
	
	wait until rising_edge(reloj);
	start <= '1';
	
	wait until rising_edge(reloj);
	start <= '0';
	wait until rising_edge(reloj);
	wait;
end process;

rlj: process
begin
		reloj <= '1';
		wait for semiperiodo;
		reloj <= '0';
		wait for semiperiodo;
		assert parar /= '1' report "Instruccion halt" severity FAILURE;
		assert now < 1000000 ns report "Timeout" severity FAILURE;
	end process;
 
end prueba;

