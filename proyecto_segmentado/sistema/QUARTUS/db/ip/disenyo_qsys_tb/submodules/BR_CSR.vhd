library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


use work.constantes.all;
use work.tipos.all;
use work.BR_CSR_procedimientos_pkg.all;

entity BR_CSR is
	port(
		reloj, Pcero: in std_logic;
		
		ID, DE: in dato_camino;
		L: out dato_camino;
		
		peCSR, int_CSR, excep_CSR, mret_CSR: in std_logic;
		int_causa_CSR, excep_causa_CSR: in dato_camino;    

		CP_s, CPinst_s: in dato_camino;		  --salida del registro CP y CPinst
		
		mstatus_s: out dato_camino;  --conectado al controlador de interrupciones
		mcause_s: out dato_camino;   --conectado al gestor de eventos
		CP_e: out dato_camino;		  --entrada al registro CP
		
		--lectura y escritura mapeada en memoria
		read_csr, write_csr: in std_logic;
		byteenable_csr: in st_byteenable;
		writedata_csr: in dato_camino;
		readdata_csr: out dato_camino;
		address: in mem_direcc;
		
		--interrupciones reloj
		int_clk: in std_logic;
		mtime_s, mtimecmp_s: out st_csr_64;
		mie_s, mip_s: out st_csr
	);
end BR_CSR;

architecture compor of BR_CSR is

signal modo: st_modo;

--implementamos algunos csr, no todos. 
signal mstatus:  st_csr;  --0x300
signal mie:		  st_csr;  --0x304
signal mtvec:    st_csr;  --0x305
signal mscratch: st_csr;  --0x340
signal mepc:     st_csr;  --0x341
signal mcause:   st_csr;  --0x342
signal mip:		  st_csr;  --0x344

--registros mapeados en memoria
signal mtime:	 st_csr_64; --0x9000000
signal mtimecmp:st_csr_64; --0x9000008

signal mtime_mas1: st_csr_64;

constant zero: std_logic_vector(tam_csr-1 downto 0) := (others => '0');
constant zero_64: std_logic_vector(tam_csr_64-1 downto 0) := (others => '0');

begin

mtime_mas1 <= mtime + x"0000000000000001";

esc: process(reloj, Pcero)
begin
	
	if (rising_edge(reloj)) then
		
		if (Pcero = '1') then
			modo <= modo_M;
			mstatus <= zero;
			mstatus(MPIE) <= '1';
			mtvec <= x"04000000";	-- rutina de tratamiento de interrupciones
			--mtvec <= x"00000014"; --para modelsim
			mscratch <= x"07000000";
			--mepc <= x"00000008" -- para modelsim
			mepc <= x"0000024c";
			mie <= zero;
			mie(MTIE) <= '1';
			mip <= zero;
			mtime <= zero_64;
			mtimecmp <= x"0000000000010000";
			
		else
			
			--incrementamos mtime
			mtime <= mtime_mas1;
			
			--si CLINT lanza una interrupcion de reloj, reseteamos mtime y
			--la ponemos pendiente en mip
			if (int_clk = '1') then
				mip(MTIP) <= '1';
				mtime <= zero_64;
			end if;
		
			if (int_CSR = '1' or excep_CSR = '1') then
			
				--cambio a modo M
				cambio_modo_trap(modo, mstatus);
				
				--decidimos cual sera la direccion cuando se vuelva de la interrupcion/excepcion
				if (int_CSR = '1') then
					if (excep_CSR = '1') then
						mepc <= CPinst_s;
					else
						mepc <= CP_s;
					end if;
					mcause <= int_causa_CSR;
					
				elsif (excep_CSR = '1') then
					mepc <= CPinst_s;
					mcause <= excep_causa_CSR;
				end if;			
				
			end if;
				
			--cambiamos de modo debido a mret
			if (mret_CSR = '1') then
				cambio_modo_mret(modo, mstatus);
			end if;
			
			--escritura en registros
			if (peCSR = '1') then
				case ID is
					when ID_mstatus =>
						mstatus <= DE;
					when ID_mtvec =>
						mtvec <= DE;
					when ID_mepc =>
						mepc <= DE;
					when ID_mcause =>
						mcause <= DE;
					when others =>
				end case;
			end if;
			
			--LECTURA Y ESCRITURA MAPEADA EN MEMORIA, SINCRONAS AMBAS
			--escritura en registros mapeados en memoria
			if (write_csr = '1') then
				case address is
					when DIR_mtimel =>
						esc_csr_mm(writedata_csr, byteenable_csr, mtime(31 downto 0));
					when DIR_mtimeh =>
						esc_csr_mm(writedata_csr, byteenable_csr, mtime(63 downto 32));
					when DIR_mtimecmpl =>
						esc_csr_mm(writedata_csr, byteenable_csr, mtimecmp(31 downto 0));
						mip(MTIP) <= '0';
					when DIR_mtimecmph =>
						esc_csr_mm(writedata_csr, byteenable_csr, mtimecmp(63 downto 32));
						mip(MTIP) <= '0';
					when others =>
				end case;
			end if;
			
			--lectura de registros mapeados en memoria
			if (read_csr = '1') then
				case address is
					when DIR_mtimel =>
						readdata_csr <= mtime(31 downto 0);
					when DIR_mtimeh =>
						readdata_csr <= mtime(63 downto 32);
					when DIR_mtimecmpl =>
						readdata_csr <= mtimecmp(31 downto 0);
					when DIR_mtimecmph =>
						readdata_csr <= mtimecmp(63 downto 32);
					when others =>
						readdata_csr <= zero;
				end case;
			end if;
			
		end if;
		
	end if;
end process;

lec: process(mret_CSR, mepc, ID, mtvec, mstatus, mcause)
begin
	
	--lectura de registros, combinacional
	
	CP_e <= mtvec;
	
	if (mret_CSR = '1') then
		CP_e <= mepc;
	end if;
	
	--lectura de registros
	case ID is
		when ID_mstatus =>
			L <= mstatus;
		when ID_mtvec =>
			L <= mtvec;
		when ID_mepc =>
			L <= mepc;
		when ID_mcause =>
			L <= mcause;
		when others =>
			L <= zero;
	end case;

	
end process;

mstatus_s <= mstatus;
mcause_s <= mcause;
mie_s <= mie;
mip_s <= mip;
mtime_s <= mtime;
mtimecmp_s <= mtimecmp;

end;		
