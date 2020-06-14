library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity ensamblado_UC_UP is
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
end ensamblado_UC_UP;

architecture compor of ensamblado_UC_UP is

component ensambladoUC is
	port(
		--reloj, puesta a cero y reset
		reloj, start, reset: in std_logic;					
		Pcero: out std_logic;
		
		--camino
		instr: in st_instr;										
		ig, me, meu: in std_logic;
		bit_0: out std_logic;
		opALU: out st_opALU;
		
		--multiplexores
		mdir_sel, mEBR_sel, mdato_sel, msec_sel, mdirsec_sel: out st_mx2_sel;
		mLa_sel, mLb_sel: out st_mx3_sel;
		
		--permisos de escritura
		peCP, peCPant, peRI, PBR, peRdes: out std_logic;	
		
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
		
		--excepciones e interrupciones
		ultimo_ciclo: out std_logic;
		busqueda_sys: out std_logic
	);

end component;

component ensambladoUP is
	port (
		--reloj y puesta a cero
		reloj, Pcero: in std_logic;
		
		--camino
		instr: out st_instr;
		ig, me, meu: out std_logic;
		bit_0: in std_logic;
		opALU: in st_opALU;
		
		--permisos de escritura
		peCP, peRI, PBR, peRdes, peCPant: in std_logic;
		
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
		cp_e: in dato_camino;
		cp_s: out dato_camino
	);
end component;

component ensambladoUI is
	port(
		--reloj, puesta a cero y reset
		reloj, start, reset, Pcero: in std_logic;
		
		--unidad de control
		ultimo_ciclo: in std_logic;
		busqueda_sys: in std_logic;
		
		--unidad de proceso
		instr: in st_instr;
		mCP_sel: out st_mx2_sel;
		cp_e: out dato_camino;
		cp_s: in dato_camino;
		int_peCP: out std_logic;
		
		--interrupciones
		irq: in st_irq
		
	);
end component;

signal Pcero_s: std_logic;
signal instr: st_instr;
signal address_s: mem_direcc;
signal decoder_peCP, int_peCP: std_logic;
signal peCP, peRI, PBR, peRdes, peCPant: std_logic;
signal mdir_sel, mEBR_sel: st_mx2_sel;
signal mLa_sel, mLb_sel: st_mx3_sel;
signal mdato_sel, msec_sel, mdirsec_sel, mCP_sel: st_mx2_sel;
signal fmti_tipo: st_fmti_tipo;
signal bit_0: std_logic;
signal fmte_tipo: st_fmte_tipo;
signal fmtl_tipo: st_fmtl_tipo;
signal fmtl_ext_sig: st_fmtl_ext_sig;
signal opALU: st_opALU;
signal ig, me, meu: std_logic;
signal cp_e, cp_s: dato_camino;
signal ultimo_ciclo, busqueda_sys: std_logic;


begin

peCP <= decoder_peCP or int_peCP;

UC: ensambladoUC port map (reloj => reloj, start => start, reset => reset, Pcero => Pcero_s, instr => instr, ig => ig, me => me, meu => meu,
								peCP => decoder_peCP, peCPant => peCPant, peRI => peRI, PBR => PBR, peRdes => peRdes, mdir_sel => mdir_sel,
								mEBR_sel => mEBR_sel, mdato_sel => mdato_sel, msec_sel => msec_sel, fmti_tipo => fmti_tipo, mLa_sel => mLa_sel,
								mLb_sel => mLb_sel, opALU => opALU, read => read, write => write, byteenable => byteenable, 
								waitrequest => waitrequest, readvalid => readdatavalid, address => address_s, mdirsec_sel => mdirsec_sel,
								fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, bit_0 => bit_0, ultimo_ciclo => ultimo_ciclo,
								busqueda_sys => busqueda_sys);

UP: ensambladoUP port map (reloj => reloj, Pcero => Pcero_s, instr => instr, ig => ig, me => me, meu => meu,
									peCP => peCP, peCPant => peCPant, peRI => peRI, PBR => PBR, peRdes => peRdes, mdir_sel => mdir_sel,
									mEBR_sel => mEBR_sel, mdato_sel => mdato_sel, msec_sel => msec_sel, fmti_tipo => fmti_tipo, mLa_sel => mLa_sel,
									mLb_sel => mLb_sel, opALU => opALU, readdata => readdata, writedata => writedata, address => address_s,
									fmte_tipo => fmte_tipo, fmtl_tipo => fmtl_tipo, fmtl_ext_sig => fmtl_ext_sig, bit_0 => bit_0,
									cp_e => cp_e, cp_s => cp_s, mdirsec_sel => mdirsec_sel, mCP_sel => mCP_sel);

UI: ensambladoUI port map (reloj => reloj, start => start, reset => reset, Pcero => Pcero_s, ultimo_ciclo => ultimo_ciclo, irq => irq,
									cp_e => cp_e, cp_s => cp_s, mCP_sel => mCP_sel, instr => instr, int_peCP => int_peCP, busqueda_sys => busqueda_sys);

address <= address_s;
Pcero <= Pcero_s;
									
end;
