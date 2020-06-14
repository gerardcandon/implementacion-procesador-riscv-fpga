-- disenyo_qsys_video_pll_0.vhd

-- This file was auto-generated from altera_up_avalon_video_pll_hw.tcl.  If you edit it your changes
-- will probably be lost.
-- 
-- Generated using ACDS version 19.1 670

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity disenyo_qsys_video_pll_0 is
	port (
		ref_clk_clk        : in  std_logic := '0'; --      ref_clk.clk
		ref_reset_reset    : in  std_logic := '0'; --    ref_reset.reset
		vga_clk_clk        : out std_logic;        --      vga_clk.clk
		reset_source_reset : out std_logic         -- reset_source.reset
	);
end entity disenyo_qsys_video_pll_0;

architecture rtl of disenyo_qsys_video_pll_0 is
	component altera_up_altpll is
		generic (
			OUTCLK0_MULT  : integer := 1;
			OUTCLK0_DIV   : integer := 1;
			OUTCLK1_MULT  : integer := 1;
			OUTCLK1_DIV   : integer := 1;
			OUTCLK2_MULT  : integer := 1;
			OUTCLK2_DIV   : integer := 1;
			PHASE_SHIFT   : integer := 0;
			DEVICE_FAMILY : string  := "Cyclone IV"
		);
		port (
			refclk  : in  std_logic := 'X'; -- clk
			reset   : in  std_logic := 'X'; -- reset
			locked  : out std_logic;        -- export
			outclk0 : out std_logic;        -- clk
			outclk1 : out std_logic;        -- clk
			outclk2 : out std_logic         -- clk
		);
	end component altera_up_altpll;

	component altera_up_avalon_reset_from_locked_signal is
		port (
			reset  : out std_logic;        -- reset
			locked : in  std_logic := 'X'  -- export
		);
	end component altera_up_avalon_reset_from_locked_signal;

	signal video_pll_locked_export : std_logic; -- video_pll:locked -> reset_from_locked:locked

begin

	video_pll : component altera_up_altpll
		generic map (
			OUTCLK0_MULT  => 1,
			OUTCLK0_DIV   => 2,
			OUTCLK1_MULT  => 1,
			OUTCLK1_DIV   => 2,
			OUTCLK2_MULT  => 2,
			OUTCLK2_DIV   => 3,
			PHASE_SHIFT   => 0,
			DEVICE_FAMILY => "Cyclone IV"
		)
		port map (
			refclk  => ref_clk_clk,             --  refclk.clk
			reset   => ref_reset_reset,         --   reset.reset
			locked  => video_pll_locked_export, --  locked.export
			outclk0 => open,                    -- outclk0.clk
			outclk1 => vga_clk_clk,             -- outclk1.clk
			outclk2 => open                     -- outclk2.clk
		);

	reset_from_locked : component altera_up_avalon_reset_from_locked_signal
		port map (
			reset  => reset_source_reset,      -- reset_source.reset
			locked => video_pll_locked_export  --       locked.export
		);

end architecture rtl; -- of disenyo_qsys_video_pll_0
