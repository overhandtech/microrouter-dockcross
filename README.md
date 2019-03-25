# Running mosquitto with websockets support on microrouter

## Overview

* we want to bridge incoming mqtt packets from trackers to browser (as a websockets)
* mosquitto opkg does not support websockets
* we explain how to configure, build and test mosquitto with websockets support on the microrouter

## cross-compiling to the GL-USB150 microrouter 

### using dockcross

https://github.com/dockcross/dockcross 

### platform info


uname

```
root@GL-USB150:~# uname -a
Linux GL-USB150 4.9.120 #0 Thu Aug 16 07:51:15 2018 mips GNU/Linux
```

openwrt

```
root@GL-USB150:~# cat /etc/openwrt_release 
DISTRIB_ID='OpenWrt'
DISTRIB_RELEASE='18.06.1'
DISTRIB_REVISION='r7258-5eb055306f'
DISTRIB_TARGET='ar71xx/generic'
DISTRIB_ARCH='mips_24kc'
DISTRIB_DESCRIPTION='OpenWrt 18.06.1 r7258-5eb055306f'
DISTRIB_TAINTS='busybox'
```

cpuinfo

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

### executable file format

```
ELF 32-bit MSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-mips-sf.so.1
```

### cross-compilation

see the compile.sh for the example

### cross-compilation of mosquitto

```
cd ../mosquitto
../microrouter-dockcross/dockcross-linux-mips make WITH_WEBSOCKETS=yes WITH_SRV=no WITH_UUID=no WITH_TLS=no WITH_DOCS=no CFLAGS="-mips32 -I../libwebsockets/include/" LDFLAGS="-Wl,-dynamic-linker,/lib/ld-musl-mips-sf.so.1 -L/work/libwebsockets/lib -lwebsockets"
scp ./src/mosquitto root@11.0.0.1:
scp ../oh-algorithm-js/mosquitto.conf root@11.0.0.1:
```

cleaning:

```
../microrouter-dockcross/dockcross-linux-mips make clean
```

...depends on:

### cross-compilation of Websockets

without SSL:

```
../../microrouter-dockcross/dockcross-linux-mips bash -c "cmake -DLWS_WITH_SSL=OFF -DLWS_WITH_SHARED=OFF -DLWS_HAVE_MALLOC_TRIM=OFF"
../../microrouter-dockcross/dockcross-linux-mips make
```

with SSL (fails with some incomplete type error):


```LWS_WITH_SSL
../../microrouter-dockcross/dockcross-linux-mips bash -c "cmake -DOPENSSL_ROOT_DIR=/work/openssl -DOPENSSL_SSL_LIBRARY=/work/openssl/lib -DOPENSSL_CRYPTO_LIBRARY=/work/openssl/lib -DOPENSSL_INCLUDE_DIR=/work/openssl/include"```
../../microrouter-dockcross/dockcross-linux-mips make
```

...depends on:

### cross-compilation of OpenSSL

```
../../../microrouter-dockcross/dockcross-linux-mips ./Configure linux-mips32
../../../microrouter-dockcross/dockcross-linux-mips make
```


## running mosquitto on the microrouter

### copy and run

* install openwrt manufacturer mosquitto package (we'll use their service and user setup)
  * ```opkg install mosquitto``
* override the executable
  * ```scp src/mosquitto root@11.0.0.2:/usr/sbin/mosquitto```
* override the config file
  * ```scp mosquitto.conf root@11.0.0.2:/etc/mosquitto/mosquitto.conf
* reboot and test https://github.com/overhandtech/oh-algorithm-js

### setup

trackers expect to talk to 11.0.0.2

On the microrouter Admin > LAN > General Setup, change IP to 11.0.0.2:

http://11.0.0.1/cgi-bin/luci/admin/network/network/lan

save and apply unchecked. reboot

