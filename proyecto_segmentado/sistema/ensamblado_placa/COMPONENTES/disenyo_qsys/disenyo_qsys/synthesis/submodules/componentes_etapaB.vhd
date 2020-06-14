--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_etapaB is

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

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

component fifo is
	port(
		reloj, Pcero: in std_logic;
		vaciado_fifo, val_peticion, listo_peticion, val_datos, listo_datos: in std_logic;
		CP_e, dato_e: in dato_camino;
		CP_s, dato_s: out dato_camino;
		val_s, fifo_llena: out std_logic
	);
end component;

end package componentes_etapaB;
