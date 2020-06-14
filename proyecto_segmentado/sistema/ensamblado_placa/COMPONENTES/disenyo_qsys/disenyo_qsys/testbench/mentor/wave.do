onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/reloj
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/Pcero
add wave -noupdate -divider Validez
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_DL
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_A
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_F
add wave -noupdate -divider {Etapa CP}
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eCP/msec_sel
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eCP/CP_s
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eCP/bloq_CP
add wave -noupdate -divider {Etapa B}
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/read_B
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/waitrequest_B
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/readvalid_B
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/buff_CP_s
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/instr_s
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/buff/buff_CP
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/buff/buff_datos
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/buff/buff_val
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/buff/s_fifo_llena
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eB/buff/s_fifo_vacia
add wave -noupdate -divider {Etapa DL}
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_DL
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/instr_s
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eF/DE
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/PBR
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/L1
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/L2
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/imm
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/bloq_DL
add wave -noupdate -divider {Etapa A}
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_A
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eA/alu_s
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eA/ig
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eA/me
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eA/meu
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eA/bloq_A
add wave -noupdate -divider {Etapa M}
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/read_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/write_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/byteenable_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/waitrequest_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/readdatavalid_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/readdata_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/writedata_M
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eM/bloq_M
add wave -noupdate -divider {Etapa F}
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UC/camcont/val_F
add wave -noupdate -radix hexadecimal /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eF/DE
add wave -noupdate /disenyo_qsys_tb/disenyo_qsys_inst/ensamblado_procesador_0/UP/eDL/PBR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61278 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 20
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {161109881 ps} {161275269 ps}
