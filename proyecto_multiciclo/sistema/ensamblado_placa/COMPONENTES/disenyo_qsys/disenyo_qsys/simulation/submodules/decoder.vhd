--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;
use work.retardos.all;
use work.componentes_decoder.all;

entity decoder is
  port (
		reloj, Pcero: in std_logic;
		estado: in st_estado;
		
		--camino
		instr: in st_instr;
		ig, me, meu: in std_logic;
		opALU: out st_opALU;
		bit_0: out std_logic;
		direccion_mem: in mem_direcc;
		
		--permisos de escritura
		peCP, peCPinst, peRI, PBR, peRsec: out std_logic;
		
		--multiplexores
		mdir_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel: out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel;
		
		--formateadores
		fmte_tipo: out st_fmte_tipo;
		fmtl_tipo: out st_fmtl_tipo;
		fmtl_ext_sig: out st_fmtl_ext_sig;
		fmti_tipo: out st_fmti_tipo;
		
		--señales para Avalon_MM
		address: in mem_direcc;
		byteenable: out st_byteenable;
		read: out std_logic;
		write: out std_logic;
		waitrequest: in std_logic;
		readvalid: in std_logic;
		
		--excepciones
		excep: out std_logic;
		excep_causa: out dato_camino;
		excep_SYS: in std_logic;
		modo_csr: in st_modo;
		
		parar: out std_logic
	);
		
end;

architecture compor of decoder is

signal peCP_s: std_logic;
signal peCPinst_s: std_logic;
signal mdir_sel_s: st_mx2_sel;
signal peRI_s: std_logic;
signal mEBR_sel_s: st_mx2_sel;
signal PBR_s: std_logic;
signal fmti_tipo_s: st_fmti_tipo;
signal fmtl_tipo_s: st_fmtl_tipo;
signal fmtl_ext_sig_s: st_fmtl_ext_sig;
signal fmte_tipo_s: st_fmte_tipo;
signal bit_0_s: std_logic;
signal mLa_sel_s: st_mx3_sel;
signal mLb_sel_s: st_mx3_sel;
signal opALU_s: st_opALU;
signal mdato_sel_s, msec_sel_s, mdirsec_sel_s: st_mx2_sel;
signal peRsec_s: std_logic;

--señales para Avalon_MM
signal byteenable_s: st_byteenable;
signal read_s: std_logic;
signal write_s: std_logic;

--interrupciones y excepciones
signal excep_s: std_logic;
signal excep_causa_s: dato_camino;

signal parar_s: std_logic;

begin

camino: decocamino port map (estado => estado, instr => instr, 
							mdir_sel => mdir_sel_s, peRI => peRI_s, mEBR_sel => mEBR_sel_s, PBR => PBR_s,
							mLa_sel => mLa_sel_s, mLb_sel => mLb_sel_s, peRsec => peRsec_s, 
							bit_0 => bit_0_s,	mdato_sel => mdato_sel_s);

ALU: decoopALU port map (estado => estado, instr => instr, opALU => opALU_s);

MEMORIA: decoMem port map (estado => estado, instr => instr, byteenable => byteenable_s, 
									read => read_s, write => write_s, address => address);

SECUEN: decoSec port map (estado => estado, instr => instr, peCP => peCP_s, peCPinst => peCPinst_s, 
								  msec_sel => msec_sel_s, ig => ig, me => me, meu => meu, readvalid => readvalid,
								  mdirsec_sel => mdirsec_sel_s);

FMT: decoFMT port map (reloj => reloj, Pcero => Pcero, estado => estado, address => address, instr => instr, fmte_tipo => fmte_tipo_s, 
							  fmtl_tipo => fmtl_tipo_s, fmtl_ext_sig => fmtl_ext_sig_s, fmti_tipo => fmti_tipo_s);

EXCEPT: decoExcep port map (estado => estado, instr => instr, direccion_mem => direccion_mem, excep => excep_s,
									excep_causa => excep_causa_s, modo_csr => modo_csr, parar => parar_s);

-- Se inhiben los permisos de escritura y las peticiones de escritura
-- cuando se produce una excepcion							
mdir_sel 	 <= mdir_sel_s     after ret_decoder;
PERI 			 <= PERI_s 	 		 after ret_decoder;
mEBR_sel 	 <= mEBR_sel_s 	 after ret_decoder;
fmti_tipo 	 <= fmti_tipo_s 	 after ret_decoder;
fmte_tipo 	 <= fmte_tipo_s 	 after ret_decoder;
fmtl_tipo 	 <= fmtl_tipo_s 	 after ret_decoder;
fmtl_ext_sig <= fmtl_ext_sig_s after ret_decoder;
bit_0 		 <= bit_0_s 		 after ret_decoder;
mLa_sel 		 <= mLa_sel_s 		 after ret_decoder;
mLb_sel 		 <= mLb_sel_s 		 after ret_decoder;
peRsec 		 <= peRsec_s 		 after ret_decoder;
opALU 		 <= opALU_s 		 after ret_decoder;
mdato_sel 	 <= mdato_sel_s 	 after ret_decoder;
msec_sel 	 <= msec_sel_s 	 after ret_decoder;
mdirsec_sel  <= mdirsec_sel_s  after ret_decoder;
byteenable 	 <= byteenable_s 	 after ret_decoder;
excep 	 	 <= excep_s 		 after ret_decoder;
excep_causa  <= excep_causa_s  after ret_decoder;
parar 		 <= parar_s 		 after ret_decoder;
peCP 		    <= peCP_s     and not (excep_s or excep_SYS) after ret_decoder;
peCPinst     <= peCPinst_s and not (excep_s or excep_SYS) after ret_decoder;
PBR 			 <= PBR_s      and not (excep_s or excep_SYS) after ret_decoder;
read 			 <= read_s     and not (excep_s or excep_SYS) after ret_decoder;
write 		 <= write_s    and not (excep_s or excep_SYS) after ret_decoder;



end;

