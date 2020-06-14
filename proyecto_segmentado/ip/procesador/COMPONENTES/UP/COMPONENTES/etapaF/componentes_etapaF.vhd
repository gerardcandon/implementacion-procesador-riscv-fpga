--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_etapaF is

component FMTL is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmtl: in st_fmtl_tipo;
	ext_sig: in st_fmtl_ext_sig);
end component;

component mux4_32 is
   port (d0, d1, d2, d3: in dato_camino;
	SEL: in st_mx4_sel;
	s: out dato_camino);
end component;

component reg32 is							
	port (reloj, Pcero: in std_logic;
         e: in dato_camino;
         s: out dato_camino);
end component;

component reg5pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in reg_direcc;
         s: out reg_direcc);
end component;

end package componentes_etapaF;
