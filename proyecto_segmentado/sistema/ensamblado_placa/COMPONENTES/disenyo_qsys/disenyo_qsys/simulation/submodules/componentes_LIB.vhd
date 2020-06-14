library ieee;
use ieee.std_logic_1164.all;

use work.tipos.all;
use work.constantes.all;

package componentes_LIB is

component bloq_reg is
	port(
		IDL1_DL, IDL2_DL, IDE_A, IDE_M, IDE_F: in reg_direcc;
		val_IDL1, val_IDL2, PBR_A, PBR_M, PBR_F: in std_logic;
		bloq_etapa_DL, inyec_A: out std_logic
	);
end component;

end package componentes_LIB;
