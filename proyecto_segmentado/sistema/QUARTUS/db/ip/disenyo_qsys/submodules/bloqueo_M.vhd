--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity bloqueo_M is
	port(
		readvalid, valido, write, read: in std_logic;
		load_en_curso, inyec_F, anula_pet_M: out std_logic
	);
end bloqueo_M;

architecture compor of bloqueo_M is
begin
load_en_curso <= read and valido and not readvalid;
anula_pet_M <= read and valido and not readvalid;
inyec_F <= read and valido and not readvalid;

end;		
