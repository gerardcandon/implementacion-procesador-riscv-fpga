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
		SW: in std_logic_vector(1 downto 0);
		DRAM_DQ : inout std_logic_vector (31 downto 0);
		DRAM_ADDR : OUT std_logic_vector (12 downto 0);
		DRAM_BA : OUT std_logic_vector (1 downto 0);
		DRAM_CAS_N, DRAM_RAS_N, DRAM_CLK : out std_logic;
		DRAM_CKE, DRAM_CS_N, DRAM_WE_N : out std_logic;
		DRAM_DQM : OUT std_logic_vector (3 downto 0));
		
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
		sdram_wire_we_n  : out   std_logic                                       --           .we_n
		);
	end component;
	
signal vga_BLANK_s, vga_SYNC_s: std_logic;
begin

ensam: disenyo_qsys port map (
		clk_clk => CLOCK_50,
		reset_reset_n => SW(0),
		sdram_clk_clk => DRAM_CLK,
		sdram_wire_addr => DRAM_ADDR,
		sdram_wire_ba => DRAM_BA,
		sdram_wire_cas_n => DRAM_CAS_N,
		sdram_wire_cke => DRAM_CKE,
		sdram_wire_cs_n => DRAM_CS_N,
		sdram_wire_dq => DRAM_DQ,
		sdram_wire_dqm => DRAM_DQM,
		sdram_wire_ras_n => DRAM_RAS_N,
		sdram_wire_we_n => DRAM_WE_N);


LEDR(0) <= not SW(0);


end;
