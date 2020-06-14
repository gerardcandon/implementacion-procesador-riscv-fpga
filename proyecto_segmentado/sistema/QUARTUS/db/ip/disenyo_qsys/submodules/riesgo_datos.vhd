--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity riesgo_datos is
	port(
		IDL1_DL, IDL2_DL, IDE_A, IDE_M, IDE_F, IDE_ES: in reg_direcc;
		val_IDL1, val_IDL2, PBR_A, PBR_M, PBR_F, PBR_ES: in std_logic;
		bloq_etapa_DL, inyec_A: out std_logic
	);
end riesgo_datos;

architecture compor of riesgo_datos is
signal ig_IDL1_A, ig_IDL2_A, ig_IDL1_M, ig_IDL2_M, ig_IDL1_F, ig_IDL2_F,
		 ig_A, ig_M, ig_F: std_logic;
begin

--Determinamos si el IDL en DL es igual al IDE en alguna etapa
ig_IDL1_A  <= '1' when (IDL1_DL = IDE_A  and PBR_A  = '1')  else '0';
ig_IDL2_A  <= '1' when (IDL2_DL = IDE_A  and PBR_A  = '1')  else '0';
ig_IDL1_M  <= '1' when (IDL1_DL = IDE_M  and PBR_M  = '1')  else '0';
ig_IDL2_M  <= '1' when (IDL2_DL = IDE_M  and PBR_M  = '1')  else '0';
ig_IDL1_F  <= '1' when (IDL1_DL = IDE_F  and PBR_F  = '1')  else '0';
ig_IDL2_F  <= '1' when (IDL2_DL = IDE_F  and PBR_F  = '1')  else '0';


--Miramos en cada etapa si el IDE era igual a un IDL valido
ig_A  <= (ig_IDL1_A  and val_IDL1) or (ig_IDL2_A  and val_IDL2);
ig_M  <= (ig_IDL1_M  and val_IDL1) or (ig_IDL2_M  and val_IDL2);
ig_F  <= (ig_IDL1_F  and val_IDL1) or (ig_IDL2_F  and val_IDL2);

--Miramos si hay riesgo de datos
bloq_etapa_DL <= ig_A or ig_M or ig_F;
inyec_A       <= ig_A or ig_M or ig_F;
end;
