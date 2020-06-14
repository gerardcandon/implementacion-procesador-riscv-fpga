--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_camino_control is

component regNpe is
	generic(tam: natural := 5);
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in std_logic_vector(tam-1 downto 0);
         s: out std_logic_vector(tam-1 downto 0)
	);
end component;

component regN is
	generic(tam: natural := 5);
	port (reloj, Pcero: in std_logic;
         e: in std_logic_vector(tam-1 downto 0);
         s: out std_logic_vector(tam-1 downto 0)
	);
end component;

component reg32pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in dato_camino;
         s: out dato_camino);
end component;

component reg1pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in std_logic;
         s: out std_logic);
end component;

component reg5 is							
	port (reloj, Pcero: in std_logic;
         e: in reg_direcc;
         s: out reg_direcc);
end component;

component reg1 is							
	port (reloj, Pcero: in std_logic;
         e: in std_logic;
         s: out std_logic);
end component;

component reg5pe is							
	port (reloj, Pcero: in std_logic;
	 pe: in std_logic;		
         e: in reg_direcc;
         s: out reg_direcc);
end component;

component mux2_1 is
   port (d0, d1: in std_logic;
	SEL: in st_mx2_sel;
	s: out std_logic);
end component;

component mux2_4 is
   port (d0, d1: in std_logic_vector(3 downto 0);
	SEL: in st_mx2_sel;
	s: out std_logic_vector(3 downto 0));
end component;

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

end package componentes_camino_control;
