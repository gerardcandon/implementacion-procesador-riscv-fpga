--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;
use work.componentes_etapaA.all;

entity etapaA is
	port(
		reloj, Pcero: in std_logic;
		CP_e, L1, L2, imm_e: in dato_camino;
		opALU: in st_opALU;
		fmte_tipo: in st_fmte_tipo;
		mLa_sel, mLb_sel: in st_mx2_sel;
		bit_0: in std_logic;
		CP_s, alu_s, EDM, imm_s: out dato_camino;
		ig, me, meu: out std_logic;
		bloq_A, inyec_A: in std_logic
	);
end etapaA;

architecture compor of etapaA is
signal RA_CP_s, RA_L1_s, RA_L2_s, RA_imm_s, alu_sal, fb0_s, sum4_s, fmte_s, mLa_s, mLb_s: dato_camino;
signal no_bloq_A: std_logic;
begin
no_bloq_A <= not bloq_A;

RA_CP:    reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => CP_e,        s => RA_CP_s);
RA_L1:    reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => L1,          s => RA_L1_s);
RA_L2:    reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => L2,          s => RA_L2_s);
RA_imm:   reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_A, e => imm_e,       s => RA_imm_s);

sum4: sumador4 port map (e => RA_CP_s, s => sum4_s);
mLa: mux2_32 port map (d0 => RA_L1_s, d1 => RA_CP_s, SEL => mLa_sel, s => mLa_s);
mLb: mux2_32 port map (d0 => RA_L2_s, d1 => RA_imm_s, SEL => mLb_sel, s => mLb_s);
ev: EVAL port map (a => RA_L1_s, b => RA_L2_s, ig => ig, me => me, meu => meu);
al: ALU port map (opALU => opALU, a => mLa_s, b => mLb_s, s => alu_sal);
fb0: fuerza_bit_0 port map (bit_0 => bit_0, dato_e => alu_sal, dato_s => fb0_s);
fmtent: fmte port map (dato_e => RA_L2_s, dato_s => fmte_s, fmte => fmte_tipo);

CP_s    <= sum4_s     after ret_etapaA;
alu_s   <= fb0_s      after ret_etapaA;
EDM     <= fmte_s     after ret_etapaA;
imm_s   <= RA_imm_s   after ret_etapaA;
end;
