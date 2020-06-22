set master [claim_service "master" [lindex [get_service_paths "master"] 0] ""]; 
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_multiciclo/sistema/PRUEBAS/test_base_4_tot_alu_multihilo/base_4_tot_alu_multihilo_imem.bin 0x00000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_multiciclo/sistema/PRUEBAS/test_base_4_tot_alu_multihilo/base_4_tot_alu_multihilo_dmem.bin 0x02000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_multiciclo/sistema/PRUEBAS/test_base_4_tot_alu_multihilo/base_4_tot_alu_multihilo_sysmem.bin 0x04000000;
