library ieee;
use ieee.std_logic_1164.all;
use work.constantes.all;

package retardos is

--BR
constant ret_banco_esc: time := 5 ns;
constant ret_banco_lec: time := 5 ns;

--FMTI
constant ret_FMTI: time := 1 ns;

--ALU
constant ret_alu: time := 4 ns;

--DECODER
constant ret_decoder: time := 4 ns;
constant ret_decoMem: time := 2 ns;
constant ret_estado: time := 1 ns;

--UTILES
constant ret_reg32: time := 1 ns;
constant ret_mux2_32: time := 1 ns;

--SYS
constant ret_gestorEventos: time := 1 ns;
end package retardos;
