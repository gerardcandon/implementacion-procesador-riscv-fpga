library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

use work.tipos.all;
use work.constantes.all;

entity vaciado_segmentacion is 
  port (
		busqueda_en_curso, secuenciamiento: in std_logic;
		bloq_etapa_A, inyec_M, vaciado_segm: out std_logic
	);
end vaciado_segmentacion;

architecture comportamiento of vaciado_segmentacion is
begin

decoSecu:	process(secuenciamiento, busqueda_en_curso)
variable v_bloq_etapa_A, v_inyec_M, v_vaciado_segm: std_logic;

begin

	v_bloq_etapa_A := '0';
	v_inyec_M		:= '0';
	v_vaciado_segm := '0';

	if (secuenciamiento = '1') then
		--hemos de saltar
		if (busqueda_en_curso = '1') then
			--la busqueda esta esperando un dato, bloqueamos y esperamos
			v_bloq_etapa_A := '1';
			v_inyec_M := '1';
		else
			--vaciamos segmentacion
			v_vaciado_segm := '1';
		end if;
	end if;
	
	bloq_etapa_A <= v_bloq_etapa_A;
	inyec_M  <= v_inyec_M;
	vaciado_segm <= v_vaciado_segm;
	
end process;

end;


