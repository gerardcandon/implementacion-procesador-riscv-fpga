library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentesUP is

--elementos principales

component ALU is
    port (opALU : in  st_opALU;
          a	: in  dato_camino;
          b	: in  dato_camino;
          s	: out dato_camino;
			 bit_0: in std_logic;
			 ig, me, meu: out std_logic);
end component;

component BR is
port(
	reloj: in std_logic;
	IDL1: in reg_direcc;
	IDL2: in reg_direcc;
	IDE: in reg_direcc;
	PE: in std_logic;
	DE: in dato_camino;
	L1: out dato_camino;
	L2: out dato_camino);
end component;

component fuerza_bit_0 is
	port(
		bit_0: in std_logic;
		dato_e: in dato_camino;
		dato_s: out dato_camino
	);
end component;

--formateadores

component FMTI is
	port(instr : in  st_instr;
		fmti_tipo: in st_fmti_tipo; 
		s   : out dato_camino);
end component;

component FMTE is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmte: in st_fmte_tipo);
end component;

component FMTL is
port(
	dato_e: in dato_camino;
	dato_s: out dato_camino;
	fmtl: in st_fmtl_tipo;
	ext_sig: in st_fmtl_ext_sig);
end component;


--multiplexores

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

component mux3_32 is
   port (d0, d1, d2: in dato_camino;
	SEL: in st_mx3_sel;
	s: out dato_camino);
end component;

component mux4_32 is
   port (d0, d1, d2, d3: in dato_camino;
	SEL: in st_mx4_sel;
	s: out dato_camino);
end component;

--registros

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

end package componentesUP;
