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
-- output_name:                  altera_conduit_bfm_0002
-- role:width:direction:         ADDR:20:input,CE_N:1:input,DQ:16:bidir,LB_N:1:input,OE_N:1:input,UB_N:1:input,WE_N:1:input
-- clocked                       0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;
use work.altera_conduit_bfm_0002_vhdl_pkg.all;

entity altera_conduit_bfm_0002 is
   port (
      sig_ADDR   : in    std_logic_vector(19 downto 0);
      sig_CE_N   : in    std_logic_vector(0 downto 0);
      sig_DQ     : inout std_logic_vector(15 downto 0);
      sig_LB_N   : in    std_logic_vector(0 downto 0);
      sig_OE_N   : in    std_logic_vector(0 downto 0);
      sig_UB_N   : in    std_logic_vector(0 downto 0);
      sig_WE_N   : in    std_logic_vector(0 downto 0)
   );
end altera_conduit_bfm_0002;

architecture altera_conduit_bfm_0002_arch of altera_conduit_bfm_0002 is 

      signal update : std_logic := '0';

   begin
      process begin
         wait for 1 ps;
         update <= not update;
      end process;

      process (update) begin
         sig_ADDR_in <= sig_ADDR;
         sig_CE_N_in <= sig_CE_N;

         if out_trans.sig_DQ_oe = '1' then
            sig_DQ     <= out_trans.sig_DQ_out after 1 ps;
            sig_DQ_in  <= (others => 'Z');
         else
            sig_DQ     <= (others => 'Z');
            sig_DQ_in  <= sig_DQ;
         end if;
         sig_LB_N_in <= sig_LB_N;
         sig_OE_N_in <= sig_OE_N;
         sig_UB_N_in <= sig_UB_N;
         sig_WE_N_in <= sig_WE_N;
      end process;

end altera_conduit_bfm_0002_arch;

