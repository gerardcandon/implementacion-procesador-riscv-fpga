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
-- output_name:                  altera_conduit_bfm
-- role:width:direction:         CLK:1:bidir,DAT:1:bidir
-- clocked                       0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;
use work.altera_conduit_bfm_vhdl_pkg.all;

entity altera_conduit_bfm is
   port (
      sig_CLK   : inout std_logic_vector(0 downto 0);
      sig_DAT   : inout std_logic_vector(0 downto 0)
   );
end altera_conduit_bfm;

architecture altera_conduit_bfm_arch of altera_conduit_bfm is 

      signal update : std_logic := '0';

   begin
      process begin
         wait for 1 ps;
         update <= not update;
      end process;

      process (update) begin

         if out_trans.sig_CLK_oe = '1' then
            sig_CLK   <= out_trans.sig_CLK_out after 1 ps;
            sig_CLK_in <= (others => 'Z');
         else
            sig_CLK   <= (others => 'Z');
            sig_CLK_in <= sig_CLK;
         end if;

         if out_trans.sig_DAT_oe = '1' then
            sig_DAT   <= out_trans.sig_DAT_out after 1 ps;
            sig_DAT_in <= (others => 'Z');
         else
            sig_DAT   <= (others => 'Z');
            sig_DAT_in <= sig_DAT;
         end if;
      end process;

end altera_conduit_bfm_arch;

