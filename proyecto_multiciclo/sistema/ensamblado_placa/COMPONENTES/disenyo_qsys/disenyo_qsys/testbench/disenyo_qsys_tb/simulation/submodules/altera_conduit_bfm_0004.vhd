-- (C) 2001-2019 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
-- $Revision: #7 $
-- $Date: 2010/08/05 $
-- $Author: klong $
-------------------------------------------------------------------------------
-- =head1 NAME
-- altera_conduit_bfm
-- =head1 SYNOPSIS
-- Bus Functional Model (BFM) for a Standard Conduit BFM
-------------------------------------------------------------------------------
-- =head1 DESCRIPTION
-- This is a Bus Functional Model (BFM) for a Standard Conduit Master.
-- This BFM sampled the input/bidirection port value or driving user's value to 
-- output ports when user call the API.  
-- This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
-- Generation parameters:
-- output_name:                  altera_conduit_bfm_0004
-- role:width:direction:         B:8:input,BLANK:1:input,CLK:1:input,G:8:input,HS:1:input,R:8:input,SYNC:1:input,VS:1:input
-- clocked                       0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;
use work.altera_conduit_bfm_0004_vhdl_pkg.all;

entity altera_conduit_bfm_0004 is
   port (
      sig_B       : in    std_logic_vector(7 downto 0);
      sig_BLANK   : in    std_logic_vector(0 downto 0);
      sig_CLK     : in    std_logic_vector(0 downto 0);
      sig_G       : in    std_logic_vector(7 downto 0);
      sig_HS      : in    std_logic_vector(0 downto 0);
      sig_R       : in    std_logic_vector(7 downto 0);
      sig_SYNC    : in    std_logic_vector(0 downto 0);
      sig_VS      : in    std_logic_vector(0 downto 0)
   );
end altera_conduit_bfm_0004;

architecture altera_conduit_bfm_0004_arch of altera_conduit_bfm_0004 is 

      signal update : std_logic := '0';

   begin
      process begin
         wait for 1 ps;
         update <= not update;
      end process;

      process (update) begin
         sig_B_in    <= sig_B;
         sig_BLANK_in <= sig_BLANK;
         sig_CLK_in  <= sig_CLK;
         sig_G_in    <= sig_G;
         sig_HS_in   <= sig_HS;
         sig_R_in    <= sig_R;
         sig_SYNC_in <= sig_SYNC;
         sig_VS_in   <= sig_VS;
      end process;

end altera_conduit_bfm_0004_arch;

