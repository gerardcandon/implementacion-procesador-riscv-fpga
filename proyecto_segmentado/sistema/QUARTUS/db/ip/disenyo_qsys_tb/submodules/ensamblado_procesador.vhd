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
		Pcero: out std_logic;
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

signal Pcero_s, decoder_peCP, int_peCP, peCP, peRI, PBR, decoder_PBR, peRsec, peCPinst,
		 bit_0, ig, me, meu, ultimo_ciclo, decodificacion, excep, PBR_sys: std_logic;
signal address_s, direccion_mem: mem_direcc;
signal byteenable_s: st_byteenable;
signal mdir_sel, mRLDM_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel, mCP_sel, mESCSR_sel: st_mx2_sel;
signal mLa_sel, mLb_sel: st_mx3_sel;
signal CP_e, CP_s, CPinst_s, readdata_csr, writedata_s, L1, excep_causa, L_CSR: dato_camino;
signal fmti_tipo: st_fmti_tipo;
signal fmte_tipo: st_fmte_tipo;
signal fmtl_tipo: st_fmtl_tipo;
signal fmtl_ext_sig: st_fmtl_ext_sig;
signal opALU: st_opALU;
signal instr: st_instr;

signal read_csr, write_csr: std_logic;


begin

peCP <= decoder_peCP or int_peCP;
direccion_mem <= CP_s(tam_mem_direcc-1 downto 0);
PBR <= decoder_PBR or PBR_sys;

writedata <= writedata_s;
address <= address_s;
byteenable <= byteenable_s;
Pcero <= Pcero_s;

UC: ensambladoUC port map (reloj => reloj, start => start, reset => reset, Pcero => Pcero_s, instr => instr, ig => ig, me => me, meu => meu,
								peCP => decoder_peCP, peCPinst => peCPinst, peRI => peRI, PBR => decoder_PBR, peRsec => peRsec, mdir_sel => mdir_sel,
								mEBR_sel => mEBR_sel, mdato_sel => mdato_sel, msec_sel => msec_sel, fmti_tipo => fmti_tipo, mLa_sel => mLa_sel,
								mLb_sel => mLb_sel, opALU => opALU, read => read, write => write, byteenable => byteenable_s, 
								waitrequest => waitrequest, readvalid => readdatavalid, address => address_s, mdirsec_sel => mdirsec_sel,
								fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, bit_0 => bit_0, ultimo_ciclo => ultimo_ciclo,
								decodificacion => decodificacion, direccion_mem => direccion_mem, excep => excep, excep_causa => excep_causa,
								read_csr => read_csr, write_csr => write_csr, mRLDM_sel => mRLDM_sel);

UP: ensambladoUP port map (reloj => reloj, Pcero => Pcero_s, instr => instr, ig => ig, me => me, meu => meu,
									peCP => peCP, peCPinst => peCPinst, peRI => peRI, PBR => PBR, peRsec => peRsec, mdir_sel => mdir_sel,
									mEBR_sel => mEBR_sel, mdato_sel => mdato_sel, msec_sel => msec_sel, fmti_tipo => fmti_tipo, mLa_sel => mLa_sel,
									mLb_sel => mLb_sel, opALU => opALU, readdata => readdata, writedata => writedata_s, address => address_s,
									fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, bit_0 => bit_0,
									CP_e => CP_e, CP_s => CP_s, CPinst_s => CPinst_s, mdirsec_sel => mdirsec_sel, mCP_sel => mCP_sel, L1 => L1,
									L_CSR => L_CSR, mESCSR_sel => mESCSR_sel, mRLDM_sel => mRLDM_sel, readdata_csr => readdata_csr);

USYS: ensambladoUSYS port map (reloj => reloj, Pcero => Pcero_s, ultimo_ciclo => ultimo_ciclo, irq => irq,
									CP_e => CP_e, CP_s => CP_s, CPinst_s => CPinst_s, mCP_sel => mCP_sel, instr => instr, int_peCP => int_peCP, 
									decodificacion => decodificacion, excep => excep, excep_causa => excep_causa, L1 => L1, L_CSR => L_CSR,
									mESCSR_sel => mESCSR_sel, PBR_sys => PBR_sys, read_csr => read_csr, write_csr => write_csr,
									readdata_csr => readdata_csr, writedata_csr => writedata_s, address => address_s, byteenable_csr => byteenable_s);


									
end;
