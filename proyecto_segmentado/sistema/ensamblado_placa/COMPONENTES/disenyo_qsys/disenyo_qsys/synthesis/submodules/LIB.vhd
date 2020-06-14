--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity LIB is
	port(
		bloq_etapa_CP, bloq_etapa_DL, bloq_etapa_A, bloq_etapa_M: in std_logic;
		bloq_CP, bloq_DL, bloq_A, bloq_M: out std_logic;
		val_DL, val_A, val_M: in std_logic
	);
end LIB;

architecture compor of LIB is
signal s_bloq_CP, s_bloq_DL, s_bloq_A, s_bloq_M, s_bloq_F: std_logic; 
begin
	
	s_bloq_CP <= bloq_etapa_CP;
	--El bloqueo de la etapa B se gestiona en la fifo
	--Si las etapas no tienen datos valido absorben el bloqueo
	s_bloq_DL <= (s_bloq_A  or bloq_etapa_DL) and val_DL;
	s_bloq_A  <= (s_bloq_M  or bloq_etapa_A)  and val_A;
	s_bloq_M  <= bloq_etapa_M and val_M;
	
	bloq_CP <= s_bloq_CP;
	bloq_DL <= s_bloq_DL;
	bloq_A  <= s_bloq_A;
	bloq_M  <= s_bloq_M;
	
end;
