# mosquitto with websockets on microrouter

### cross-compilation of mosquitto

see prepare-mosquitto.sh

cleaning:

```
../microrouter-dockcross/dockcross-linux-mips make clean
```

...depends on:

### cross-compilation of Websockets

see prepare-websockets.sh

...OPTIONALLY depends on:

### cross-compilation of OpenSSL

```
../../../microrouter-dockcross/dockcross-linux-mips ./Configure linux-mips32
../../../microrouter-dockcross/dockcross-linux-mips make
```

