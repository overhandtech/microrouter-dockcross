../microrouter-dockcross/dockcross-linux-mips make clean

# https://github.com/eclipse/mosquitto/issues/1209
../microrouter-dockcross/dockcross-linux-mips make \
	WITH_WEBSOCKETS=yes \
	WITH_TLS=no \
	WITH_UUID=no \
	WITH_DOCS=no \
	WITH_SHARED_LIBRARIES=no \
	WITH_TLS_PSK=no \
	WITH_SYS_TREE=no \
	CFLAGS="-mips32 -I../libwebsockets/include/ -I./" \
	LDFLAGS="-Wl,-dynamic-linker,/lib/ld-musl-mips-sf.so.1 -L/work/libwebsockets/lib -lwebsockets"
