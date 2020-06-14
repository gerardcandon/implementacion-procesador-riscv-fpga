--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_etapaA is

component sumador4 is
	port(
		e: in dato_camino;
		s: out dato_camino
	);
end component;

component ALU is
    port (opALU : in  st_opALU;
          a	: in  dato_camino;
          b	: in  dato_camino;
          s	: out dato_camino);
end component;

component FMTE is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmte: in st_fmte_tipo);
end component;

component EVAL is
    port (a, b: in  dato_camino;
          ig, me, meu: out std_logic);
end component;

component fuerza_bit_0 is
	port(
		bit_0: in std_logic;
		dato_e: in dato_camino;
		dato_s: out dato_camino
	);
end component;

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

component reg32pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in dato_camino;
         s: out dato_camino);
end component;

component reg5pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in reg_direcc;
         s: out reg_direcc);
end component;

end package componentes_etapaA;
