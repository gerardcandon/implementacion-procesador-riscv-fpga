--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.constantes.all;
use work.tipos.all;

use work.componentes_camino_SYS.all;

entity camino_SYS is
	port(
		L_CSR, L1, imm: in dato_camino;
		DE_CSR: out dato_camino;
		opCSR: in st_opCSR;
		mALU_CSR_sel: in st_mx2_sel
	);
end camino_SYS;

architecture compor of camino_SYS is
signal mALU_CSR_a: dato_camino;
begin

alucsr: ALU_CSR port map(a => mALU_CSR_a, b => L_CSR, opCSR => opCSR, s => DE_CSR);

mALU_CSR: mux2_32 port map(d0 => L1, d1 => imm, SEL => mALU_CSR_sel, s => mALU_CSR_a);

end;
