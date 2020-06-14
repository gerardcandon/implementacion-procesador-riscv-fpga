set master [claim_service "master" [lindex [get_service_paths "master"] 0] ""]; 
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_segmentado/sistema/PRUEBAS/test_base_2_tot_alu/base_2_tot_alu_imem.bin 0x00000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_segmentado/sistema/PRUEBAS/test_base_2_tot_alu/base_2_tot_alu_dmem.bin 0x04000000;
