---
title: Pivot Notes
description: Notes about networks and how to pivot
tags:
  - pivot
categories:
  - SOHOplessly Broken
---

When looking through the Control4 machine, we noticed that the IP address range it is on is **not** in the `192.168.10.0/24` subnet. It is actually in the `172.16.10.0/24` network.

```txt
ifconfig
eth0      Link encap:Ethernet  HWaddr 00:0F:FF:13:D6:1A
          inet addr:172.16.10.4  Bcast:172.16.10.255  Mask:255.255.255.0
          UP BROADCAST NOTRAILERS RUNNING ALLMULTI MULTICAST  MTU:1500  Metric:1
          RX packets:122800 errors:0 dropped:0 overruns:0 frame:0
          TX packets:119369 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:35281332 (33.6 MiB)  TX bytes:32480603 (30.9 MiB)
          Interrupt:13

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING ALLMULTI  MTU:16436  Metric:1
          RX packets:80217 errors:0 dropped:0 overruns:0 frame:0
          TX packets:80217 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:11367465 (10.8 MiB)  TX bytes:11367465 (10.8 MiB)
```

We now need to figure out how to pivot to that network to take a look inside it.

## Setting up Proxy

Edit `/etc/proxychains.conf` in local machine.

We need to change the `socks4 127.0.0.1` port to `6022`

Set up a reverse shell with a specific port

```sh
ssh -D 6022 root@192.168.10.101
```

Run a command:

```sh
proxychains nmap 172.16.10.0/24
```
