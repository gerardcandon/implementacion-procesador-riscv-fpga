set master [claim_service "master" [lindex [get_service_paths "master"] 0] ""]; 
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_segmentado/sistema/PRUEBAS/test_char_sort/char_sort_imem.bin 0x00000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_segmentado/sistema/PRUEBAS/test_char_sort/char_sort_dmem.bin 0x04000000;
