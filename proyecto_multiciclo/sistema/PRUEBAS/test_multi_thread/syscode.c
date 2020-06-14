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
	//Si usamos el atributo interrupt el compilador solo guarda
	//algunos registros. Si cambiasemos de proceso por interrupcion
	//de reloj, hemos de guardarlos todos.
	guardar_registros();

	//cambiamos el sp por el que hay en mscratch (kernel)
	asm("csrrw sp, mscratch, sp");

	//gestionamos el evento
	handle_trap();

	//cambiamos el sp por el que hay en mscratch (usuario)
	int pila_sistema = PILA_SYS;
	asm("csrrw sp, mscratch, sp");
	
	//restauramos registros y hacemos mret
	restaurar_registros();
	asm("mret");

}

void pinta_pantalla(unsigned int valor) {
	unsigned int *pantalla;
	for (pantalla = SRAM; pantalla < SRAM+SCREEN_SIZE; ++pantalla) {
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

void cambio_thread() {
	unsigned int *curThr = (unsigned int *)CUR_THREAD;
	unsigned int *oldTCB;
	unsigned int *newTCB;
	if (*curThr == 0) {
		*curThr = 1;
		oldTCB = (unsigned int *)TCB0;
		newTCB = (unsigned int *)TCB1;
	}
	else {
		*curThr = 0;
		oldTCB = (unsigned int *)TCB1;
		newTCB = (unsigned int *)TCB0;
	}
	unsigned int *oldTCB_CP = oldTCB - 0x100;
	unsigned int *oldTCB_SP = oldTCB_CP + 1;

	unsigned int *newTCB_CP = newTCB - 0x100;
	unsigned int *newTCB_SP = newTCB_CP + 1;
	
	int oldCP = read_csr(mepc);
	int oldSP = read_csr(mscratch);
        *oldTCB_CP = oldCP;
	*oldTCB_SP = oldSP;

	int newCP = *newTCB_CP;
	int newSP = *newTCB_SP;
	write_mepc(newCP);
	write_mscratch(newSP);

	//A cada cambio de thread pintamos azul la pantalla
	pinta_pantalla(VGA_BLUE);
}

void handle_interrupcion(int causa) {
	unsigned int *ptr;
	unsigned int tmp;
	switch(causa) {
		case causa_int_PS2:
			ptr = (unsigned int *) PS2_DATA_REG;
			tmp = *ptr;
			pinta_pantalla(VGA_GREEN);
			break;

		case causa_int_clk:
			
			cambio_thread();
			//obtenemos los valores de mtime
			ptr = (unsigned int *) MTIME_REG;
			unsigned int mtimel = *ptr;
			unsigned int mtimeh = *(ptr+1);

			//calculamos el nuevo mtimecmp
			ptr = (unsigned int *) MTIMECMP_REG;
			unsigned int mtimecmpl = mtimel += ciclos_reloj;
			unsigned int mtimecmph = mtimeh;
			//miramos si hay acarreo a la parte alta
			if (mtimecmpl < mtimel) mtimecmph += 1;
			//escribimos en mtimecmp
			*(ptr+1) = mtimecmph;
			*(ptr) = mtimecmpl;
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
	unsigned int *curThr = (unsigned int *)CUR_THREAD;
	switch(causa) {
		case causa_syscall:
			//Esta syscall se llama al final del calculo de cada thread
			//Aumentamos el contador de llamadas a sistema 
			ptr = (unsigned int *) CONT_ECALL;
			*ptr = *ptr + 1;
			if (*curThr == 0) {
				//Pintamos la pantalla de magenta 
				pinta_pantalla(VGA_RED | VGA_BLUE);
			}

			if (*curThr == 1) {
				//Pintamos la pantalla de amarillo 
				pinta_pantalla(VGA_RED | VGA_GREEN);
			}
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
