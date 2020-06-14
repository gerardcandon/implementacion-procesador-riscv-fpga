
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
# vcsmx - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     disenyo_qsys_tb
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries 
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "vcsmx_sim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
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
# # the simulator. In this case, you must also copy the generated library
# # setup "synopsys_sim.setup" into the location from which you launch the
# # simulator, or incorporate into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# #
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/synopsys/vcsmx/vcsmx_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# vlogan <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/synopsys/vcsmx/vcsmx_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME="'-top <simulation top>'" \
# QSYS_SIMDIR=<script generation output directory> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
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
# ACDS 19.1 670 linux 2020.06.13.15:42:27
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="disenyo_qsys_tb"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="/home/gerard/intelFPGA_lite/19.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/avalon_st_adapter_001/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/pipeline_stage/
mkdir -p ./libraries/sram_0_avalon_sram_slave_rsp_width_adapter/
mkdir -p ./libraries/rsp_mux_001/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux_001/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux_001/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/sram_0_avalon_sram_slave_burst_adapter/
mkdir -p ./libraries/ensamblado_procesador_0_avalon_master_limiter/
mkdir -p ./libraries/router_004/
mkdir -p ./libraries/router_003/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/sram_0_avalon_sram_slave_agent/
mkdir -p ./libraries/video_dma_controller_0_avalon_dma_master_agent/
mkdir -p ./libraries/sram_0_avalon_sram_slave_translator/
mkdir -p ./libraries/video_dma_controller_0_avalon_dma_master_translator/
mkdir -p ./libraries/reset_from_locked/
mkdir -p ./libraries/sys_pll/
mkdir -p ./libraries/p2b_adapter/
mkdir -p ./libraries/b2p_adapter/
mkdir -p ./libraries/transacto/
mkdir -p ./libraries/p2b/
mkdir -p ./libraries/b2p/
mkdir -p ./libraries/fifo/
mkdir -p ./libraries/timing_adt/
mkdir -p ./libraries/jtag_phy_embedded_in_jtag_master/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/video_pll_0/
mkdir -p ./libraries/sys_sdram_pll_0/
mkdir -p ./libraries/new_sdram_controller_0/
mkdir -p ./libraries/mm_reloj_0/
mkdir -p ./libraries/master_0/
mkdir -p ./libraries/ensamblado_procesador_0/
mkdir -p ./libraries/new_sdram_controller_0_my_partner/
mkdir -p ./libraries/disenyo_qsys_inst_reset_bfm/
mkdir -p ./libraries/disenyo_qsys_inst_clk_bfm/
mkdir -p ./libraries/disenyo_qsys_inst/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/cycloneive/

# ----------------------------------------
# copy RAM/ROM files to simulation directory

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver       
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim_ver
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"               -work cycloneive_ver  
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera          
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera          
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm             
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm             
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate           
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim    
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.vhd"             -work cycloneive      
  vhdlan $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                   "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_components.vhd"        -work cycloneive      
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                                    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                                    
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter_001.vhd"                -work avalon_st_adapter_001                              
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_avalon_st_adapter.vhd"                    -work avalon_st_adapter                                  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                      -work pipeline_stage                                     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work pipeline_stage                                     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_width_adapter.sv"                                          -work sram_0_avalon_sram_slave_rsp_width_adapter         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                      -work sram_0_avalon_sram_slave_rsp_width_adapter         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                     -work sram_0_avalon_sram_slave_rsp_width_adapter         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_mux_001.sv"                           -work rsp_mux_001                                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work rsp_mux_001                                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                            
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work rsp_mux                                            
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_demux_001.sv"                         -work rsp_demux_001                                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_mux_001.sv"                           -work cmd_mux_001                                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work cmd_mux_001                                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                            
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                             -work cmd_mux                                            
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter.sv"                                          -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                   -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                     -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                      -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_incr_burst_converter.sv"                                          -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_wrap_burst_converter.sv"                                          -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_default_burst_converter.sv"                                       -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                      -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                      -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work sram_0_avalon_sram_slave_burst_adapter             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_traffic_limiter.sv"                                        -work ensamblado_procesador_0_avalon_master_limiter      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_reorder_memory.sv"                                         -work ensamblado_procesador_0_avalon_master_limiter      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                 -work ensamblado_procesador_0_avalon_master_limiter      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work ensamblado_procesador_0_avalon_master_limiter      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router_004.sv"                            -work router_004                                         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router_003.sv"                            -work router_003                                         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router_001.sv"                            -work router_001                                         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0_router.sv"                                -work router                                             
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                            -work sram_0_avalon_sram_slave_agent                     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                     -work sram_0_avalon_sram_slave_agent                     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_master_agent.sv"                                           -work video_dma_controller_0_avalon_dma_master_agent     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                       -work sram_0_avalon_sram_slave_translator                
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_merlin_master_translator.sv"                                      -work video_dma_controller_0_avalon_dma_master_translator
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_up_avalon_reset_from_locked_signal.v"                             -work reset_from_locked                                  
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_up_altpll.v"                                                      -work sys_pll                                            
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0_p2b_adapter.sv"                                    -work p2b_adapter                                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0_b2p_adapter.sv"                                    -work b2p_adapter                                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_packets_to_master.v"                                       -work transacto                                          
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_packets_to_bytes.v"                                     -work p2b                                                
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_bytes_to_packets.v"                                     -work b2p                                                
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                 -work fifo                                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0_timing_adt.sv"                                     -work timing_adt                                         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_jtag_interface.v"                                       -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_jtag_dc_streaming.v"                                              -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_jtag_sld_node.v"                                                  -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_jtag_streaming.v"                                                 -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_clock_crosser.v"                                        -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_std_synchronizer_nocut.v"                                         -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                        -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_idle_remover.v"                                         -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_idle_inserter.v"                                        -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                      -work jtag_phy_embedded_in_jtag_master                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_reset_controller.v"                                               -work rst_controller                                     
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_reset_synchronizer.v"                                             -work rst_controller                                     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_irq_mapper.sv"                                              -work irq_mapper                                         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_mm_interconnect_0.v"                                        -work mm_interconnect_0                                  
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_video_pll_0.vhd"                                            -work video_pll_0                                        
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_sys_sdram_pll_0.vhd"                                        -work sys_sdram_pll_0                                    
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_new_sdram_controller_0_test_component.vhd"                  -work new_sdram_controller_0                             
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_new_sdram_controller_0.vhd"                                 -work new_sdram_controller_0                             
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mm_reloj.vhd"                                                            -work mm_reloj_0                                         
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/constantes.vhd"                                                          -work mm_reloj_0                                         
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/retardos.vhd"                                                            -work mm_reloj_0                                         
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/tipos.vhd"                                                               -work mm_reloj_0                                         
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys_master_0.vhd"                                               -work master_0                                           
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/constantes.vhd"                                                          -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/retardos.vhd"                                                            -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/tipos.vhd"                                                               -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_procesador.vhd"                                              -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensamblado_procesador.vhd"                                               -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mux2_32.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mux3_32.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/mux4_32.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/reg32.vhd"                                                               -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/reg32pe.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentesUP.vhd"                                                       -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensambladoUP.vhd"                                                        -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ALU.vhd"                                                                 -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/BR.vhd"                                                                  -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/FMTE.vhd"                                                                -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/FMTI.vhd"                                                                -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/FMTL.vhd"                                                                -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/fuerza_bit_0.vhd"                                                        -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentesUC.vhd"                                                       -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensambladoUC.vhd"                                                        -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/automata_estado_procedimientos_pkg.vhd"                                  -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/automata_estado.vhd"                                                     -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoder_procedimientos_pkg.vhd"                                          -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_decoder.vhd"                                                 -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoder.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoExcep.vhd"                                                           -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoFMT.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoMem.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoSec.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decocamino.vhd"                                                          -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoopALU.vhd"                                                           -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentesSYS.vhd"                                                      -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ensambladoSYS.vhd"                                                       -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/BR_CSR_procedimientos.vhd"                                               -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/BR_CSR.vhd"                                                              -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_camino_SYS.vhd"                                              -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/camino_SYS.vhd"                                                          -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/ALU_CSR.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_control_SYS.vhd"                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/control_SYS.vhd"                                                         -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/componentes_decoSYS.vhd"                                                 -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoSYS.vhd"                                                             -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoCamino_SYS.vhd"                                                      -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/decoExcep_SYS.vhd"                                                       -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/automata_estado_SYS.vhd"                                                 -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/recolectorEventos.vhd"                                                   -work ensamblado_procesador_0                            
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_sdram_partner_module.vhd"                                         -work new_sdram_controller_0_my_partner                  
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_reset_source.vhd"                                          -work disenyo_qsys_inst_reset_bfm                        
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/altera_avalon_clock_source.vhd"                                          -work disenyo_qsys_inst_clk_bfm                          
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/submodules/disenyo_qsys.vhd"                                                        -work disenyo_qsys_inst                                  
  vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS             "$QSYS_SIMDIR/disenyo_qsys_tb/simulation/disenyo_qsys_tb.vhd"                                                                                                                         
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
