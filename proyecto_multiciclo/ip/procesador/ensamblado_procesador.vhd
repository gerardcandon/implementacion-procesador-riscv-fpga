--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentes_procesador.all;

entity ensamblado_procesador is
port (
		reloj, start, reset: in std_logic; 			--reloj, puesta a cero y reset
		Pcero, parar: out std_logic;
		address: out mem_direcc;						--avalonMM
		writedata: out dato_camino;
		readdata: in dato_camino;
		read, write: out std_logic;
		byteenable: out st_byteenable;
		waitrequest, readdatavalid: in std_logic;
		irq: in st_irq										--interrupciones
	);
end ensamblado_procesador;

architecture compor of ensamblado_procesador is

signal Pcero_s, decoder_peCP, peCP_sys, peCP, peRI, PBR, decoder_PBR, peRsec, peCPinst,
		 bit_0, ig, me, meu, ultimo_ciclo, decodificacion, excep, PBR_sys: std_logic;
signal address_s, direccion_mem: mem_direcc;
signal byteenable_s: st_byteenable;
signal mdir_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel, mCP_sel, mESCSR_sel: st_mx2_sel;
signal mLa_sel, mLb_sel: st_mx3_sel;
signal CP_e, CP_s, CPinst_s, readdata_csr, writedata_s, L1, excep_causa, L_CSR: dato_camino;
signal fmti_tipo: st_fmti_tipo;
signal fmte_tipo: st_fmte_tipo;
signal fmtl_tipo: st_fmtl_tipo;
signal fmtl_ext_sig: st_fmtl_ext_sig;
signal opALU: st_opALU;
signal instr: st_instr;
signal modo_csr: st_modo;
signal excep_SYS: std_logic;


begin

peCP <= decoder_peCP or peCP_sys;
PBR <= decoder_PBR or PBR_sys;
direccion_mem <= CP_s(tam_mem_direcc-1 downto 0);


writedata <= writedata_s;
address <= address_s;
byteenable <= byteenable_s;
Pcero <= Pcero_s;

UC: ensambladoUC port map (reloj => reloj, start => start, reset => reset, Pcero => Pcero_s, instr => instr, 
									ig => ig, me => me, meu => meu, bit_0 => bit_0, opALU => opALU, 
									direccion_mem => direccion_mem, mdir_sel => mdir_sel,
									mEBR_sel => mEBR_sel, mdato_sel => mdato_sel, msec_sel => msec_sel, 
									mdirsec_sel => mdirsec_sel, mLa_sel => mLa_sel, mLb_sel => mLb_sel, peCP => decoder_peCP,
									peCPinst => peCPinst, peRI => peRI, PBR => decoder_PBR, peRsec => peRsec, 
									fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, 
									fmti_tipo => fmti_tipo, address => address_s, byteenable => byteenable_s, read => read,
									write => write, waitrequest => waitrequest, readvalid => readdatavalid, 
									ultimo_ciclo => ultimo_ciclo, decodificacion => decodificacion, excep => excep, 
									excep_causa => excep_causa, excep_SYS => excep_SYS, modo_csr => modo_csr, parar => parar);
		
UP: ensambladoUP port map (reloj => reloj, Pcero => Pcero_s, instr => instr, ig => ig, me => me, meu => meu,
									bit_0 => bit_0, opALU => opALU, peCP => peCP, peRI => peRI, PBR => PBR, peRsec => peRsec,
									peCPinst => peCPinst, mdir_sel => mdir_sel, mEBR_sel => mEBR_sel,
									mdato_sel => mdato_sel, msec_sel => msec_sel, mdirsec_sel => mdirsec_sel,
									mCP_sel => mCP_sel, mLa_sel => mLa_sel, mLb_sel => mLb_sel, fmti_tipo => fmti_tipo,
									fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig,
									writedata => writedata_s, readdata => readdata, address => address_s,
									CP_e => CP_e, CP_s => CP_s, CPinst_s => CPinst_s, L1 => L1,
									L_CSR => L_CSR, mESCSR_sel => mESCSR_sel);
									
USYS: ensambladoUSYS port map (reloj => reloj, Pcero => Pcero_s, ultimo_ciclo => ultimo_ciclo,
								   decodificacion => decodificacion, modo_csr => modo_csr, instr => instr, 
									address => direccion_mem, mCP_sel => mCP_sel,
									mESCSR_sel => mESCSR_sel, CP_e => CP_e, L_CSR => L_CSR, CP_s => CP_s, CPinst_s => CPinst_s,
									L1 => L1, peCP_sys => peCP_sys, PBR_sys => PBR_sys, irq => irq, excep => excep,
									excep_SYS => excep_SYS, excep_causa => excep_causa);
									
end;
