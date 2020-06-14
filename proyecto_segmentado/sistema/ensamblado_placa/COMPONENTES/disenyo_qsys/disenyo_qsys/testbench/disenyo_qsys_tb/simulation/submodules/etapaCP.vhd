--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;
use work.componentes_etapaCP.all;

entity etapaCP is
	port(
		reloj, Pcero: in std_logic;
		CPsec: in dato_camino;
		msec_sel: in st_mx2_sel;
		bloq_CP: in std_logic;
		
		CP_s, address_B: out dato_camino
	);
end etapaCP;

architecture compor of etapaCP is
signal RCP_s, msec_s, mreset_s, CPmas4, mCP_s: dato_camino;
signal RCP_pe, no_bloq_CP: std_logic;
signal mCP_estado: st_mx2_sel;

begin
no_bloq_CP <= not bloq_CP;

estado: process(reloj)
variable v_mCP_estado: st_mx2_sel;
begin
	if (rising_edge(reloj)) then
		v_mCP_estado := mCP_estado;
		if (Pcero = '1') then
			v_mCP_estado := '0';
		end if;
		if (msec_sel = '1') then
			v_mCP_estado := '1';
		end if;
		if (bloq_CP = '0') then
			v_mCP_estado := '0';
		end if;
	end if;
	mCP_estado <= v_mCP_estado;
end process;

RCP_pe <= ((no_bloq_CP or msec_sel) and (not mCP_estado)) or Pcero;
RCP: reg32pe port map (reloj => reloj, Pcero => '0', e => mreset_s, s => RCP_s, pe => RCP_pe);

mas4: sumador4 port map (e => RCP_s, s => CPmas4);
msec: mux2_32 port map (d0 => CPmas4, d1 => CPsec, SEL => msec_sel, s => msec_s);
mreset: mux2_32 port map (d0 => msec_s, d1 => x"FFFFFFFC", SEL => Pcero, s => mreset_s);
mCPsel: mux2_32 port map (d0 => mreset_s, d1 => RCP_s, SEL => mCP_estado, s => mCP_s);

CP_s <= mCP_s after ret_etapaCP;
address_B <= mCP_s after ret_etapaCP;
end;
