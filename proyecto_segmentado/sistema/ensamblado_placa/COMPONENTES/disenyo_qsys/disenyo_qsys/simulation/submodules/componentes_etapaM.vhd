--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_etapaM is

component reg32 is							
	port (reloj, Pcero: in std_logic;
         e: in dato_camino;
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

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

end package componentes_etapaM;
