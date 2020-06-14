--
--Gerard Candón Arenas, 2020
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use work.constantes.all;
use work.retardos.all;
use work.tipos.all;

entity fifo is
	port(
		reloj, Pcero: in std_logic;
		vaciado_fifo, val_peticion, listo_peticion, val_datos, listo_datos: in std_logic;
		CP_e, dato_e: in dato_camino;
		CP_s, dato_s: out dato_camino;
		val_s, fifo_llena: out std_logic
	);
end fifo;

architecture compor of fifo is
signal cola, cabeza_datos, cabeza_peticiones: std_logic_vector(4 downto 0);
type tipo_buffer is array (31 downto 0) of std_logic_vector (31 downto 0);
signal buff_CP: tipo_buffer;
signal buff_datos: tipo_buffer;
signal buff_val: std_logic_vector(31 downto 0);
signal s_fifo_llena, s_fifo_vacia: std_logic;
begin

buff: process(reloj)
variable v_cola, v_cabeza_datos, v_cabeza_peticiones: std_logic_vector(4 downto 0);
begin

	if (rising_edge(reloj)) then
		v_cola := cola;
		v_cabeza_datos := cabeza_datos;
		v_cabeza_peticiones := cabeza_peticiones;
		
		if (Pcero = '1') then
			v_cola := (others => '0');
			v_cabeza_datos := (others => '0');
			v_cabeza_peticiones := (others => '0');
			buff_val <= (others => '0');
		end if;
		
		if (vaciado_fifo = '1') then
			buff_val <= (others => '0');
		end if;
		
		--Se lee un dato del buffer
		if (listo_datos = '1' and (s_fifo_vacia = '0' or (s_fifo_vacia = '1' and val_datos = '1'))) then
			buff_val(to_integer(unsigned(v_cola))) <= '0';
			v_cola := v_cola + 1;
		end if;
		
		--Se escribe un dato en el buffer
		if (val_datos = '1') then
			buff_datos(to_integer(unsigned(v_cabeza_datos))) <= dato_e;
			v_cabeza_datos := v_cabeza_datos + 1;
		end if;
		
		--Se acepta una peticion en memoria
		if (val_peticion = '1' and listo_peticion = '1') then
			buff_CP(to_integer(unsigned(v_cabeza_peticiones))) <= CP_e;
			buff_val(to_integer(unsigned(v_cabeza_peticiones))) <= '1';
			v_cabeza_peticiones := v_cabeza_peticiones + 1;
		end if;
		
		cola <= v_cola;
		cabeza_datos <= v_cabeza_datos;
		cabeza_peticiones <= v_cabeza_peticiones;
	end if;
end process;

lec: process(cola, cabeza_datos, buff_datos, buff_CP, buff_val, dato_e, s_fifo_vacia)
variable v_val_s: std_logic;
variable v_dato_s: dato_camino;
begin
	v_val_s := '0';
	v_dato_s := (others => '0');
	--multiplexor para no anadir etapa adicional
	if (s_fifo_vacia = '0') then
		v_dato_s := buff_datos(to_integer(unsigned(cola)));
	else --buffer vacio
		v_dato_s := dato_e;
	end if;
	v_val_s := buff_val(to_integer(unsigned(cola)));
	CP_s <= buff_CP(to_integer(unsigned(cola)));
	dato_s <= v_dato_s;
	val_s <= v_val_s;
end process;

estado: process(cabeza_peticiones, cabeza_datos, cola)
variable v_cabeza_peticiones_mas_1: std_logic_vector(4 downto 0);
variable v_fifo_llena, v_fifo_vacia: std_logic;
begin
	v_fifo_llena := '0';
	v_fifo_vacia := '0';
	v_cabeza_peticiones_mas_1 := cabeza_peticiones + 1;
	if (v_cabeza_peticiones_mas_1 = cola) then
		v_fifo_llena := '1';
	end if;
	if (cabeza_datos = cola) then
		v_fifo_vacia := '1';
	end if;
	
	s_fifo_llena <= v_fifo_llena;
	s_fifo_vacia <= v_fifo_vacia;
end process;

fifo_llena <= s_fifo_llena;

end;		
