library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

use work.componentesUC.all;

entity ensambladoUC is
	port(
		--reloj, puesta a cero y reset
		reloj, start, reset: in std_logic;					
		Pcero: out std_logic;
		
		--camino
		instr: in st_instr;										
		ig, me, meu: in std_logic;
		bit_0: out std_logic;
		opALU: out st_opALU;
		direccion_mem: in mem_direcc;
		
		--multiplexores
		mdir_sel, mRLDM_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel: out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel;
		
		--permisos de escritura
		peCP, peCPinst, peRI, PBR, peRsec: out std_logic;	
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;							
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--señales para Avalon_MM
		address: in mem_direcc;
		byteenable: out st_byteenable;
		read, write: out std_logic;
		waitrequest: in std_logic;
		readvalid: in std_logic;
		
		--registros mapeados en memoria
		read_csr, write_csr: out std_logic;
		
		--excepciones e interrupciones
		ultimo_ciclo, decodificacion, excep: out std_logic;
		excep_causa: out dato_camino
	);

end ensambladoUC;

architecture compor of ensambladoUC is

signal Pcero_s: std_logic;
signal estado_s: st_estado;
signal excep_s: std_logic;
signal excep_causa_s: dato_camino;

begin
Pcero <= Pcero_s;
excep <= excep_s;
excep_causa <= excep_causa_s;

ae: automata_estado port map(reloj => reloj, start => start, reset => reset, Pcero => Pcero_s, instr => instr,
									  waitrequest => waitrequest, readvalid => readvalid, estado => estado_s, ultimo_ciclo => ultimo_ciclo,
									  decodificacion => decodificacion, excep => excep_s, address => address);

dec: decoder port map(reloj => reloj, Pcero => Pcero_s, estado => estado_s, instr => instr,
							 ig => ig, me => me, meu => meu, peCP => peCP, peCPinst => peCPinst, mdir_sel => mdir_sel,
							 peRI => peRI, mEBR_sel => mEBR_sel, PBR => PBR, mLa_sel => mLa_sel, mLb_sel => mLb_sel, opALU => opALU,
							 mdato_sel => mdato_sel, msec_sel => msec_sel, peRsec => peRsec, address => address, 
							 fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, fmti_tipo => fmti_tipo,
							 bit_0 => bit_0, byteenable => byteenable, read => read, write => write,
							 waitrequest => waitrequest, readvalid => readvalid, mdirsec_sel => mdirsec_sel, direccion_mem => direccion_mem,
							 excep => excep_s, excep_causa => excep_causa_s, read_csr => read_csr, write_csr => write_csr, mRLDM_sel => mRLDM_sel);

end;	
