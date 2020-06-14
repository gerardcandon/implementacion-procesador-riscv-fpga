onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/ensam/reloj
add wave -noupdate /testbench/ensam/reset
add wave -noupdate /testbench/ensam/start
add wave -noupdate /testbench/ensam/ensam/UC/accB/estado
add wave -noupdate /testbench/ensam/ensam/UC/accM/estado
add wave -noupdate /testbench/ensam/ensam/UC/arbitro/estado
add wave -noupdate -divider mem
add wave -noupdate /testbench/ensam/ensam/read
add wave -noupdate /testbench/ensam/ensam/write
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/address
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/writedata
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/readdata
add wave -noupdate /testbench/ensam/ensam/byteenable
add wave -noupdate /testbench/ensam/ensam/waitrequest
add wave -noupdate /testbench/ensam/ensam/readdatavalid
add wave -noupdate -divider etapaCP
add wave -noupdate /testbench/ensam/ensam/UC/camcont/val_CP
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eCP/CPant
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eCP/CPsec
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eCP/CP_s
add wave -noupdate -divider etapaB
add wave -noupdate /testbench/ensam/ensam/UC/camcont/val_B
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eB/address_B
add wave -noupdate /testbench/ensam/ensam/UP/eB/bloq_B
add wave -noupdate -divider etapaDL
add wave -noupdate /testbench/ensam/ensam/UC/camcont/val_DL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eDL/instr_s
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eDL/L1
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eDL/L2
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eDL/imm
add wave -noupdate /testbench/ensam/ensam/UP/eDL/bloq_DL
add wave -noupdate /testbench/ensam/ensam/UP/eDL/inyec_DL
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ensam/ensam/UP/eDL/BancoR/registros(0) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(1) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(2) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(3) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(4) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(5) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(6) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(7) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(8) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(9) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(10) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(11) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(12) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(13) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(14) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(15) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(16) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(17) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(18) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(19) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(20) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(21) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(22) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(23) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(24) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(25) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(26) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(27) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(28) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(29) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(30) -radix hexadecimal} {/testbench/ensam/ensam/UP/eDL/BancoR/registros(31) -radix hexadecimal}} -subitemconfig {/testbench/ensam/ensam/UP/eDL/BancoR/registros(0) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(1) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(2) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(3) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(4) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(5) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(6) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(7) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(8) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(9) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(10) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(11) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(12) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(13) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(14) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(15) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(16) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(17) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(18) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(19) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(20) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(21) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(22) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(23) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(24) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(25) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(26) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(27) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(28) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(29) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(30) {-height 16 -radix hexadecimal} /testbench/ensam/ensam/UP/eDL/BancoR/registros(31) {-height 16 -radix hexadecimal}} /testbench/ensam/ensam/UP/eDL/BancoR/registros
add wave -noupdate -divider etapaA
add wave -noupdate /testbench/ensam/ensam/UC/camcont/val_A
add wave -noupdate /testbench/ensam/ensam/UP/eA/opALU
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eA/alu_s
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eA/EDM
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eA/imm_s
add wave -noupdate /testbench/ensam/ensam/UP/eA/bloq_A
add wave -noupdate /testbench/ensam/ensam/UP/eA/inyec_A
add wave -noupdate -divider etapaM
add wave -noupdate /testbench/ensam/ensam/UC/camcont/val_M
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eM/address_M
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/readdata
add wave -noupdate /testbench/ensam/ensam/UP/eM/bloq_M
add wave -noupdate /testbench/ensam/sdram/readdatavalid
add wave -noupdate -divider etapaF
add wave -noupdate /testbench/ensam/ensam/UC/camcont/val_F
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/eF/DE
add wave -noupdate /testbench/ensam/ensam/UP/eF/fmtload/fmtl
add wave -noupdate /testbench/ensam/ensam/UP/eF/fmtload/ext_sig
add wave -noupdate /testbench/ensam/ensam/UP/eF/bloq_F
add wave -noupdate /testbench/ensam/ensam/UP/eDL/PBR
add wave -noupdate /testbench/ensam/ensam/UC/camcont/inyec_F
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1700843 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 147
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1594368 ps} {1881113 ps}
