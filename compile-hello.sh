# generate for mips32 and make sure we use the right interpreter
./dockcross-linux-mips bash -c '$CC -mips32 -Wl,-dynamic-linker,/lib/ld-musl-mips-sf.so.1 hello.c -o hello_mips'
