--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;
use work.componentes_etapaM.all;

entity etapaM is
	port(
		reloj, Pcero: in std_logic;
		CP_e, alu_e, EDM_e, imm_e, readdata_M: in dato_camino;
		CP_s, alu_s, writedata_M, imm_s, LDM_s: out dato_camino;
		bloq_M: in std_logic
	);
end etapaM;

architecture compor of etapaM is
signal RLDM_s, RM_CP_s, RM_alu_s, RM_EDM_s, RM_imm_s: dato_camino;
signal RM_IDE_s: reg_direcc;
signal no_bloq_M: std_logic;
begin

RM_CP:  reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => CP_e,  s => RM_CP_s);
RM_alu: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => alu_e, s => RM_alu_s);
RM_EDM: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => EDM_e, s => RM_EDM_s);
RM_imm: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => no_bloq_M, e => imm_e, s => RM_imm_s);

no_bloq_M   <= not bloq_M;
CP_s  	   <= RM_CP_s      after ret_etapaM;
alu_s 	   <= RM_alu_s     after ret_etapaM;
writedata_M <= RM_EDM_s     after ret_etapaM;
imm_s 	   <= RM_imm_s     after ret_etapaM;
LDM_s		   <= readdata_M   after ret_etapaM;
end;
