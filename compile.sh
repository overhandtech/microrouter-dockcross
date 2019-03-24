# target:
# use docker image and create create specifically
docker run --rm dockcross/linux-mips > ./dockcross-linux-mips
chmod u+x dockcross-linux-mips 

# generate for mips32 and make sure we use the right interpreter
./dockcross-linux-mips bash -c '$CC -mips32 -Wl,-dynamic-linker,/lib/ld-musl-mips-sf.so.1 hello.c -o hello_mips'
