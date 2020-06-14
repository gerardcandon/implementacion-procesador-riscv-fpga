--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ensamblado_placa is
	port (
		CLOCK_50: in std_logic;
		LEDR: out std_logic_vector(2 downto 0);
		KEY: in std_logic_vector(1 downto 0);
		DRAM_DQ : inout std_logic_vector (31 downto 0);
		DRAM_ADDR : OUT std_logic_vector (12 downto 0);
		DRAM_BA : OUT std_logic_vector (1 downto 0);
		DRAM_CAS_N, DRAM_RAS_N, DRAM_CLK : out std_logic;
		DRAM_CKE, DRAM_CS_N, DRAM_WE_N : out std_logic;
		DRAM_DQM : OUT std_logic_vector (3 downto 0);
		SRAM_DQ             : inout std_logic_vector(15 downto 0) := (others => '0'); 
		SRAM_ADDR           : out   std_logic_vector(19 downto 0);                    
		SRAM_LB_N           : out   std_logic;                                        
		SRAM_UB_N           : out   std_logic;                                        
		SRAM_CE_N           : out   std_logic;                                        
		SRAM_OE_N           : out   std_logic;                                        
		SRAM_WE_N           : out   std_logic;                                        
		PS2_KBCLK: inout std_logic;
		PS2_KBDAT: inout std_logic;
		VGA_CLK: out std_logic;
		VGA_HS: out std_logic;
		VGA_VS: out std_logic;
		VGA_BLANK_N: out std_logic;
		VGA_SYNC_N: out std_logic;
		VGA_R: out std_logic_vector(7 downto 0);
		VGA_G: out std_logic_vector(7 downto 0);
		VGA_B: out std_logic_vector(7 downto 0));
end ensamblado_placa;

architecture compor of ensamblado_placa is
	component disenyo_qsys
		port (
			clk_clk          : in    std_logic                     := '0';             --        clk.clk
		reset_reset_n    : in    std_logic                     := '0';             --      reset.reset_n
		sdram_clk_clk    : out   std_logic;                                        --  sdram_clk.clk
		sdram_wire_addr  : out   std_logic_vector(12 downto 0);                    -- sdram_wire.addr
		sdram_wire_ba    : out   std_logic_vector(1 downto 0);                     --           .ba
		sdram_wire_cas_n : out   std_logic;                                        --           .cas_n
		sdram_wire_cke   : out   std_logic;                                        --           .cke
		sdram_wire_cs_n  : out   std_logic;                                        --           .cs_n
		sdram_wire_dq    : inout std_logic_vector(31 downto 0) := (others => '0'); --           .dq
		sdram_wire_dqm   : out   std_logic_vector(3 downto 0);                     --           .dqm
		sdram_wire_ras_n : out   std_logic;                                        --           .ras_n
		sdram_wire_we_n  : out   std_logic;                                         --           .we_n
		sram_DQ             : inout std_logic_vector(15 downto 0) := (others => '0'); --            sram.DQ
		sram_ADDR           : out   std_logic_vector(19 downto 0);                    --                .ADDR
		sram_LB_N           : out   std_logic;                                        --                .LB_N
		sram_UB_N           : out   std_logic;                                        --                .UB_N
		sram_CE_N           : out   std_logic;                                        --                .CE_N
		sram_OE_N           : out   std_logic;                                        --                .OE_N
		sram_WE_N           : out   std_logic;                                        --                .WE_N
		start_bit           : in    std_logic                     := 'X';             -- bit
		ps2_CLK          : inout std_logic                     := 'X';             -- CLK
		ps2_DAT          : inout std_logic                     := 'X';              -- DAT
		vga_CLK             : out   std_logic;                                        --             vga.CLK
		vga_HS              : out   std_logic;                                        --                .HS
		vga_VS              : out   std_logic;                                        --                .VS
		vga_BLANK           : out   std_logic;                                        --                .BLANK
		vga_SYNC            : out   std_logic;                                        --                .SYNC
		vga_R               : out   std_logic_vector(7 downto 0);                     --                .R
		vga_G               : out   std_logic_vector(7 downto 0);                     --                .G
		vga_B               : out   std_logic_vector(7 downto 0)                      --                .B

		);
	end component;
	
signal button: std_logic;
signal vga_BLANK_s, vga_SYNC_s: std_logic;
begin

ensam: disenyo_qsys port map (
		clk_clk => CLOCK_50,
		reset_reset_n => KEY(0),
		start_bit => button,
		sdram_clk_clk => DRAM_CLK,
		sdram_wire_addr => DRAM_ADDR,
		sdram_wire_ba => DRAM_BA,
		sdram_wire_cas_n => DRAM_CAS_N,
		sdram_wire_cke => DRAM_CKE,
		sdram_wire_cs_n => DRAM_CS_N,
		sdram_wire_dq => DRAM_DQ,
		sdram_wire_dqm => DRAM_DQM,
		sdram_wire_ras_n => DRAM_RAS_N,
		sdram_wire_we_n => DRAM_WE_N,
		sram_DQ => SRAM_DQ,
		sram_ADDR => SRAM_ADDR,
		sram_LB_N => SRAM_LB_N,
		sram_UB_N => SRAM_UB_N,
		sram_CE_N => SRAM_CE_N,
		sram_OE_N => SRAM_OE_N,
		sram_WE_N => SRAM_WE_N,
		ps2_CLK => PS2_KBCLK,
		ps2_DAT => PS2_KBDAT,
		vga_CLK => VGA_CLK,
		vga_HS => VGA_HS,
		vga_VS => VGA_VS,
		vga_BLANK => vga_BLANK_s,
		vga_SYNC => vga_SYNC_s,
		vga_R => VGA_R,
		vga_G => VGA_G,
		vga_B => VGA_B);

vga_BLANK_N <= vga_BLANK_s;
vga_SYNC_N <= vga_SYNC_s;
LEDR(0) <= not KEY(0);
LEDR(1) <= not KEY(1);
button <= not KEY(1);


end;
