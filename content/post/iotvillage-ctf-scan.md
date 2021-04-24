---
title: Iotvillage CTF Network Scan
description: Figure out what is on the network
tags:
  - nmap
categories:
  - IoTVillage
draft: false  # change to false when time to publish
---

Running tried and true nmap.

```sh
sudo nmap 192.168.10.0/24
```

## Output

```
Nmap scan report for 192.168.10.172
Host is up (0.095s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap scan report for 192.168.10.173
Host is up (0.096s latency).
Not shown: 994 closed ports
PORT     STATE SERVICE
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
548/tcp  open  afp
5000/tcp open  upnp
5001/tcp open  commplex-link
8383/tcp open  m2mservices

Nmap scan report for 192.168.10.174
Host is up (0.093s latency).
Not shown: 991 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
5100/tcp open  admd
5101/tcp open  admdog
5102/tcp open  admeng
5810/tcp open  unknown
5900/tcp open  vnc

Nmap scan report for 192.168.10.176
Host is up (0.094s latency).
Not shown: 998 closed ports
PORT      STATE SERVICE
80/tcp    open  http
49152/tcp open  unknown

Nmap scan report for 192.168.10.177
Host is up (0.094s latency).
Not shown: 998 closed ports
PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https

Nmap scan report for 192.168.10.179
Host is up (0.095s latency).
Not shown: 993 closed ports
PORT      STATE SERVICE
80/tcp    open  http
139/tcp   open  netbios-ssn
443/tcp   open  https
445/tcp   open  microsoft-ds
548/tcp   open  afp
8200/tcp  open  trivnet1
10000/tcp open  snet-sensor-mgmt

Nmap scan report for 192.168.10.180
Host is up (0.094s latency).
Not shown: 991 closed ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
139/tcp  open  netbios-ssn
443/tcp  open  https
445/tcp  open  microsoft-ds
631/tcp  open  ipp
8082/tcp open  blackice-alerts
9001/tcp open  tor-orport

Nmap scan report for 192.168.10.181
Host is up (0.094s latency).
Not shown: 983 closed ports
PORT      STATE SERVICE
21/tcp    open  ftp
22/tcp    open  ssh
80/tcp    open  http
111/tcp   open  rpcbind
139/tcp   open  netbios-ssn
443/tcp   open  https
445/tcp   open  microsoft-ds
548/tcp   open  afp
631/tcp   open  ipp
873/tcp   open  rsync
2049/tcp  open  nfs
3689/tcp  open  rendezvous
8080/tcp  open  http-proxy
8081/tcp  open  blackice-icecap
8200/tcp  open  trivnet1
30000/tcp open  ndmps
49152/tcp open  unknown

Nmap scan report for 192.168.10.182
Host is up (0.096s latency).
Not shown: 986 closed ports
PORT      STATE SERVICE
22/tcp    open  ssh
80/tcp    open  http
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
5100/tcp  open  admd
5101/tcp  open  admdog
5102/tcp  open  admeng
5560/tcp  open  isqlplus
5800/tcp  open  vnc-http
5810/tcp  open  unknown
5900/tcp  open  vnc
6000/tcp  open  X11
6100/tcp  open  synchronet-db
20000/tcp open  dnp

Nmap scan report for 192.168.10.183
Host is up (0.096s latency).
Not shown: 992 closed ports
PORT     STATE SERVICE
80/tcp   open  http
111/tcp  open  rpcbind
139/tcp  open  netbios-ssn
443/tcp  open  https
445/tcp  open  microsoft-ds
548/tcp  open  afp
631/tcp  open  ipp
9876/tcp open  sd

Nmap scan report for 192.168.10.184
Host is up (0.094s latency).
Not shown: 997 closed ports
PORT   STATE SERVICE
22/tcp open  ssh
53/tcp open  domain
80/tcp open  http

Nmap scan report for 192.168.10.187
Host is up (0.096s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
80/tcp open  http

Nmap scan report for 192.168.10.193
Host is up (0.095s latency).
Not shown: 996 closed ports
PORT    STATE SERVICE
21/tcp  open  ftp
22/tcp  open  ssh
80/tcp  open  http
443/tcp open  https

Nmap scan report for 192.168.10.208
Host is up (0.093s latency).
Not shown: 992 filtered ports
PORT     STATE  SERVICE
22/tcp   open   ssh
80/tcp   open   http
113/tcp  closed ident
443/tcp  open   https
541/tcp  open   uucp-rlogin
8000/tcp closed http-alt
8009/tcp open   ajp13
8010/tcp open   xmpp

Nmap scan report for 192.168.10.209
Host is up (0.093s latency).
Not shown: 998 closed ports
PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https
```
