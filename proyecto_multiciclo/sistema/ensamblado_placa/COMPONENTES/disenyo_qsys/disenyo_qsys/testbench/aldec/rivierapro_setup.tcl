
# (C) 2001-2020 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 19.1 670 linux 2020.06.13.15:42:27
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     disenyo_qsys_tb
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If disenyo_qsys_tb is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "disenyo_qsys_tb"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "/home/gerard/intelFPGA_lite/19.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                  ./libraries/altera_ver      
vmap       altera_ver       ./libraries/altera_ver      
ensure_lib                  ./libraries/lpm_ver         
vmap       lpm_ver          ./libraries/lpm_ver         
ensure_lib                  ./libraries/sgate_ver       
vmap       sgate_ver        ./libraries/sgate_ver       
ensure_lib                  ./libraries/altera_mf_ver   
vmap       altera_mf_ver    ./libraries/altera_mf_ver   
ensure_lib                  ./libraries/altera_lnsim_ver
vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver
ensure_lib                  ./libraries/cycloneive_ver  
vmap       cycloneive_ver   ./libraries/cycloneive_ver  
ensure_lib                  ./libraries/altera          
vmap       altera           ./libraries/altera          
ensure_lib                  ./libraries/lpm             
vmap       lpm              ./libraries/lpm             
ensure_lib                  ./libraries/sgate           
vmap       sgate            ./libraries/sgate           
ensure_lib                  ./libraries/altera_mf       
vmap       altera_mf        ./libraries/altera_mf       
ensure_lib                  ./libraries/altera_lnsim    
vmap       altera_lnsim     ./libraries/altera_lnsim    
ensure_lib                  ./libraries/cycloneive      
vmap       cycloneive       ./libraries/cycloneive      
ensure_lib                                                     ./libraries/error_adapter_0                                    
vmap       error_adapter_0                                     ./libraries/error_adapter_0                                    
ensure_lib                                                     ./libraries/avalon_st_adapter_001                              
vmap       avalon_st_adapter_001                               ./libraries/avalon_st_adapter_001                              
ensure_lib                                                     ./libraries/avalon_st_adapter                                  
vmap       avalon_st_adapter                                   ./libraries/avalon_st_adapter                                  
ensure_lib                                                     ./libraries/pipeline_stage                                     
vmap       pipeline_stage                                      ./libraries/pipeline_stage                                     
ensure_lib                                                     ./libraries/sram_0_avalon_sram_slave_rsp_width_adapter         
vmap       sram_0_avalon_sram_slave_rsp_width_adapter          ./libraries/sram_0_avalon_sram_slave_rsp_width_adapter         
ensure_lib                                                     ./libraries/rsp_mux_001                                        
vmap       rsp_mux_001                                         ./libraries/rsp_mux_001                                        
ensure_lib                                                     ./libraries/rsp_mux                                            
vmap       rsp_mux                                             ./libraries/rsp_mux                                            
ensure_lib                                                     ./libraries/rsp_demux_001                                      
vmap       rsp_demux_001                                       ./libraries/rsp_demux_001                                      
ensure_lib                                                     ./libraries/rsp_demux                                          
vmap       rsp_demux                                           ./libraries/rsp_demux                                          
ensure_lib                                                     ./libraries/cmd_mux_001                                        
vmap       cmd_mux_001                                         ./libraries/cmd_mux_001                                        
ensure_lib                                                     ./libraries/cmd_mux                                            
vmap       cmd_mux                                             ./libraries/cmd_mux                                            
ensure_lib                                                     ./libraries/cmd_demux_001                                      
vmap       cmd_demux_001                                       ./libraries/cmd_demux_001                                      
ensure_lib                                                     ./libraries/cmd_demux                                          
vmap       cmd_demux                                           ./libraries/cmd_demux                                          
ensure_lib                                                     ./libraries/sram_0_avalon_sram_slave_burst_adapter             
vmap       sram_0_avalon_sram_slave_burst_adapter              ./libraries/sram_0_avalon_sram_slave_burst_adapter             
ensure_lib                                                     ./libraries/ensamblado_procesador_0_avalon_master_limiter      
vmap       ensamblado_procesador_0_avalon_master_limiter       ./libraries/ensamblado_procesador_0_avalon_master_limiter      
ensure_lib                                                     ./libraries/router_004                                         
vmap       router_004                                          ./libraries/router_004                                         
ensure_lib                                                     ./libraries/router_003                                         
vmap       router_003                                          ./libraries/router_003                                         
ensure_lib                                                     ./libraries/router_001                                         
vmap       router_001                                          ./libraries/router_001                                         
ensure_lib                                                     ./libraries/router                                             
vmap       router                                              ./libraries/router                                             
ensure_lib                                                     ./libraries/sram_0_avalon_sram_slave_agent                     
vmap       sram_0_avalon_sram_slave_agent                      ./libraries/sram_0_avalon_sram_slave_agent                     
ensure_lib                                                     ./libraries/video_dma_controller_0_avalon_dma_master_agent     
vmap       video_dma_controller_0_avalon_dma_master_agent      ./libraries/video_dma_controller_0_avalon_dma_master_agent     
ensure_lib                                                     ./libraries/sram_0_avalon_sram_slave_translator                
vmap       sram_0_avalon_sram_slave_translator                 ./libraries/sram_0_avalon_sram_slave_translator                
ensure_lib                                                     ./libraries/video_dma_controller_0_avalon_dma_master_translator
vmap       video_dma_controller_0_avalon_dma_master_translator ./libraries/video_dma_controller_0_avalon_dma_master_translator
ensure_lib                                                     ./libraries/reset_from_locked                                  
vmap       reset_from_locked                                   ./libraries/reset_from_locked                                  
ensure_lib                                                     ./libraries/sys_pll                                            
vmap       sys_pll                                             ./libraries/sys_pll                                            
ensure_lib                                                     ./libraries/p2b_adapter                                        
vmap       p2b_adapter                                         ./libraries/p2b_adapter                                        
ensure_lib                                                     ./libraries/b2p_adapter                                        
vmap       b2p_adapter                                         ./libraries/b2p_adapter                                        
ensure_lib                                                     ./libraries/transacto                                          
vmap       transacto                                           ./libraries/transacto                                          
ensure_lib                                                     ./libraries/p2b                                                
vmap       p2b                                                 ./libraries/p2b                                                
ensure_lib                                                     ./libraries/b2p                                                
vmap       b2p                                                 ./libraries/b2p                                                
ensure_lib                                                     ./libraries/fifo                                               
vmap       fifo                                                ./libraries/fifo                                               
ensure_lib                                                     ./libraries/timing_adt                                         
vmap       timing_adt                                          ./libraries/timing_adt                                         
ensure_lib                                                     ./libraries/jtag_phy_embedded_in_jtag_master                   
vmap       jtag_phy_embedded_in_jtag_master                    ./libraries/jtag_phy_embedded_in_jtag_master                   
ensure_lib                                                     ./libraries/rst_controller                                     
vmap       rst_controller                                      ./libraries/rst_controller                                     
ensure_lib                                                     ./libraries/irq_mapper                                         
vmap       irq_mapper                                          ./libraries/irq_mapper                                         
ensure_lib                                                     ./libraries/mm_interconnect_0                                  
vmap       mm_interconnect_0                                   ./libraries/mm_interconnect_0                                  
ensure_lib                                                     ./libraries/video_pll_0                                        
vmap       video_pll_0                                         ./libraries/video_pll_0                                        
ensure_lib                                                     ./libraries/sys_sdram_pll_0                                    
vmap       sys_sdram_pll_0                                     ./libraries/sys_sdram_pll_0                                    
ensure_lib                                                     ./libraries/new_sdram_controller_0                             
vmap       new_sdram_controller_0                              ./libraries/new_sdram_controller_0                             
ensure_lib                                                     ./libraries/mm_reloj_0                                         
vmap       mm_reloj_0                                          ./libraries/mm_reloj_0                                         
ensure_lib                                                     ./libraries/master_0                                           
vmap       master_0                                            ./libraries/master_0                                           
ensure_lib                                                     ./libraries/ensamblado_procesador_0                            
vmap       ensamblado_procesador_0                             ./libraries/ensamblado_procesador_0                            
ensure_lib                                                     ./libraries/new_sdram_controller_0_my_partner                  
vmap       new_sdram_controller_0_my_partner                   ./libraries/new_sdram_controller_0_my_partner                  
ensure_lib                                                     ./libraries/disenyo_qsys_inst_reset_bfm                        
vmap       disenyo_qsys_inst_reset_bfm                         ./libraries/disenyo_qsys_inst_reset_bfm                        
ensure_lib                                                     ./libraries/disenyo_qsys_inst_clk_bfm                          
vmap       disenyo_qsys_inst_clk_bfm                           ./libraries/disenyo_qsys_inst_clk_bfm                          
ensure_lib                                                     ./libraries/disenyo_qsys_inst                                  
vmap       disenyo_qsys_inst                                   ./libraries/disenyo_qsys_inst                                  

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver      
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver       
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim_ver
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"               -work cycloneive_ver  
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm             
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm             
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate           
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim    
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.vhd"             -work cycloneive      
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_components.vhd"        -work cycloneive      
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                                    
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter_001.vhd"                -work avalon_st_adapter_001                              
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter.vhd"                    -work avalon_st_adapter                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                      -work pipeline_stage                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work pipeline_stage                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_width_adapter.sv"                                          -work sram_0_avalon_sram_slave_rsp_width_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                      -work sram_0_avalon_sram_slave_rsp_width_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                     -work sram_0_avalon_sram_slave_rsp_width_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_mux_001.sv"                           -work rsp_mux_001                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work rsp_mux_001                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work rsp_mux                                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_demux_001.sv"                         -work rsp_demux_001                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_mux_001.sv"                           -work cmd_mux_001                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work cmd_mux_001                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work cmd_mux                                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter.sv"                                          -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                   -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                     -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                      -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_incr_burst_converter.sv"                                          -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_wrap_burst_converter.sv"                                          -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_default_burst_converter.sv"                                       -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                      -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                      -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work sram_0_avalon_sram_slave_burst_adapter             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_traffic_limiter.sv"                                        -work ensamblado_procesador_0_avalon_master_limiter      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_reorder_memory.sv"                                         -work ensamblado_procesador_0_avalon_master_limiter      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                 -work ensamblado_procesador_0_avalon_master_limiter      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work ensamblado_procesador_0_avalon_master_limiter      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router_004.sv"                            -work router_004                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router_003.sv"                            -work router_003                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router_001.sv"                            -work router_001                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router.sv"                                -work router                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                            -work sram_0_avalon_sram_slave_agent                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                     -work sram_0_avalon_sram_slave_agent                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_master_agent.sv"                                           -work video_dma_controller_0_avalon_dma_master_agent     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                       -work sram_0_avalon_sram_slave_translator                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_master_translator.sv"                                      -work video_dma_controller_0_avalon_dma_master_translator
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_up_avalon_reset_from_locked_signal.v"                             -work reset_from_locked                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_up_altpll.v"                                                      -work sys_pll                                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0_p2b_adapter.sv"                                    -work p2b_adapter                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0_b2p_adapter.sv"                                    -work b2p_adapter                                        
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_packets_to_master.v"                                       -work transacto                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_packets_to_bytes.v"                                     -work p2b                                                
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_bytes_to_packets.v"                                     -work b2p                                                
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                 -work fifo                                               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0_timing_adt.sv"                                     -work timing_adt                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_jtag_interface.v"                                       -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_jtag_dc_streaming.v"                                              -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_jtag_sld_node.v"                                                  -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_jtag_streaming.v"                                                 -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_clock_crosser.v"                                        -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_std_synchronizer_nocut.v"                                         -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_idle_remover.v"                                         -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_idle_inserter.v"                                        -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                      -work jtag_phy_embedded_in_jtag_master                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_reset_controller.v"                                               -work rst_controller                                     
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_reset_synchronizer.v"                                             -work rst_controller                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_irq_mapper.sv"                                              -work irq_mapper                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0.v"                                        -work mm_interconnect_0                                  
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_video_pll_0.vhd"                                            -work video_pll_0                                        
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_sys_sdram_pll_0.vhd"                                        -work sys_sdram_pll_0                                    
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_new_sdram_controller_0_test_component.vhd"                  -work new_sdram_controller_0                             
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_new_sdram_controller_0.vhd"                                 -work new_sdram_controller_0                             
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mm_reloj.vhd"                                                            -work mm_reloj_0                                         
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/constantes.vhd"                                                          -work mm_reloj_0                                         
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/retardos.vhd"                                                            -work mm_reloj_0                                         
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/tipos.vhd"                                                               -work mm_reloj_0                                         
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0.vhd"                                               -work master_0                                           
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/constantes.vhd"                                                          -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/retardos.vhd"                                                            -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/tipos.vhd"                                                               -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_procesador.vhd"                                              -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensamblado_procesador.vhd"                                               -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mux2_32.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mux3_32.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mux4_32.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/reg32.vhd"                                                               -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/reg32pe.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentesUP.vhd"                                                       -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensambladoUP.vhd"                                                        -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ALU.vhd"                                                                 -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/BR.vhd"                                                                  -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/FMTE.vhd"                                                                -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/FMTI.vhd"                                                                -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/FMTL.vhd"                                                                -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/fuerza_bit_0.vhd"                                                        -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentesUC.vhd"                                                       -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensambladoUC.vhd"                                                        -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/automata_estado_procedimientos_pkg.vhd"                                  -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/automata_estado.vhd"                                                     -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoder_procedimientos_pkg.vhd"                                          -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_decoder.vhd"                                                 -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoder.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoExcep.vhd"                                                           -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoFMT.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoMem.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoSec.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decocamino.vhd"                                                          -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoopALU.vhd"                                                           -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentesSYS.vhd"                                                      -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensambladoSYS.vhd"                                                       -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/BR_CSR_procedimientos.vhd"                                               -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/BR_CSR.vhd"                                                              -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_camino_SYS.vhd"                                              -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/camino_SYS.vhd"                                                          -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ALU_CSR.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_control_SYS.vhd"                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/control_SYS.vhd"                                                         -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_decoSYS.vhd"                                                 -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoSYS.vhd"                                                             -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoCamino_SYS.vhd"                                                      -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoExcep_SYS.vhd"                                                       -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/automata_estado_SYS.vhd"                                                 -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/recolectorEventos.vhd"                                                   -work ensamblado_procesador_0                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_sdram_partner_module.vhd"                                         -work new_sdram_controller_0_my_partner                  
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_reset_source.vhd"                                          -work disenyo_qsys_inst_reset_bfm                        
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_clock_source.vhd"                                          -work disenyo_qsys_inst_clk_bfm                          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys.vhd"                                                        -work disenyo_qsys_inst                                  
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/disenyo_qsys_tb.vhd"                                                                                                                         
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L avalon_st_adapter_001 -L avalon_st_adapter -L pipeline_stage -L sram_0_avalon_sram_slave_rsp_width_adapter -L rsp_mux_001 -L rsp_mux -L rsp_demux_001 -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_001 -L cmd_demux -L sram_0_avalon_sram_slave_burst_adapter -L ensamblado_procesador_0_avalon_master_limiter -L router_004 -L router_003 -L router_001 -L router -L sram_0_avalon_sram_slave_agent -L video_dma_controller_0_avalon_dma_master_agent -L sram_0_avalon_sram_slave_translator -L video_dma_controller_0_avalon_dma_master_translator -L reset_from_locked -L sys_pll -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L irq_mapper -L mm_interconnect_0 -L video_pll_0 -L sys_sdram_pll_0 -L new_sdram_controller_0 -L mm_reloj_0 -L master_0 -L ensamblado_procesador_0 -L new_sdram_controller_0_my_partner -L disenyo_qsys_inst_reset_bfm -L disenyo_qsys_inst_clk_bfm -L disenyo_qsys_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L avalon_st_adapter_001 -L avalon_st_adapter -L pipeline_stage -L sram_0_avalon_sram_slave_rsp_width_adapter -L rsp_mux_001 -L rsp_mux -L rsp_demux_001 -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_001 -L cmd_demux -L sram_0_avalon_sram_slave_burst_adapter -L ensamblado_procesador_0_avalon_master_limiter -L router_004 -L router_003 -L router_001 -L router -L sram_0_avalon_sram_slave_agent -L video_dma_controller_0_avalon_dma_master_agent -L sram_0_avalon_sram_slave_translator -L video_dma_controller_0_avalon_dma_master_translator -L reset_from_locked -L sys_pll -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L irq_mapper -L mm_interconnect_0 -L video_pll_0 -L sys_sdram_pll_0 -L new_sdram_controller_0 -L mm_reloj_0 -L master_0 -L ensamblado_procesador_0 -L new_sdram_controller_0_my_partner -L disenyo_qsys_inst_reset_bfm -L disenyo_qsys_inst_clk_bfm -L disenyo_qsys_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h
