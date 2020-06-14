library ieee;
use ieee.std_logic_1164.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity acceso_B is
	port(
		reloj, Pcero: in std_logic;
		inyec_B, mval_B, bloq_DL, waitrequest, readvalid: in std_logic;
		busqueda_en_curso, peRBuffer, anula_read_B: out std_logic;
		mbuffer_sel: out st_mx2_sel
	);
end acceso_B;

architecture compor of acceso_B is
signal estado, prx_estado: st_acceso_B_estado;
begin

rlj: process(Pcero, reloj)
variable v_estado: st_acceso_B_estado;
begin
	if Pcero = '1' then
		v_estado := ACCESO_B_ESPERA;
	elsif rising_edge(reloj) then
		v_estado := prx_estado;
	end if;
	estado <= v_estado after ret_estado;
end process;

prx_esta: process(estado, waitrequest, readvalid, mval_B, bloq_DL, inyec_B)
variable v_prx_estado: st_acceso_B_estado;

begin
	v_prx_estado := ACCESO_B_ESPERA;
	
	if (inyec_B /= '1') then
		
		case estado is
			when ACCESO_B_ESPERA =>
				if (mval_B = '1' and waitrequest = '0') then
					v_prx_estado := ACCESO_B_LD;
				end if;
			
			when ACCESO_B_LD =>
				if (readvalid = '1' and bloq_DL = '1') then
					v_prx_estado := ACCESO_B_BUFFER;
				elsif (readvalid = '1' and bloq_DL = '0') then
					if (mval_B = '1' and waitrequest = '0') then
						v_prx_estado := ACCESO_B_LD;
					else
						v_prx_estado := ACCESO_B_ESPERA;
					end if;
				else
					v_prx_estado := ACCESO_B_LD;
				end if;
			
			when ACCESO_B_BUFFER =>
				if (bloq_DL = '0') then
					if (mval_B = '1' and waitrequest = '0') then
						v_prx_estado := ACCESO_B_LD;
					else
						v_prx_estado := ACCESO_B_ESPERA;
					end if;
				else
					v_prx_estado := ACCESO_B_BUFFER;
				end if;
			
			when others =>
		end case;
	
	else
		--Se ha vaciado la segmentacion
		if (mval_B = '1' and waitrequest = '0') then
			v_prx_estado := ACCESO_B_LD;
		else
			v_prx_estado := ACCESO_B_ESPERA;
		end if;
	end if;
	prx_estado <= v_prx_estado;
end process;

logica_salida: process(estado, readvalid, bloq_DL, inyec_B)
variable v_busqueda_en_curso, v_peRBuffer, v_anula_read_B: std_logic;
variable v_mbuffer_sel: st_mx2_sel;

begin

	v_busqueda_en_curso:= '0';
	v_anula_read_B     := '0';
	v_peRBuffer        := '0';
	v_mbuffer_sel      := '0';
		
	if (inyec_B /= '1') then
		case estado is
			when ACCESO_B_ESPERA =>
			
			when ACCESO_B_LD =>
				if (readvalid = '1' and bloq_DL = '1') then
					v_anula_read_B := '1';
					v_peRBuffer := '1';
				elsif (readvalid = '0') then
					v_busqueda_en_curso := '1';
					v_anula_read_B := '1';
				end if;
				
			when ACCESO_B_BUFFER =>
				v_mbuffer_sel := '1';
				if (bloq_DL = '1') then
					v_anula_read_B := '1';
				end if;
				
		end case;
	end if;
	
	anula_read_B      <= '0';
	busqueda_en_curso <= v_busqueda_en_curso;
	peRBuffer         <= v_peRBuffer;
	mbuffer_sel       <= v_mbuffer_sel;
	
end process;
end;		