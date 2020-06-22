#include "defines.h"
#include "syscode.h"


inline int read_csr(const int csr_num){
	int result;
	asm ("csrr %0, %1" : "=r"(result) : "i"(csr_num));
	return result;
}

inline void write_mstatus(int dato_escritura) {
	int tmp = dato_escritura;
	asm ("csrw mstatus, %0" : "=r"(dato_escritura));
	dato_escritura = tmp;
}

inline void write_mepc (int dato_escritura) {
	int tmp = dato_escritura;
	asm ("csrw mepc, %0" : "=r"(dato_escritura));
	dato_escritura = tmp;
}

inline void write_mscratch (int dato_escritura) {
	int tmp = dato_escritura;
	asm ("csrw mscratch, %0" : "=r"(dato_escritura));
	dato_escritura = tmp;
}


void entry_trap() {
	//salvaguardamos los registros
	guardar_registros();

	//cambiamos el sp por el que hay en mscratch (kernel)
	asm("csrrw sp, mscratch, sp");

	//gestionamos el evento
	handle_trap();

	//cambiamos el sp por el que hay en mscratch (usuario)
	asm("csrrw sp, mscratch, sp");
	
	//restauramos registros y hacemos mret
	restaurar_registros();
	asm("mret");

}

void pinta_pantalla(unsigned int valor) {
	unsigned int *pantalla;
	for (pantalla = SRAM; pantalla < SRAM+SRAM_SIZE; ++pantalla) {
		*pantalla = valor;
	}
}

void handle_trap() {

	unsigned int causa;
	causa = read_csr(mcause);

	unsigned int inter = causa >> 31;
	causa &= 0x7FFFFFFF;

	if (inter == 1) {
		handle_interrupcion(causa);
	}

	else {
		handle_excepcion(causa);
	}

}

void handle_interrupcion(int causa) {
	switch(causa) {
		case causa_int_PS2:;
			unsigned int *ps2_data;
			ps2_data = PS2_DATA_REG;
			unsigned int dato = (*ps2_data) & 0x000000FF; //Tecla pulsada

			pinta_pantalla(dato);

			break;

		case causa_int_clk:
			pinta_pantalla(VGA_BLUE);

			unsigned int *mtime;
			unsigned int *mtimecmp;

			//obtenemos los valores de mtime
			mtime = MTIME_REG;
			unsigned int mtimel = *mtime;
			mtime = MTIME_REG+4;
			unsigned int mtimeh = *mtime;

			//calculamos el nuevo mtimecmp
			mtimecmp = MTIMECMP_REG;
			unsigned int mtimecmpl = mtimel += CICLOS_RELOJ;
			unsigned int mtimecmph = mtimeh;
			//miramos si hay acarreo a la parte alta
			if (mtimecmpl < mtimel) mtimecmph += 1;
			//escribimos en mtimecmp
			*mtimecmp = mtimecmpl;
			mtimecmp = MTIMECMP_REG+4;
			*mtimecmp = mtimecmph;

			
			break;
		default:
			//algo ha salido mal, pintamos de rojo la pantalla
			pinta_pantalla(VGA_RED);
			while(1);
			break;
	}
}

void handle_excepcion(int causa) {

	unsigned int *ptr;
	switch(causa) {
		case causa_syscall:
			//Pintamos la pantalla de magenta 
			pinta_pantalla(VGA_RED | VGA_BLUE);
			break;
		default:
			//excepcion no recuperable, pintamos de rojo la pantalla
			pinta_pantalla(VGA_RED);
			while(1);
			break;
	}
}

inline void guardar_registros(void) {
	asm("addi sp, sp, -124");
	asm("sw x1, 0(sp)");
	asm("sw x3, 8(sp)");
	asm("sw x4, 12(sp)");
	asm("sw x5, 16(sp)");
	asm("sw x6, 20(sp)");
	asm("sw x7, 24(sp)");
	asm("sw x8, 28(sp)");
	asm("sw x9, 32(sp)");
	asm("sw x10, 36(sp)");
	asm("sw x11, 40(sp)");
	asm("sw x12, 44(sp)");
	asm("sw x13, 48(sp)");
	asm("sw x14, 52(sp)");
	asm("sw x15, 56(sp)");
	asm("sw x16, 60(sp)");
	asm("sw x17, 64(sp)");
	asm("sw x18, 68(sp)");
	asm("sw x19, 72(sp)");
	asm("sw x20, 76(sp)");
	asm("sw x21, 80(sp)");
	asm("sw x22, 84(sp)");
	asm("sw x23, 88(sp)");
	asm("sw x24, 92(sp)");
	asm("sw x25, 96(sp)");
	asm("sw x26, 100(sp)");
	asm("sw x27, 104(sp)");
	asm("sw x28, 108(sp)");
	asm("sw x29, 112(sp)");
	asm("sw x30, 116(sp)");
	asm("sw x31, 120(sp)");
}

inline void restaurar_registros(void) {
	asm("lw x1, 0(sp)");
	asm("lw x3, 8(sp)");
	asm("lw x4, 12(sp)");
	asm("lw x5, 16(sp)");
	asm("lw x6, 20(sp)");
	asm("lw x7, 24(sp)");
	asm("lw x8, 28(sp)");
	asm("lw x9, 32(sp)");
	asm("lw x10, 36(sp)");
	asm("lw x11, 40(sp)");
	asm("lw x12, 44(sp)");
	asm("lw x13, 48(sp)");
	asm("lw x14, 52(sp)");
	asm("lw x15, 56(sp)");
	asm("lw x16, 60(sp)");
	asm("lw x17, 64(sp)");
	asm("lw x18, 68(sp)");
	asm("lw x19, 72(sp)");
	asm("lw x20, 76(sp)");
	asm("lw x21, 80(sp)");
	asm("lw x22, 84(sp)");
	asm("lw x23, 88(sp)");
	asm("lw x24, 92(sp)");
	asm("lw x25, 96(sp)");
	asm("lw x26, 100(sp)");
	asm("lw x27, 104(sp)");
	asm("lw x28, 108(sp)");
	asm("lw x29, 112(sp)");
	asm("lw x30, 116(sp)");
	asm("lw x31, 120(sp)");
	asm("addi sp, sp, 124");
}
