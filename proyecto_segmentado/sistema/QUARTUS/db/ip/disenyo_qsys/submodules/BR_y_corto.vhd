--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity BR_y_corto is
port(
	reloj, Pcero: in std_logic;
	IDL1: in reg_direcc;
	IDL2: in reg_direcc;
	IDE: in reg_direcc;
	PE: in std_logic;
	DE: in dato_camino;
	L1: out dato_camino;
	L2: out dato_camino);
end BR_y_corto;

architecture compor of BR_y_corto is

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

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

component reg32 is							
	port (reloj, Pcero: in std_logic;
         e: in dato_camino;
         s: out dato_camino);
end component;

component control_cortocircuitos is
	port (
		reloj, Pcero: in std_logic;
		IDL1, IDL2, IDE: in reg_direcc;
		PE: in std_logic;
		mcortoL1_sel, mcortoL2_sel: out st_mx2_sel
	);
end component;

signal BR_L1, BR_L2, RDE_s: dato_camino;
signal mcortoL1_sel, mcortoL2_sel: st_mx2_sel;
begin

contCorto: control_cortocircuitos port map (reloj => reloj, Pcero => Pcero, IDL1 => IDL1, IDL2 => IDL2, 
														  IDE => IDE, PE => PE, mcortoL1_sel => mcortoL1_sel, 
														  mcortoL2_sel => mcortoL2_sel);

BancoR: BR port map (reloj => reloj, IDL1 => IDL1, IDL2 => IDL2, IDE => IDE, PE => PE, DE => DE, 
							L1 => BR_L1, L2 => BR_L2);
					
RDE: reg32 port map (reloj => reloj, Pcero => Pcero, e => DE, s => RDE_s);		
mcortoL1: mux2_32 port map (d0 => BR_L1, d1 => RDE_s, SEL => mcortoL1_sel, s => L1);
mcortoL2: mux2_32 port map (d0 => BR_L2, d1 => RDE_s, SEL => mcortoL2_sel, s => L2);

end;
