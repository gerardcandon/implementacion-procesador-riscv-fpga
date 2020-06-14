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
-- output_name:                  altera_conduit_bfm_0002
-- role:width:direction:         ADDR:20:input,CE_N:1:input,DQ:16:bidir,LB_N:1:input,OE_N:1:input,UB_N:1:input,WE_N:1:input
-- clocked                       0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;








package altera_conduit_bfm_0002_vhdl_pkg is

   -- output signal register
   type altera_conduit_bfm_0002_out_trans_t is record
      sig_DQ_out       : std_logic_vector(15 downto 0);
      sig_DQ_oe        : std_logic;
   end record;
   
   shared variable out_trans        : altera_conduit_bfm_0002_out_trans_t;

   -- input signal register
   signal sig_ADDR_in      : std_logic_vector(19 downto 0);
   signal sig_CE_N_in      : std_logic_vector(0 downto 0);
   signal sig_DQ_in        : std_logic_vector(15 downto 0);
   signal sig_LB_N_in      : std_logic_vector(0 downto 0);
   signal sig_OE_N_in      : std_logic_vector(0 downto 0);
   signal sig_UB_N_in      : std_logic_vector(0 downto 0);
   signal sig_WE_N_in      : std_logic_vector(0 downto 0);

   -- VHDL Procedure API
   
   -- get ADDR value
   procedure get_ADDR             (signal_value : out std_logic_vector(19 downto 0));
   
   -- get CE_N value
   procedure get_CE_N             (signal_value : out std_logic_vector(0 downto 0));
   
   -- get DQ value
   procedure get_DQ               (signal_value : out std_logic_vector(15 downto 0));
   
   -- set DQ value
   procedure set_DQ               (signal_value : in std_logic_vector(15 downto 0));
   
   -- set DQ input / output direction
   procedure set_DQ_oe            (signal_value : in std_logic);
   
   -- get LB_N value
   procedure get_LB_N             (signal_value : out std_logic_vector(0 downto 0));
   
   -- get OE_N value
   procedure get_OE_N             (signal_value : out std_logic_vector(0 downto 0));
   
   -- get UB_N value
   procedure get_UB_N             (signal_value : out std_logic_vector(0 downto 0));
   
   -- get WE_N value
   procedure get_WE_N             (signal_value : out std_logic_vector(0 downto 0));
   
   -- VHDL Event API

   procedure event_ADDR_change;   

   procedure event_CE_N_change;   

   procedure event_DQ_change;   

   procedure event_LB_N_change;   

   procedure event_OE_N_change;   

   procedure event_UB_N_change;   

   procedure event_WE_N_change;   

end altera_conduit_bfm_0002_vhdl_pkg;

package body altera_conduit_bfm_0002_vhdl_pkg is
   
   procedure get_ADDR             (signal_value : out std_logic_vector(19 downto 0)) is
   begin

      signal_value := sig_ADDR_in;
   
   end procedure get_ADDR;
   
   procedure get_CE_N             (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_CE_N_in;
   
   end procedure get_CE_N;
   
   procedure get_DQ               (signal_value : out std_logic_vector(15 downto 0)) is
   begin

      signal_value := sig_DQ_in;
   
   end procedure get_DQ;
   
   procedure set_DQ               (signal_value : in std_logic_vector(15 downto 0)) is
   begin
      
      out_trans.sig_DQ_out := signal_value;
      
   end procedure set_DQ;
   
   procedure set_DQ_oe            (signal_value : in std_logic) is
   begin
   
      out_trans.sig_DQ_oe := signal_value;
   
   end procedure set_DQ_oe;
   
   procedure get_LB_N             (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_LB_N_in;
   
   end procedure get_LB_N;
   
   procedure get_OE_N             (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_OE_N_in;
   
   end procedure get_OE_N;
   
   procedure get_UB_N             (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_UB_N_in;
   
   end procedure get_UB_N;
   
   procedure get_WE_N             (signal_value : out std_logic_vector(0 downto 0)) is
   begin

      signal_value := sig_WE_N_in;
   
   end procedure get_WE_N;
   
   procedure event_ADDR_change is
   begin

      wait until (sig_ADDR_in'event);

   end event_ADDR_change;
   procedure event_CE_N_change is
   begin

      wait until (sig_CE_N_in'event);

   end event_CE_N_change;
   procedure event_DQ_change is
   begin

      wait until (sig_DQ_in'event and out_trans.sig_DQ_oe = '0');

   end event_DQ_change;
   procedure event_LB_N_change is
   begin

      wait until (sig_LB_N_in'event);

   end event_LB_N_change;
   procedure event_OE_N_change is
   begin

      wait until (sig_OE_N_in'event);

   end event_OE_N_change;
   procedure event_UB_N_change is
   begin

      wait until (sig_UB_N_in'event);

   end event_UB_N_change;
   procedure event_WE_N_change is
   begin

      wait until (sig_WE_N_in'event);

   end event_WE_N_change;

end altera_conduit_bfm_0002_vhdl_pkg;

