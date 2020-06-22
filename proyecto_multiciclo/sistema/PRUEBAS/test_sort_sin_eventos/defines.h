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
#define TCB1	     0x03000800

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
#define VGA_BLUE  0x000003ff
#define VGA_GREEN 0x000ffc00
#define VGA_RED   0x3ff00000

//scan codes
#define KEY_A 0x1C
#define KEY_B 0x32
#define KEY_C 0x21
#define KEY_D 0x23
#define KEY_E 0x24
#define KEY_F 0x2B
#define KEY_G 0x34
#define KEY_H 0x33
#define KEY_I 0x43
#define KEY_J 0x3B
#define KEY_K 0x42
#define KEY_L 0x4B
#define KEY_M 0x3A
#define KEY_N 0x31
#define KEY_O 0x44
#define KEY_P 0x4D
#define KEY_Q 0x15
#define KEY_R 0x2D
#define KEY_S 0x1B
#define KEY_T 0x2C
#define KEY_U 0x3C
#define KEY_V 0x2A
#define KEY_W 0x1D
#define KEY_X 0x22
#define KEY_Y 0x35
#define KEY_Z 0x1A
#define KEY_0 0x45
#define KEY_1 0x16
#define KEY_2 0x1E
#define KEY_3 0x26
#define KEY_4 0x25
#define KEY_5 0x2E
#define KEY_6 0x36
#define KEY_7 0x3D
#define KEY_8 0x3E
#define KEY_9 0x46
