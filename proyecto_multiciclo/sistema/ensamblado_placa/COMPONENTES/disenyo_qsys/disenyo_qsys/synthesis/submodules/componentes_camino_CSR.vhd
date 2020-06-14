library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_camino_CSR is

component ALU_CSR is
	port (
		a, b: in dato_camino;
		opCSR: in st_opCSR;
		s: out dato_camino
	);
end component;

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

end package componentes_camino_CSR;
