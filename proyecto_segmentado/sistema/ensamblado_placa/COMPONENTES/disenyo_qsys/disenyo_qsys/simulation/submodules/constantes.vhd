--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;

package constantes is

--camino de datos
constant tam_dato_camino:  natural := 32;
constant tam_instr:        natural := 32;
constant num_registros_br: natural := 32;
constant tam_reg_direcc:   natural := 5;
subtype dato_camino is     std_logic_vector(tam_dato_camino-1 downto 0);

--Mem
constant tam_byte:          natural := 8;
constant tam_mem_direcc:    natural := 32;
constant num_direcciones:   natural := 2048;
constant tam_st_byteenable: natural := 4;
subtype mem_direcc is     std_logic_vector(tam_mem_direcc-1 downto 0);

--ALU
constant tam_st_opALU : natural := 5;
subtype st_opALU is std_logic_vector(4 downto 0);
constant ALU_NO	: st_opALU := "00000";
constant ALU_ADD  : st_opALU := "10000";
constant ALU_SUB  : st_opALU := "11000";
constant ALU_SLL  : st_opALU := "10001";
constant ALU_SLT  : st_opALU := "10010";
constant ALU_SLTU : st_opALU := "10011";
constant ALU_XOR  : st_opALU := "10100";
constant ALU_SRL  : st_opALU := "10101";
constant ALU_SRA  : st_opALU := "11101";
constant ALU_OR   : st_opALU := "10110";
constant ALU_AND  : st_opALU := "10111";

--FMTI
constant tam_st_fmti_tipo: natural := 3;
subtype st_fmti_tipo is std_logic_vector(2 downto 0);
constant FMTI_I : st_fmti_tipo := "000";
constant FMTI_U : st_fmti_tipo := "001";
constant FMTI_B : st_fmti_tipo := "010";
constant FMTI_J : st_fmti_tipo := "011";
constant FMTI_S : st_fmti_tipo := "100";

--FMTL
constant tam_st_fmtl_tipo: natural := 2;
subtype st_fmtl_tipo is std_logic_vector(1 downto 0);
constant FMTL_desp_0_bytes : st_fmtl_tipo := "00";
constant FMTL_desp_1_bytes : st_fmtl_tipo := "01";
constant FMTL_desp_2_bytes : st_fmtl_tipo := "10";
constant FMTL_desp_3_bytes : st_fmtl_tipo := "11";

constant tam_st_fmtl_ext_sig: natural := 3;
subtype st_fmtl_ext_sig is std_logic_vector(2 downto 0);
constant FMTL_ext_cero_byte_0 : st_fmtl_ext_sig := "000";
constant FMTL_ext_cero_byte_1 : st_fmtl_ext_sig := "001";
constant FMTL_ext_cero_byte_2 : st_fmtl_ext_sig := "010";
constant FMTL_ext_sig_byte_0  : st_fmtl_ext_sig := "100";
constant FMTL_ext_sig_byte_1  : st_fmtl_ext_sig := "101";
constant FMTL_ext_sig_byte_2  : st_fmtl_ext_sig := "110";
constant FMTL_no_ext          : st_fmtl_ext_sig := "111";

--FMTE
constant tam_st_fmte_tipo: natural := 2;
subtype st_fmte_tipo is std_logic_vector(1 downto 0);
constant FMTE_desp_0_bytes : st_fmte_tipo := "00";
constant FMTE_desp_1_bytes : st_fmte_tipo := "01";
constant FMTE_desp_2_bytes : st_fmte_tipo := "10";
constant FMTE_desp_3_bytes : st_fmte_tipo := "11";

--UNIDAD DE CONTROL

--multiplexores
constant tam_st_mx2_sel: natural := 1;
constant tam_st_mx3_sel: natural := 2;
constant tam_st_mx4_sel: natural := 2;

subtype st_mx2_sel is std_logic;
subtype st_mx3_sel is std_logic_vector(tam_st_mx3_sel-1 downto 0);
subtype st_mx4_sel is std_logic_vector(tam_st_mx4_sel-1 downto 0);

--decocamino
constant mLa_L1:	    st_mx2_sel := '0';
constant mLa_CP:		 st_mx2_sel := '1';
constant mLb_L2: 		 st_mx2_sel := '0';
constant mLb_imm:		 st_mx2_sel := '1';
constant mEBR_CP:     st_mx4_sel := "00";
constant mEBR_ALU:	 st_mx4_sel := "01";
constant mEBR_LDM:	 st_mx4_sel := "10";
constant mEBR_imm:	 st_mx4_sel := "11";

--DECODER
constant msec_impl:	 st_mx2_sel := '0';
constant msec_salto:	 st_mx2_sel := '1';

--decoSec
subtype st_funct3 is std_logic_vector(2 downto 0);
constant COND_BEQ:	st_funct3 := "000";
constant COND_BNE:	st_funct3 := "001";
constant COND_BLT:	st_funct3 := "100"; -- enteros
constant COND_BGE:	st_funct3 := "101"; -- enteros
constant COND_BLTU:	st_funct3 := "110"; -- naturales
constant COND_BGEU:	st_funct3 := "111"; -- naturales


--RISC-V INSTRUCTION FIELDS

--coop
subtype st_coop is std_logic_vector (6 downto 0);
constant NOP	 : st_coop := "0000000";
constant LOAD   : st_coop := "0000011";
constant STORE  : st_coop := "0100011";
constant BRANCH : st_coop := "1100011";
constant jalr   : st_coop := "1100111";
constant jal    : st_coop := "1101111";
constant OP_IMM : st_coop := "0010011";
constant OP     : st_coop := "0110011";
constant auipc  : st_coop := "0010111";
constant lui    : st_coop := "0110111";
constant SYSTEM : st_coop := "1110011";
constant halt   : st_coop := "1111111";

--funct3
constant F3_JALR:	   st_funct3 := "000";
constant F3_ADD_SUB:	st_funct3 := "000";    --se distinguen por campo funct7
constant F3_SLL:	   st_funct3 := "001";
constant F3_SLT:	   st_funct3 := "010";
constant F3_SLTU:	   st_funct3 := "011";
constant F3_XOR:	   st_funct3 := "100";
constant F3_SR_LA:	st_funct3 := "101";    --se distinguen por campo funct7
constant F3_OR:		st_funct3 := "110";
constant F3_AND:	   st_funct3 := "111";
constant F3_LDST_B:	st_funct3 := "000";
constant F3_LDST_H:	st_funct3 := "001";
constant F3_LDST_W:	st_funct3 := "010";
constant F3_LD_BU:	st_funct3 := "100";
constant F3_LD_HU:	st_funct3 := "101";


--funct7
subtype st_funct7 is std_logic_vector(6 downto 0);
constant F7_SRAI:  st_funct7 := "0100000";
constant F7_SUB: 	 st_funct7 := "0100000";
constant F7_SRA: 	 st_funct7 := "0100000";
constant F7_RESTO: st_funct7 := "0000000";

end package constantes;
