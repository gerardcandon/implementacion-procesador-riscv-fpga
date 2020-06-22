//CSRs
#define mstatus  0x300
#define mscratch 0x340
#define mepc     0x341
#define mcause   0x342

//direcciones
#define DATA_SYS     0x0d000000
#define PILA_SYS     0x07000000 
#define PS2_DATA_REG 0x08000000
#define SRAM	     0x08200000
#define SRAM_SIZE    0x0012c000
#define MTIME_REG    0x09000000
#define MTIMECMP_REG 0x09000008

#define TCB0	     0x03000000
#define TCB0_CP	     0x03000404
#define TCB0_SP      0x03000408
#define TCB1	     0x03000500
#define TCB1_CP      0x03000904
#define TCB1_SP      0x03000908

#define CUR_THREAD   0x06000000

//interrupciones
#define causa_int_PS2 1
#define causa_int_clk 2

//excepciones
#define causa_instrIlegal       1
#define causa_instrNoAlineada   2
#define causa_instrFueraDeRango 3
#define causa_instrProtegida    4
#define causa_instrPrivilegiada 5
#define causa_loadNoAlineado    6
#define causa_loadFueraDeRango  7
#define causa_loadProtegido     8
#define causa_storeNoAlineado   9
#define causa_storeFueraDeRango 10
#define causa_storeProtegido    11
#define causa_syscall           12

//registros
#define sp "x2"

//constantes
#define CICLOS_RELOJ 50000000
#define VGA_BLUE    0x000003ff
#define VGA_GREEN   0x000ffc00
#define VGA_RED     0x3ff00000
#define SCREEN_SIZE 0x0012c000
