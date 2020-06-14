onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ensamblado_pruebas/reloj
add wave -noupdate /ensamblado_pruebas/Pcero
add wave -noupdate -divider Decoder
add wave -noupdate /ensamblado_pruebas/ensam/ensam/deco/estado
add wave -noupdate -divider {Unidad de Proceso}
add wave -noupdate -divider {Banco de Reg}
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/bancoR/IDL1
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/bancoR/IDL2
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/bancoR/IDE
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/bancoR/PE
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/bancoR/DE
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/bancoR/L1
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/bancoR/L2
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/bancoR/registros
add wave -noupdate -divider ALU
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/al/opALU
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/al/a
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/al/b
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/al/s
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/al/me
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/al/meu
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/al/ig
add wave -noupdate -divider SDRAM
add wave -noupdate /ensamblado_pruebas/ensam/sdram/read
add wave -noupdate /ensamblado_pruebas/ensam/sdram/write
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/sdram/address
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/sdram/writedata
add wave -noupdate /ensamblado_pruebas/ensam/sdram/byteenable
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/sdram/readdata
add wave -noupdate /ensamblado_pruebas/ensam/sdram/waitrequest
add wave -noupdate /ensamblado_pruebas/ensam/sdram/readdatavalid
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/sdram/ram
add wave -noupdate -divider Formateadores
add wave -noupdate -divider FMTME
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/fmtmentrada/fmtme
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/fmtmentrada/dato_e
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/fmtmentrada/dato_s
add wave -noupdate -divider FMTMS
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/fmtmsalida/ext_sig
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/fmtmsalida/fmtms
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/fmtmsalida/dato_e
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/fmtmsalida/dato_s
add wave -noupdate -divider FMTIMM
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/fmtimm/fmti_tipo
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/fmtimm/s
add wave -noupdate -divider Multiplexores
add wave -noupdate -divider mdir
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/mdir/SEL
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mdir/d0
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mdir/d1
add wave -noupdate -divider mEBR
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/mEBR/SEL
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mEBR/d0
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mEBR/d1
add wave -noupdate -divider mLa
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/mLa/SEL
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mLa/d0
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mLa/d1
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mLa/d2
add wave -noupdate -divider mLb
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/mLb/SEL
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mLb/d0
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mLb/d1
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mLb/d2
add wave -noupdate -divider mCP
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/mCP/SEL
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mCP/d0
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mCP/d1
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/mCP/d2
add wave -noupdate -divider Registros
add wave -noupdate -divider CP
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/CP/pe
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/CP/e
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/CP/s
add wave -noupdate -divider CPAnt
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/CPant/pe
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/CPant/e
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/CPant/s
add wave -noupdate -divider RI
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/RI/pe
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/RI/e
add wave -noupdate -radix hexadecimal /ensamblado_pruebas/ensam/ensam/UP/RI/s
add wave -noupdate -divider AR
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/AR/pe
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/AR/e
add wave -noupdate /ensamblado_pruebas/ensam/ensam/UP/AR/s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2765625 ps} 0}
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
WaveRestoreZoom {0 ps} {362696 ps}
