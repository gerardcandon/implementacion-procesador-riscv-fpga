set master [claim_service "master" [lindex [get_service_paths "master"] 0] ""]; 
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_segmentado/sistema/PRUEBAS/test_suma_ulonglong64/suma_ulonglong64_imem.bin 0x00000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_segmentado/sistema/PRUEBAS/test_suma_ulonglong64/suma_ulonglong64_dmem.bin 0x04000000;