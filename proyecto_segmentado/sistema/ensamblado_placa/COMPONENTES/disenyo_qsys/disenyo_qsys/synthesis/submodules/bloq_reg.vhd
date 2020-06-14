library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity bloq_reg is
	port(
		IDL1_DL, IDL2_DL, IDE_A, IDE_M, IDE_F: in reg_direcc;
		val_IDL1, val_IDL2, PBR_A, PBR_M, PBR_F: in std_logic;
		bloq_etapa_DL, inyec_A: out std_logic
	);
end bloq_reg;

architecture compor of bloq_reg is
signal ig_IDL1_A, ig_IDL2_A, ig_IDL1_M, ig_IDL2_M, ig_IDL1_F, ig_IDL2_F,
		 ig_A, ig_M, ig_F: std_logic;
begin

ig_IDL1_A <= '1' when (IDL1_DL = IDE_A) and val_IDL1 = '1' else '0';
ig_IDL2_A <= '1' when (IDL2_DL = IDE_A) and val_IDL2 = '1' else '0';
ig_IDL1_M <= '1' when (IDL1_DL = IDE_M) and val_IDL1 = '1' else '0';
ig_IDL2_M <= '1' when (IDL2_DL = IDE_M) and val_IDL2 = '1' else '0';
ig_IDL1_F <= '1' when (IDL1_DL = IDE_F) and val_IDL1 = '1' else '0';
ig_IDL2_F <= '1' when (IDL2_DL = IDE_F) and val_IDL2 = '1' else '0';

ig_A <= ig_IDL1_A or ig_IDL2_A;
ig_M <= ig_IDL1_M or ig_IDL2_M;
ig_F <= ig_IDL1_F or ig_IDL2_F;

bloq_etapa_DL <= (ig_A and PBR_A) or (ig_M and PBR_M) or (ig_F and PBR_F);
inyec_A       <= (ig_A and PBR_A) or (ig_M and PBR_M) or (ig_F and PBR_F);
end;