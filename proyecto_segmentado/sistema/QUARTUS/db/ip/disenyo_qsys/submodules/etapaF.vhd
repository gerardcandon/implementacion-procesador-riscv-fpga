--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;
use work.componentes_etapaF.all;

entity etapaF is
	port(
		reloj, Pcero: in std_logic;
		CP, alu, LDM, imm: in dato_camino;
		mEBR_sel: in st_mx4_sel;
		fmtl_tipo: in st_fmtl_tipo;
		fmtl_ext_sig: in st_fmtl_ext_sig;
		DE: out dato_camino
	);
end etapaF;

architecture compor of etapaF is
signal RF_CP_s, RF_alu_s, RF_LDM_s, RF_imm_s, FMTL_s, mEBR_s: dato_camino;
begin

RF_CP:  reg32 port map (reloj => reloj, Pcero => Pcero, e => CP,  s => RF_CP_s);
RF_alu: reg32 port map (reloj => reloj, Pcero => Pcero, e => alu, s => RF_alu_s);
RF_LDM: reg32 port map (reloj => reloj, Pcero => Pcero, e => LDM, s => RF_LDM_s);
RF_imm: reg32 port map (reloj => reloj, Pcero => Pcero, e => imm, s => RF_imm_s);

fmtlec: FMTL port map (dato_e => RF_LDM_s, dato_s => FMTL_s, fmtl => fmtl_tipo, ext_sig => fmtl_ext_sig);
mEBR: mux4_32 port map (d0 => RF_CP_s, d1 => RF_alu_s, d2 => FMTL_s, d3 => RF_imm_s, SEL => mEBR_sel, s => mEBR_s);

DE    <= mEBR_s   after ret_etapaF;
end;
