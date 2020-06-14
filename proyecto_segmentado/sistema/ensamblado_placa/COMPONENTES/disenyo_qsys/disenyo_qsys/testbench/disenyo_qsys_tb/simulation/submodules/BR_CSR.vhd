library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


use work.constantes.all;
use work.tipos.all;
use work.retardos.all;
use work.BR_CSR_procedimientos_pkg.all;

entity BR_CSR is
	port(
		reloj, Pcero: in std_logic;
		
		ID, DE: in dato_camino;
		L: out dato_camino;
		
		peCSR, int_CSR, excep_CSR, mret_CSR: in std_logic;
		int_causa_CSR, excep_causa_CSR: in dato_camino;    

		--camino de datos - alteracion del flujo de interpretacion de instrucciones
		CP_s, CPinst_s: in dato_camino;		  --salida del registro CP y CPinst
		CP_e: out dato_camino;
		--camino de datos - entradas para mtval
		address: in mem_direcc;
		instr: in dato_camino;

		--salida registros CSR
		mstatus_s, mcause_s, mie_s, mip_s: out st_csr;
		modo_csr_s: out st_modo;
		
		--interrupciones
		irq: st_irq
		
	);
end BR_CSR;

architecture compor of BR_CSR is

signal modo_csr: st_modo;

--implementamos algunos csr, no todos. 
signal mstatus:  st_csr;  --0x300
signal mie:		  st_csr;  --0x304
signal mtvec:    st_csr;  --0x305
signal mscratch: st_csr;  --0x340
signal mepc:     st_csr;  --0x341
signal mcause:   st_csr;  --0x342
signal mtval:    st_csr;  --0x343
signal mip:		  st_csr;  --0x344

begin
esc: process(reloj, Pcero)
variable modelsim: boolean;
begin
	modelsim := true;
	if (rising_edge(reloj)) then
		
		if (Pcero = '1') then
			init_BR_CSR(modo_csr, mstatus, mtvec, mscratch, mepc, mtval, mie, mip, modelsim);
		else
		
			--actualizamos mip con las interrupciones pendientes
			mip(bMTIP) <= irq(IRQ_CLK);
			mip(bMEIP) <= irq(IRQ_PS2);
		
			--excepcion / interrupcion
			if (int_CSR = '1' or excep_CSR = '1') then
			
				--cambio a modo M
				cambio_modo_trap(modo_csr, mstatus);
				
				--priorizamos interrupcion a excepcion
				if (int_CSR = '1') then
					--si se produce tambien una excepcion guardamos la direccion de la instruccion actual
					if (excep_CSR = '1') then
						mepc <= CPinst_s;
					else
					--si no guardamos la siguiente
						mepc <= CP_s;
					end if;
					mcause <= int_causa_CSR;
					mtval <= (others => '0');
				
				--si se produce una excepcion guardamos la instruccion actual
				elsif (excep_CSR = '1' and excep_causa_CSR /= causa_syscall) then
					mepc <= CPinst_s;
					mcause <= excep_causa_CSR;
					if (excep_causa_CSR = causa_instrIlegal) then
						mtval <= instr;
					elsif (acceso_no_alineado(excep_causa_CSR)) then
						mtval <= address;
					else
						mtval <= (others => '0');
					end if;
				--si se produce una syscall guardamos la siguiente instruccion
				elsif (excep_CSR = '1') then
					mepc <= CP_s;
					mcause <= excep_causa_CSR;
					mtval <= (others => '0');
				end if;			
				
			end if;
				
			--cambiamos de modo debido a mret
			if (mret_CSR = '1') then
				cambio_modo_mret(modo_csr, mstatus);
			end if;

			--escritura en registros
			if (peCSR = '1') then
				case ID is
					when ID_mstatus =>
						mstatus <= DE;
					when ID_mie =>
						mie <= DE;
					when ID_mtvec =>
						mtvec <= DE;
					when ID_mscratch =>
						mscratch <= DE;
					when ID_mepc =>
						mepc <= DE;
					when ID_mcause =>
						mcause <= DE;
					when ID_mtval =>
						mtval <= DE;
					when ID_mip =>
						mip <= DE;
					when others =>
				end case;
			end if;
		end if;
		
	end if;
end process;

lec: process(mret_CSR, mepc, ID, mtvec, mstatus, mcause, mtval, mie, mscratch, mip)
variable v_CP_e, v_L: dato_camino;
begin
	v_CP_e := (others => '0');
	v_L := (others => '0');
	
	--lectura de registros, combinacional
	
	v_CP_e := mtvec;
	
	if (mret_CSR = '1') then
		v_CP_e := mepc;
	end if;

	--lectura de registros
	case ID is
		when ID_mstatus =>
			v_L := mstatus;
		when ID_mie =>
			v_L := mie;
		when ID_mtvec =>
			v_L := mtvec;
		when ID_mscratch =>
			v_L := mscratch;
		when ID_mepc =>
			v_L := mepc;
		when ID_mcause =>
			v_L := mcause;
		when ID_mtval =>
			v_L := mtval;
		when ID_mip =>
			v_L := mip;
		when others =>
			v_L := (others => '0');
	end case;
	
	L    <= v_L		after ret_br_csr;
	CP_e <= v_CP_e after ret_br_csr;

	
end process;

mstatus_s  <= mstatus  after ret_br_csr;
mcause_s   <= mcause   after ret_br_csr;
mie_s      <= mie      after ret_br_csr;
mip_s      <= mip      after ret_br_csr;
modo_csr_s <= modo_csr after ret_br_csr;

end;		
