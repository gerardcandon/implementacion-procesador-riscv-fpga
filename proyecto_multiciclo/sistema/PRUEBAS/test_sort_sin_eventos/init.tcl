set master [claim_service "master" [lindex [get_service_paths "master"] 0] ""]; 
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_multiciclo/sistema/PRUEBAS/test_sort_sin_eventos/sort_sin_eventos_imem.bin 0x00000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_multiciclo/sistema/PRUEBAS/test_sort_sin_eventos/sort_sin_eventos_dmem.bin 0x02000000;
master_write_from_file $master /home/gerard/Desktop/clase/TFG/proyecto_multiciclo/sistema/PRUEBAS/test_sort_sin_eventos/sort_sin_eventos_sysmem.bin 0x04000000;
