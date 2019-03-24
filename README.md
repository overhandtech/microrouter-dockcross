# cross-compiling to the GL-USB150 microrounter 

https://github.com/dockcross/dockcross 

```
root@GL-USB150:~# cat /proc/cpuinfo 
system type		: Atheros AR9330 rev 1
machine			: GL.iNet GL-USB150
processor		: 0
cpu model		: MIPS 24Kc V7.4
BogoMIPS		: 265.42
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 16
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VCED exceptions		: not available
VCEI exceptions		: not available
```

## executable file format

```
ELF 32-bit MSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-mips-sf.so.1
```

see the compile.sh for the example
