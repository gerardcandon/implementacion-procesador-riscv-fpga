onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/ensam/reloj
add wave -noupdate -divider Estado
add wave -noupdate /testbench/ensam/ensam/UC/estado_s
add wave -noupdate -divider {Excep y Int}
add wave -noupdate /testbench/ensam/ensam/USYS/recoEv/excep
add wave -noupdate /testbench/ensam/ensam/USYS/recoEv/excep_SYS
add wave -noupdate /testbench/ensam/ensam/USYS/recoEv/int_CSR
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/recoEv/int_causa_CSR
add wave -noupdate /testbench/ensam/ensam/USYS/recoEv/excep_CSR
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/recoEv/excep_causa_CSR
add wave -noupdate -divider BRCSR
add wave -noupdate /testbench/ensam/ensam/USYS/csr/modo_csr
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mstatus
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mie
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mtvec
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mscratch
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mepc
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mcause
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mtval
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/USYS/csr/mip
add wave -noupdate -divider {Unidad de Proceso}
add wave -noupdate -divider {Banco de Reg}
add wave -noupdate /testbench/ensam/ensam/UP/bancoR/IDL1
add wave -noupdate /testbench/ensam/ensam/UP/bancoR/IDL2
add wave -noupdate /testbench/ensam/ensam/UP/bancoR/IDE
add wave -noupdate /testbench/ensam/ensam/UP/bancoR/PE
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/bancoR/DE
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/bancoR/L1
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/bancoR/L2
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/bancoR/registros
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/al/a
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/al/b
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/al/s
add wave -noupdate /testbench/ensam/ensam/UP/al/me
add wave -noupdate /testbench/ensam/ensam/UP/al/meu
add wave -noupdate /testbench/ensam/ensam/UP/al/ig
add wave -noupdate -divider SDRAM
add wave -noupdate /testbench/ensam/sdram/read
add wave -noupdate /testbench/ensam/sdram/write
add wave -noupdate -radix hexadecimal /testbench/ensam/sdram/address
add wave -noupdate -radix hexadecimal /testbench/ensam/sdram/writedata
add wave -noupdate /testbench/ensam/sdram/byteenable
add wave -noupdate -radix hexadecimal /testbench/ensam/sdram/readdata
add wave -noupdate /testbench/ensam/sdram/waitrequest
add wave -noupdate /testbench/ensam/sdram/readdatavalid
add wave -noupdate -radix hexadecimal /testbench/ensam/sdram/memoria/memoria
add wave -noupdate -divider Formateadores
add wave -noupdate -divider FMTME
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/fmtentrada/dato_e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/fmtentrada/dato_s
add wave -noupdate -divider FMTML
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/RLDM/e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/RLDM/s
add wave -noupdate -divider FMTI
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/fmtimm/instr
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/fmtimm/s
add wave -noupdate -divider Multiplexores
add wave -noupdate -divider mCP
add wave -noupdate /testbench/ensam/ensam/UP/mCP/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mCP/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mCP/d1
add wave -noupdate -divider mdirsec
add wave -noupdate /testbench/ensam/ensam/UP/mdirsec/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mdirsec/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mdirsec/d1
add wave -noupdate -divider mRLDM
add wave -noupdate -divider mdir
add wave -noupdate /testbench/ensam/ensam/UP/mdir/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mdir/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mdir/d1
add wave -noupdate -divider mEBR
add wave -noupdate /testbench/ensam/ensam/UP/mEBR/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mEBR/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mEBR/d1
add wave -noupdate -divider mESCSR
add wave -noupdate /testbench/ensam/ensam/UP/mESCSR/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mESCSR/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mESCSR/d1
add wave -noupdate -divider mLa
add wave -noupdate /testbench/ensam/ensam/UP/mLa/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mLa/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mLa/d1
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mLa/d2
add wave -noupdate -divider mLb
add wave -noupdate /testbench/ensam/ensam/UP/mLb/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mLb/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mLb/d1
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mLb/d2
add wave -noupdate -divider mdato
add wave -noupdate /testbench/ensam/ensam/UP/mdato/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mdato/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/mdato/d1
add wave -noupdate -divider msec
add wave -noupdate /testbench/ensam/ensam/UP/msec/SEL
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/msec/d0
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/msec/d1
add wave -noupdate -divider Registros
add wave -noupdate -divider CP
add wave -noupdate /testbench/ensam/ensam/UP/CP/pe
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/CP/e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/CP/s
add wave -noupdate -divider CPinst
add wave -noupdate /testbench/ensam/ensam/UP/CPinst/pe
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/CPinst/e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/CPinst/s
add wave -noupdate -divider RI
add wave -noupdate /testbench/ensam/ensam/UP/RI/pe
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/RI/e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/RI/s
add wave -noupdate -divider RLDM
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/RLDM/e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/RLDM/s
add wave -noupdate -divider Rsec
add wave -noupdate /testbench/ensam/ensam/UP/Rsec/pe
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/Rsec/e
add wave -noupdate -radix hexadecimal /testbench/ensam/ensam/UP/Rsec/s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {800000 ps} 0}
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
WaveRestoreZoom {714922 ps} {992770 ps}
