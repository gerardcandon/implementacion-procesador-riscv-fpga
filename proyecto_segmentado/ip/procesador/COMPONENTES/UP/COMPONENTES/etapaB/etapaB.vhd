--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;
use work.componentes_etapaB.all;

entity etapaB is
	port(
		reloj, Pcero: in std_logic;
		CP_e: in dato_camino;
		instr_s: out dato_camino;
		readdata_B: in dato_camino;
		read_B, waitrequest_B: in std_logic;
		vaciado_fifo, readvalid_B, bloq_DL: in std_logic;
		val_buff, fifo_llena: out std_logic;
		buff_CP_s: out dato_camino
	);
end etapaB;

architecture compor of etapaB is
signal buff_s, buff_CP: dato_camino;
signal no_bloq_DL: std_logic;
signal fifo_pcero, no_waitrequest_B: std_logic;

begin
no_bloq_DL <= not bloq_DL;
no_waitrequest_B <= not waitrequest_B;

buff: fifo port map (reloj => reloj, Pcero => Pcero, dato_e => readdata_B, val_datos => readvalid_B,
						   dato_s => buff_s, val_s => val_buff, listo_datos => no_bloq_DL,
							val_peticion => read_B, listo_peticion => no_waitrequest_B,
							CP_e => CP_e, CP_s => buff_CP, fifo_llena=> fifo_llena,
							vaciado_fifo => vaciado_fifo);
							
buff_CP_s <= buff_CP after ret_etapaB;
instr_s <= buff_s after ret_etapaB;
end;
