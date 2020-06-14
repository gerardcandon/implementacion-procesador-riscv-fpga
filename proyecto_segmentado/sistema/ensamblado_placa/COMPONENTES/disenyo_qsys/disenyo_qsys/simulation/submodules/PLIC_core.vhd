library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


use work.constantes.all;
use work.tipos.all;

entity PLIC_core is
	port(
		reloj, Pcero: in std_logic;
		int_req, int_claim: in std_logic_vector(tam_irq-1 downto 0);
		int: out std_logic;
		mstatus: in dato_camino;
		int_causa: out dato_camino
	);
end PLIC_core;

architecture compor of PLIC_core is

component latch1r is							
	port (reloj, Pcero: in std_logic;
			r, e: in std_logic;
         s: out std_logic);
end component;

component mayorque is							
	port (	
		a, b: in dato_camino;
      s: out std_logic
	);
end component;

component mux2_32 is
   port (d0, d1: in dato_camino;
	SEL: in st_mx2_sel;
	s: out dato_camino);
end component;

type datos_tam_irq is array (0 to tam_irq) of dato_camino;
type datos_tam_irq_menos_1 is array (0 to tam_irq-1) of dato_camino;
signal IE, IP_s, mayorque_s: std_logic_vector(tam_irq-1 downto 0);
signal priority, andIP, andIE: datos_tam_irq_menos_1;
signal mx_1_e, mx_2_e: datos_tam_irq;
signal threshold: dato_camino;
constant zero: dato_camino := x"00000000";
begin

	mx_1_e(0) <= zero;
	mx_2_e(0) <= zero;
	threshold <= zero;
	IE <= (others => mstatus(3));
	
	iloop: for i in 0 to tam_irq-1 generate
		priority(i) <= std_logic_vector(to_unsigned(i+1, tam_dato_camino));
		ands: for j in 0 to tam_dato_camino-1 generate
			andIP(i)(j) <= priority(i)(j) and IP_s(i);
			andIE(i)(j) <= andIP(i)(j) and IE(i);
		end generate;
		
		IP: latch1r port map(reloj => reloj, Pcero => Pcero, r => int_claim(i), e => int_req(i),
									s => IP_s(i));
		mq: mayorque port map(a => andIE(i), b => mx_1_e(i), s => mayorque_s(i));
		mx_1: mux2_32 port map(d0 => mx_1_e(i), d1 => andIP(i),
									  SEL => mayorque_s(i), s => mx_1_e(i+1));
		mx_2: mux2_32 port map(d0 => mx_2_e(i), d1 => std_logic_vector(to_unsigned(i+1, tam_dato_camino)),
									  SEL => mayorque_s(i), s => mx_2_e(i+1));
	end generate;
	
	mq_final: mayorque port map (a => mx_1_e(tam_irq), b => threshold, s => int);
	
	--forzamos el bit de mayor peso a 1 para indicar que es una interrupcion
	int_causa <= '1' & mx_2_e(tam_irq)(tam_dato_camino-2 downto 0);

end;
