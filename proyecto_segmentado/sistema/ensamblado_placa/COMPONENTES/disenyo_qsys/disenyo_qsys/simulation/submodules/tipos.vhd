--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use work.constantes.all;

package tipos is



--BR
type tipo_banco is array(0 to num_registros_br-1) of std_logic_vector(tam_dato_camino-1 downto 0);
subtype reg_direcc is std_logic_vector(tam_reg_direcc-1 downto 0);

--camino
subtype st_byte is std_logic_vector(tam_byte-1 downto 0);
subtype st_instr is std_logic_vector(tam_instr-1 downto 0);

--Mem
type tipo_ram is array(0 to num_direcciones-1) of std_logic_vector(tam_byte-1 downto 0);

--Avalon_MM
subtype st_byteenable is std_logic_vector(3 downto 0);




end package tipos;
