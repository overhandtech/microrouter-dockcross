../microrouter-dockcross/dockcross-linux-mips make clean
../microrouter-dockcross/dockcross-linux-mips make \
	WITH_WEBSOCKETS=yes \
	WITH_SRV=no \
	WITH_UUID=no \
	WITH_TLS=no \
	WITH_TLS_PSK=no \
	WITH_THREADING=no \
	WITH_DOCS=no \
	WITH_SHARED_LIBRARIES=no \
	WITH_EPOLL=no \
	WITH_SOCKS=no \
	WITH_DOCS=no \
	WITH_EC=no \
	WITH_BRIDGE=no \
	WITH_BROKER=no \
	WITH_PERSISTENCE=no \
	WITH_MEMORY_TRACKING=no \
	WITH_SYS_TREE=no \
	CFLAGS="-mips32 -I../libwebsockets/include/" \
	LDFLAGS="-Wl,-dynamic-linker,/lib/ld-musl-mips-sf.so.1 -L/work/libwebsockets/lib -lwebsockets"
