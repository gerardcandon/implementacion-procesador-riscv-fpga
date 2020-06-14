--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity control_cortocircuitos is
	port (
		reloj, Pcero: in std_logic;
		IDL1, IDL2, IDE: in reg_direcc;
		PE: in std_logic;
		mcortoL1_sel, mcortoL2_sel: out st_mx2_sel
	);
end control_cortocircuitos;

architecture compor of control_cortocircuitos is

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

signal IDE_ES: reg_direcc;
signal PE_ES: std_logic;

begin

RES_IDE: reg5 port map(reloj => reloj, Pcero => Pcero, e => IDE, s => IDE_ES);
RES_PE:  reg1 port map(reloj => reloj, Pcero => Pcero, e => PE, s => PE_ES);

mcortoL1_sel <= '1' when (IDE_ES = IDL1) and (IDE_ES /= "00000") and (PE_ES = '1') else '0';
mcortoL2_sel <= '1' when (IDE_ES = IDL2) and (IDE_ES /= "00000") and (PE_ES = '1') else '0';

end;