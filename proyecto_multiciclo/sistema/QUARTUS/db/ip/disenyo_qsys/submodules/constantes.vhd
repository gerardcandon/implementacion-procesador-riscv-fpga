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
constant tam_byte:        natural := 8;
constant tam_mem_direcc:  natural := 32;
constant num_direcciones: natural := 2048;
subtype mem_direcc is     std_logic_vector(tam_mem_direcc-1 downto 0);

--espacio de direcciones
constant sdram_usr_addr_begin:      mem_direcc := x"00000000";
constant sdram_usr_addr_end:        mem_direcc := x"03ffffff";
constant sdram_sys_addr_begin:      mem_direcc := x"04000000";
constant sdram_sys_addr_end:        mem_direcc := x"07ffffff";
constant ps2_controller_addr_begin: mem_direcc := x"08000000";
constant ps2_controller_addr_end:   mem_direcc := x"08000007";
constant dma_controller_addr_begin: mem_direcc := x"08000010";
constant dma_controller_addr_end:   mem_direcc := x"0800001f";
constant sram_addr_begin:           mem_direcc := x"08200000";
constant sram_addr_end:             mem_direcc := x"083fffff";
constant csr_addr_begin:            mem_direcc := x"09000000";
constant csr_addr_end:              mem_direcc := x"0900000f";

--ALU
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
subtype st_fmti_tipo is std_logic_vector(2 downto 0);
constant FMTI_I : st_fmti_tipo := "000";
constant FMTI_U : st_fmti_tipo := "001";
constant FMTI_B : st_fmti_tipo := "010";
constant FMTI_J : st_fmti_tipo := "011";
constant FMTI_S : st_fmti_tipo := "100";

--FMTL

subtype st_fmtl_tipo is std_logic_vector(1 downto 0);
constant FMTL_desp_0_bytes : st_fmtl_tipo := "00";
constant FMTL_desp_1_bytes : st_fmtl_tipo := "01";
constant FMTL_desp_2_bytes : st_fmtl_tipo := "10";
constant FMTL_desp_3_bytes : st_fmtl_tipo := "11";

subtype st_fmtl_ext_sig is std_logic_vector(2 downto 0);
constant FMTL_ext_cero_byte_0 : st_fmtl_ext_sig := "000";
constant FMTL_ext_cero_byte_1 : st_fmtl_ext_sig := "001";
constant FMTL_ext_cero_byte_2 : st_fmtl_ext_sig := "010";
constant FMTL_ext_sig_byte_0  : st_fmtl_ext_sig := "100";
constant FMTL_ext_sig_byte_1  : st_fmtl_ext_sig := "101";
constant FMTL_ext_sig_byte_2  : st_fmtl_ext_sig := "110";
constant FMTL_no_ext          : st_fmtl_ext_sig := "111";

--FMTE

subtype st_fmte_tipo is std_logic_vector(1 downto 0);
constant FMTE_desp_0_bytes : st_fmte_tipo := "00";
constant FMTE_desp_1_bytes : st_fmte_tipo := "01";
constant FMTE_desp_2_bytes : st_fmte_tipo := "10";
constant FMTE_desp_3_bytes : st_fmte_tipo := "11";

--UNIDAD DE CONTROL

--multiplexores
subtype st_mx2_sel is std_logic;
subtype st_mx3_sel is std_logic_vector(1 downto 0);
subtype st_mx4_sel is std_logic_vector(1 downto 0);

--decocamino
constant mdir_CP: 	 st_mx2_sel := '0';
constant mdir_camino: st_mx2_sel := '1';
constant mEBR_mem: 	 st_mx2_sel := '0';
constant mEBR_camino: st_mx2_sel := '1';
constant mdato_ALU:   st_mx2_sel := '0';
constant mdato_imm:   st_mx2_sel := '1';
constant mLa_CP:      st_mx3_sel := "00";
constant mLa_CPinst:  st_mx3_sel := "01";
constant mLa_L1: 		 st_mx3_sel := "10";
constant mLb_4: 		 st_mx3_sel := "00";
constant mLb_L2: 		 st_mx3_sel := "01";
constant mLb_Fmt: 	 st_mx3_sel := "10";

--decoSec
constant msec_Rsec:     st_mx2_sel := '0';
constant msec_mdato:    st_mx2_sel := '1';
constant mdirsec_CP:    st_mx2_sel := '0';
constant mdirsec_salto: st_mx2_sel := '1';

--DECODER

type st_estado is(
RESTART     ,
INI	      ,
ESPERA      ,
FETCH       ,
DECODE      ,
OP_ALU      ,
OP_IMM_ALU  ,
LOAD_DIR    ,
LOAD_LD     ,
LOAD_FMT    ,
STORE_DIR   ,
STORE_ST    ,
LUI_FMT     ,
AUIPC_ALU   ,
BRANCH_EVAL ,
JAL_RD      ,
JAL_CP	   ,
JALR_RD     ,
JALR_CP     ,
SYS	      ,
PARAR        );

type st_estadoSYS is(
RESTART	,
ESPERA	,
DECODE	,
MRET	   ,
CSRRW	   ,
CSRRS	   ,
CSRRC	   ,
CSRRWI	,
CSRRSI	,
CSRRCI	);

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
constant F3_PRIV:	   st_funct3 := "000";
constant F3_LDST_B:	st_funct3 := "000";
constant F3_LDST_H:	st_funct3 := "001";
constant F3_LDST_W:	st_funct3 := "010";
constant F3_LD_BU:	st_funct3 := "100";
constant F3_LD_HU:	st_funct3 := "101";
constant F3_CSRRW:	st_funct3 := "001";
constant F3_CSRRS:	st_funct3 := "010";
constant F3_CSRRC:	st_funct3 := "011";
constant F3_CSRRWI:	st_funct3 := "101";
constant F3_CSRRSI:	st_funct3 := "110";
constant F3_CSRRCI:	st_funct3 := "111";


--funct7
subtype st_funct7 is std_logic_vector(6 downto 0);
constant F7_SRAI:  st_funct7 := "0100000";
constant F7_SUB: 	 st_funct7 := "0100000";
constant F7_SRA: 	 st_funct7 := "0100000";
constant F7_RESTO: st_funct7 := "0000000";

--funct12
subtype st_funct12 is std_logic_vector(11 downto 0);
constant F12_MRET:  st_funct12 := "001100000010";
constant F12_ECALL: st_funct12 := "000000000000";


--BR_CSR
constant tam_csr: 		 natural := 32;
constant tam_csr_64: 	 natural := 64;
constant tam_csr_direcc: natural := 12;

constant ID_mstatus: dato_camino := x"00000300";
constant ID_mie:     dato_camino := x"00000304";
constant ID_mtvec:   dato_camino := x"00000305";
constant ID_mscratch:dato_camino := x"00000340";
constant ID_mepc:    dato_camino := x"00000341";
constant ID_mcause:  dato_camino := x"00000342";
constant ID_mtval:	dato_camino := x"00000343";
constant ID_mip:     dato_camino := x"00000344";

--Registros mapeados en memoria
constant DIR_mtimel:    mem_direcc := x"09000000";
constant DIR_mtimeh:	   mem_direcc := x"09000004";
constant DIR_mtimecmpl: mem_direcc := x"09000008";
constant DIR_mtimecmph: mem_direcc := x"0900000c";

--mstatus
constant bUIE:  natural := 0;	
constant bMIE:  natural := 3;
constant bUPIE: natural := 4;
constant bMPIE: natural := 7;
constant bMPP0: natural := 11;
constant bMPP1: natural := 12;

--mie
constant bMTIE: natural := 7;
constant bMEIE: natural := 11;

--mip
constant bMTIP: natural := 7;
constant bMEIP: natural := 11;

--modo_csr
subtype st_modo is std_logic_vector(1 downto 0);
constant modo_M: st_modo := "11";
constant modo_U: st_modo := "00";

--mcause
constant causa_no		 		: dato_camino := x"00000000";
--causas interrupciones (bit de mayor peso = 1)
constant causa_int_PS2	 	 		: dato_camino := x"80000001";
constant causa_int_clk		 		: dato_camino := x"80000002";
--causas excepciones (bit de mayor peso = 0)
constant causa_instrIlegal       : dato_camino := x"00000001";
constant causa_instrNoAlineada   : dato_camino := x"00000002";
constant causa_instrFueraDeRango : dato_camino := x"00000003";
constant causa_instrProtegida    : dato_camino := x"00000004";
constant causa_instrPrivilegiada : dato_camino := x"00000005";
constant causa_loadNoAlineado    : dato_camino := x"00000006";
constant causa_loadFueraDeRango  : dato_camino := x"00000007";
constant causa_loadProtegido     : dato_camino := x"00000008";
constant causa_storeNoAlineado   : dato_camino := x"00000009";
constant causa_storeFueraDeRango : dato_camino := x"0000000A";
constant causa_storeProtegido    : dato_camino := x"0000000B";
constant causa_syscall			   : dato_camino := x"0000000C";

--interrupciones
constant tam_irq: natural := 2;
constant IRQ_CLK: natural := 1;
constant IRQ_PS2: natural := 0;

--camino sistema
constant mESCSR_L_CSR:   st_mx2_sel := '0';
constant mESCSR_mEBR:    st_mx2_sel := '1';
constant mALU_CSR_L_CSR: st_mx2_sel := '0';
constant mALU_CSR_imm:   st_mx2_sel := '1';

--decocamSYS
constant mCP_no_int: st_mx2_sel := '0';
constant mCP_int:    st_mx2_sel := '1';

--ALU_CSR
type st_opCSR is(
ALU_W,
ALU_S,
ALU_C);

end package constantes;
