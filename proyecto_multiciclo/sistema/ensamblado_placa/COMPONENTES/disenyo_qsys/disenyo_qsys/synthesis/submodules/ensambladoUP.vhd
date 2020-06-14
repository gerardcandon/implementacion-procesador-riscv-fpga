--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentesUP.all;

entity ensambladoUP is
	port (
		--reloj y puesta a cero
		reloj, Pcero: in std_logic;
		
		--camino
		instr: out st_instr;
		ig, me, meu: out std_logic;
		bit_0: in std_logic;
		opALU: in st_opALU;
		
		--permisos de escritura
		peCP, peRI, PBR, peRsec, peCPinst: in std_logic;
		
		--multiplexores
		mdir_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel, mCP_sel: in st_mx2_sel;
		mLa_sel, mLb_sel: in st_mx3_sel;
		
		--formateadores
		fmti_tipo: in st_fmti_tipo;
		fmte_tipo: in st_fmte_tipo;
		fmtl_tipo: in st_fmtl_tipo;
		fmtl_ext_sig: in st_fmtl_ext_sig;
		
		--señales para AvalonMM
		writedata: out dato_camino;
		readdata: in dato_camino;
		address: out mem_direcc;
		
		--excepciones e interrupciones
		CP_e: in dato_camino;
		CP_s, CPinst_s: out dato_camino;
		
		--camino de sistema
		L1: out dato_camino;
		L_CSR: in dato_camino;
		mESCSR_sel: in st_mx2_sel
	);
end ensambladoUP;

architecture compor of ensambladoUP is

constant cuatro : std_logic_vector := x"00000004";

--mCP
signal mCP_CP: dato_camino;

--CP
signal CP_sal: dato_camino;

--mdirsec
signal mdirsec_mdir: dato_camino;

--mdir
signal mdir_address: dato_camino;

--mdirI
signal mdirI_address: dato_camino;

--RI
signal RI_sal: dato_camino;

--RLDM
signal RLDM_FMTL: dato_camino;

--FMTL
signal fmtl_sal: dato_camino;

--mEBR
signal mEBR_mESCSR: dato_camino;

--mESCSR
signal mESCSR_BR: dato_camino;

--BR
signal BR_L1R, BR_L2R: dato_camino;

--FMTI
signal fmti_sal: dato_camino;

--L1R
signal L1R_sal: dato_camino;

--L2R
signal L2R_sal: dato_camino;

--CPinst
signal CPinst_mLa: dato_camino;

--mLa
signal mLa_alu: dato_camino;

--mLb
signal mLb_alu: dato_camino;

--ALU
signal ALU_sal: dato_camino;

--Rsec
signal Rsec_msec: dato_camino;

--mdato
signal mdato_msec: dato_camino;

--msec
signal msec_sal: dato_camino;

--fuerza_bit_0
signal fuerza_bit_0_CP: dato_camino;

begin

mCP: mux2_32 port map (d0 => fuerza_bit_0_CP, d1 => cp_e, SEL => mCP_sel, s => mCP_CP);

CP: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => peCP, e => mCP_CP, s => CP_sal);

mdirsec: mux2_32 port map (d0 => CP_sal, d1 => fuerza_bit_0_CP, SEL => mdirsec_sel, s => mdirsec_mdir);

mdir: mux2_32 port map (d0 => mdirsec_mdir, d1 => fuerza_bit_0_CP, SEL => mdir_sel, s => mdir_address);

mdirI: mux2_32 port map (d0 => mdir_address, d1 => cp_e, SEL => mCP_sel, s => mdirI_address);

fmtentrada: FMTE port map (dato_e => L2R_sal, dato_s => writedata, fmte => fmte_tipo);

RI: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => peRI, e => readdata, s => RI_sal);

RLDM: reg32 port map (reloj => reloj, Pcero => Pcero, e => readdata, s => RLDM_FMTL);

fmtload: FMTL port map (dato_e => RLDM_FMTL, dato_s => fmtl_sal, fmtl => fmtl_tipo, ext_sig => fmtl_ext_sig);

mEBR: mux2_32 port map (d0 => fmtl_sal, d1 => msec_sal, SEL => mEBR_sel, s => mEBR_mESCSR);

mESCSR: mux2_32 port map (d0 => L_CSR, d1 => mEBR_mESCSR, SEL => mESCSR_sel, s => mESCSR_BR);

bancoR: BR port map (reloj => reloj, IDL1 => RI_sal(19 downto 15), IDL2 => RI_sal(24 downto 20), IDE => RI_sal(11 downto 7), 
							PE => PBR, DE => mESCSR_BR, L1 => BR_L1R, L2 => BR_L2R);

fmtimm: FMTI port map (instr => RI_sal, s => fmti_sal, fmti_tipo => fmti_tipo);

CPinst: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => peCPinst, e => CP_sal, s => CPinst_mLa);

L1R: reg32 port map (reloj => reloj, Pcero => Pcero, e => BR_L1R, s => L1R_sal);

L2R: reg32 port map (reloj => reloj, Pcero => Pcero, e => BR_L2R, s => L2R_sal);

mLa: mux3_32 port map (d0 => CP_sal, d1 => CPinst_mLa, d2 => L1R_sal, SEL => mLa_sel, s => mLa_alu);

mLb: mux3_32 port map (d0 => cuatro, d1 => L2R_sal, d2 => fmti_sal, SEL => mLb_sel, s => mLb_alu);

al: ALU port map (a => mLa_alu, b => mLb_alu, s => ALU_sal, ig => ig, me => me, meu => meu, opALU => opALU, bit_0 => bit_0);

Rsec: reg32pe port map (reloj => reloj, Pcero => Pcero, pe => peRsec, e => ALU_sal, s => Rsec_msec);

mdato: mux2_32 port map (d0 => ALU_sal, d1 => fmti_sal, SEL => mdato_sel, s => mdato_msec);

msec: mux2_32 port map (d0 => Rsec_msec, d1 => mdato_msec, SEL => msec_sel, s => msec_sal);

fb0: fuerza_bit_0 port map(dato_e => msec_sal, dato_s => fuerza_bit_0_CP, bit_0 => bit_0);


--interconexion entre señales:

address <= mdirI_address(tam_mem_direcc-1 downto 0);
instr <= RI_sal;
CP_s <= mdir_address;
CPinst_s <= CPinst_mLa;
L1 <= L1R_sal;
end;
