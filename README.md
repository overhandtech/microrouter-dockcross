# Running mosquitto with websockets support on microrouter

## Overview

* we want to bridge incoming mqtt packets from trackers to browser (as a websockets)
* mosquitto opkg does not support websockets
* we explain how to configure, build and test mosquitto with websockets support on the microrouter

## diagram

![diagram](https://static.swimlanes.io/f51c583b8c2d928ed03cb3b24273f0f2.png)

## running mosquitto on the microrouter

### building

see MOSQUITTO.md to build from scratch

We've committed a prebuilt version for the microrouter:

```
$ file mosquitto
mosquitto: ELF 32-bit MSB executable, MIPS, MIPS32 version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-mips-sf.so.1, for GNU/Linux 4.10.8, with debug_info, not strippe
```

### setup of microrouter

trackers expect to talk to 11.0.0.2

On the microrouter Admin > LAN > General Setup, change IP to 11.0.0.2:

http://11.0.0.1/cgi-bin/luci/admin/network/network/lan

save and apply unchecked. reboot

### copy and run

* install openwrt manufacturer mosquitto package (we'll use their service and user setup)
  * ```opkg install mosquitto```
* override the executable (in mosquitto, this is in src/mosquitto)
  * ```scp mosquitto root@11.0.0.2:/usr/sbin/mosquitto```
* override the config file
  * ```scp mosquitto.conf root@11.0.0.2:/etc/mosquitto/mosquitto.conf```
* reboot and test https://github.com/overhandtech/oh-algorithm-js

