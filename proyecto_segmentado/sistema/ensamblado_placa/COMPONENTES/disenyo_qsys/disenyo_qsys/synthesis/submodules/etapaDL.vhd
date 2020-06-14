--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;
use work.componentes_etapaDL.all;

entity etapaDL is
	port(
		reloj, Pcero: in std_logic;
		instr_e, CP_e, DE: in dato_camino;
		fmti_tipo: in st_fmti_tipo;
		IDE_e: in reg_direcc;
		PBR: in std_logic;
		instr_s, CP_s, L1, L2, imm: out dato_camino;
		IDL1_s, IDL2_s, IDE_s: out reg_direcc;
		bloq_DL, inyec_DL: in std_logic
	);
end etapaDL;

architecture compor of etapaDL is
signal RDL_instr_s, RDL_instr_e, RDL_CP_s, BR_L1, BR_L2, fmti_s: dato_camino;
signal no_bloq_DL: std_logic;
signal IDL1, IDL2, IDE: reg_direcc;
begin
no_bloq_DL <= not bloq_DL;
IDL1 <= RDL_instr_s (19 downto 15);
IDL2 <= RDL_instr_s (24 downto 20);
IDE  <= RDL_instr_s (11 downto 7);

minyec_DL: mux2_32 port map (d0 => instr_e, d1 => (others => '0'), SEL => inyec_DL, s => RDL_instr_e);

RDL_instr: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_DL, e => RDL_instr_e, 
								     s => RDL_instr_s);
RDL_CP:    reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_DL, e => CP_e, s => RDL_CP_s);

BRycorto: BR_y_corto port map (reloj => reloj, IDL1 => IDL1, IDL2 => IDL2, IDE => IDE_e, PE => PBR, DE => DE, 
										 L1 => BR_L1, L2 => BR_L2, Pcero => Pcero);
fmtimm: FMTI port map (instr => RDL_instr_s, fmti_tipo => fmti_tipo, s => fmti_s);

instr_s <= RDL_instr_s after ret_etapaDL;
IDL1_s  <= IDL1        after ret_etapaDL;
IDL2_s  <= IDL2        after ret_etapaDL;
CP_s 	  <= RDL_CP_s    after ret_etapaDL;
L1      <= BR_L1       after ret_etapaDL;
L2      <= BR_L2       after ret_etapaDL;
imm     <= fmti_s      after ret_etapaDL;
IDE_s	  <= IDE         after ret_etapaDL;
end;
