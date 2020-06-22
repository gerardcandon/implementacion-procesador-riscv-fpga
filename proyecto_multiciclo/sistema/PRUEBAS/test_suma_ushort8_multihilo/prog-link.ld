__stack_size__ = 0x400; /* 1k stack */
__mem_top__ = 0x3000000;

__sp = __mem_top__;
__heap_top__ = __mem_top__ - __stack_size__;
__sp_bottom = __heap_top__;

SECTIONS
{
. = 0x00000000; /* IMEM address */

.text.inici : { init.o(.text) }

. = 0x02000000; /* DMEM address */
.data : { *(.bss)
         *(.data)
	 *(.sdata)
         *(.rodata)
         *(.got.plt) *(.got) }
_gp = ALIGN(16) + 0x7ff0;

. = 0x04000000; /* IMEM SYS address */

.text.sys : { syscode.o(.text) }

.= 0x100;
.text : { * (.text) }

__heap = ALIGN(0x4); /*64-bit alligned heap pointer */
}

