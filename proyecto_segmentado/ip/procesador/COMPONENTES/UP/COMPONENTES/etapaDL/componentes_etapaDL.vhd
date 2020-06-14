--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_etapaDL is

component BR_y_corto is
port(
	reloj, Pcero: in std_logic;
	IDL1: in reg_direcc;
	IDL2: in reg_direcc;
	IDE: in reg_direcc;
	PE: in std_logic;
	DE: in dato_camino;
	L1: out dato_camino;
	L2: out dato_camino);
end component;

component FMTI is
	port(instr : in  st_instr;
		fmti_tipo: in st_fmti_tipo; 
		s   : out dato_camino);
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

end package componentes_etapaDL;
