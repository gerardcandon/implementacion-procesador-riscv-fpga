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
-- This is a Bus Functional Model (BFM) VHDL package for a Standard Conduit Master.
-- This package provides the API that will be used to get the value of the sampled
-- input/bidirection port or set the value to be driven to the output ports.
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









package altera_conduit_bfm_0004_vhdl_pkg is


   -- input signal register
   signal sig_B_in          : std_logic_vector(7 downto 0);
   signal sig_BLANK_in      : std_logic_vector(0 downto 0);
   signal sig_CLK_in        : std_logic_vector(0 downto 0);
   signal sig_G_in          : std_logic_vector(7 downto 0);
   signal sig_HS_in         : std_logic_vector(0 downto 0);
   signal sig_R_in          : std_logic_vector(7 downto 0);
   signal sig_SYNC_in       : std_logic_vector(0 downto 0);
   signal sig_VS_in         : std_logic_vector(0 downto 0);

   -- VHDL Procedure API
   
   -- get B value
   procedure get_B                 (signal_value : out std_logic_vector(7 downto 0));
   
   -- get BLANK value
   procedure get_BLANK             (signal_value : out std_logic_vector(0 downto 0));
   
   -- get CLK value
   procedure get_CLK               (signal_value : out std_logic_vector(0 downto 0));
   
   -- get G value
   procedure get_G                 (signal_value : out std_logic_vector(7 downto 0));
   
   -- get HS value
   procedure get_HS                (signal_value : out std_logic_vector(0 downto 0));
   
   -- get R value
   procedure get_R                 (signal_value : out std_logic_vector(7 downto 0));
   
   -- get SYNC value
   procedure get_SYNC              (signal_value : out std_logic_vector(0 downto 0));
   
   -- get VS value
   procedure get_VS                (signal_value : out std_logic_vector(0 downto 0));
   
   -- VHDL Event API

   procedure event_B_change;   

   procedure event_BLANK_change;   

   procedure event_CLK_change;   

   procedure event_G_change;   

   procedure event_HS_change;   

   procedure event_R_change;   

   procedure event_SYNC_change;   

   procedure event_VS_change;   

end altera_conduit_bfm_0004_vhdl_pkg;

package body altera_conduit_bfm_0004_vhdl_pkg is
   
   procedure get_B                 (signal_value : out std_logic_vector(7 downto 0)) is
   begin

      signal_value := sig_B_in;
   
   end procedure get_B;
   
   procedure get_BLANK             (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_BLANK_in;
   
   end procedure get_BLANK;
   
   procedure get_CLK               (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_CLK_in;
   
   end procedure get_CLK;
   
   procedure get_G                 (signal_value : out std_logic_vector(7 downto 0)) is
   begin

      signal_value := sig_G_in;
   
   end procedure get_G;
   
   procedure get_HS                (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_HS_in;
   
   end procedure get_HS;
   
   procedure get_R                 (signal_value : out std_logic_vector(7 downto 0)) is
   begin

      signal_value := sig_R_in;
   
   end procedure get_R;
   
   procedure get_SYNC              (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_SYNC_in;
   
   end procedure get_SYNC;
   
   procedure get_VS                (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_VS_in;
   
   end procedure get_VS;
   
   procedure event_B_change is
   begin

      wait until (sig_B_in'event);

   end event_B_change;
   procedure event_BLANK_change is
   begin

      wait until (sig_BLANK_in'event);

   end event_BLANK_change;
   procedure event_CLK_change is
   begin

      wait until (sig_CLK_in'event);

   end event_CLK_change;
   procedure event_G_change is
   begin

      wait until (sig_G_in'event);

   end event_G_change;
   procedure event_HS_change is
   begin

      wait until (sig_HS_in'event);

   end event_HS_change;
   procedure event_R_change is
   begin

      wait until (sig_R_in'event);

   end event_R_change;
   procedure event_SYNC_change is
   begin

      wait until (sig_SYNC_in'event);

   end event_SYNC_change;
   procedure event_VS_change is
   begin

      wait until (sig_VS_in'event);

   end event_VS_change;

end altera_conduit_bfm_0004_vhdl_pkg;

