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

## How to compile mosquitto from scratch using microrouter-dockcross ##

### Requirements ###
* [microrouter-dockcross](https://github.com/overhandtech/microrouter-dockcross)
* [mosquitto](https://github.com/eclipse/mosquitto)
* [libwebsockets](https://github.com/warmcat/libwebsockets)

### Step-by-step ###

1. Preparing microrouter-dockcross
    *Git clone [microrouter-dockcross](https://github.com/overhandtech/microrouter-dockcross)
    *Access to the folder using the terminal
    *We need to execute setup-dockcross.sh using `./setup-dockcross.sh`
    *Open dockcross-linux-mips with a text editor and comment (using #) the following lines
~~~~
# Mount Additional Volumes
#if [ -z "$SSH_DIR" ]; then
#    SSH_DIR="$HOME/.ssh"
#fi

#HOST_VOLUMES=
#if [ -e "$SSH_DIR" ]; then
#    HOST_VOLUMES+="-v $SSH_DIR:/home/$(id -un)/.ssh"
#fi
~~~~
2. Preparing libwebsockets
    *Go to the parent folder (../) and clone [libwebsockets](https://github.com/warmcat/libwebsockets)
    *Access to the libwebsockets folder and copy prepare-libwebsockets.sh there `cp ../microrouter-dockcross/prepare-libwebsockets.sh ./`
    *Execute prepare-libwebsockets.sh: `./prepare-libwebsockets.sh`
3. Preparing mosquitto
    *Go to the parent folder (../) and clone [mosquitto](https://github.com/eclipse/mosquitto)
    *Access to the mosquitto folder and copy prepare-mosquitto.sh there `cp ../microrouter-dockcross/prepare-mosquitto.sh ./`
    *Execute prepare-mosquitto.sh: `./prepare-mosquitto.sh`


### Output ###
After make process is done, you will have the mosquitto file inside the src folder (inside mosquitto folder).
