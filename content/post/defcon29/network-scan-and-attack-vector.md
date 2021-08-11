---
title: Network Scan and Attack Vector
description: Network scan results and attack vector information
tags:
  - Attack Vector
  - Network scan
categories:
  - SOHOplessly Broken
  - defcon29

---

## Unknown Device

### URL: [http://192.168.10.1](http://192.168.10.1)

### Path:
  - 192.168.10.1

### Ports:

PORT | STATE | SERVICE
----|-----|-----
80/tcp | filtered | http

### Pwnd: False

### Notes:


## Drobo 5n2

### URL: [http://192.168.10.137](http://192.168.10.137)

### Path:
  - 192.168.10.137

### Ports:

PORT | STATE | SERVICE
----|-----|-----
80/tcp | closed | http
139/tcp | open | netbios-ssn
445/tcp | open | microsoft-ds
548/tcp | open | afp
5000/tcp | open | upnp
5001/tcp | open | commplex-link

### Pwnd: True

### Notes:
  - Not shown: 995 closed ports


## Asus RT N53

### URL: [http://192.168.10.143](http://192.168.10.143)

### Path:
  - 192.168.10.143

### Ports:

PORT | STATE | SERVICE
----|-----|-----
23/tcp | open | telnet
53/tcp | open | domain
80/tcp | open | http
1723/tcp | open | pptp
4444/tcp | open | krb524
8080/tcp | open | http-proxy


### Pwnd: True

### Notes:
  - Not shown: 999 filtered ports
  - Use metasploit linux/misc/asus_infosvr_auth_bypass_exec


## Zyxel NSA325 v2

### URL: [http://192.168.10.144](http://192.168.10.144)

### Path:
  - 192.168.10.144

### Ports:

PORT | STATE | SERVICE
----|-----|-----
21/tcp | open | ftp
22/tcp | open | ssh
80/tcp | open | http
139/tcp | open | netbios-ssn
443/tcp | open | https
445/tcp | open | microsoft-ds
631/tcp | open | ipp
8082/tcp | open | blackice-alerts
9001/tcp | open | tor-orport

### Pwnd: False

### Notes:
  - Not shown: 991 closed ports


## QNAP TS-131P

### URL: [http://192.168.10.145](http://192.168.10.145)

### Path:
  - 192.168.10.145

### Ports:

PORT | STATE | SERVICE
----|-----|-----
21/tcp | open | ftp
22/tcp | open | ssh
80/tcp | open | http
111/tcp | open | rpcbind
139/tcp | open | netbios-ssn
443/tcp | open | https
445/tcp | open | microsoft-ds
548/tcp | open | afp
631/tcp | open | ipp
873/tcp | open | rsync
2049/tcp | open | nfs
3689/tcp | open | rendezvous
8080/tcp | open | http-proxy
8081/tcp | open | blackice-icecap
8200/tcp | open | trivnet1
30000/tcp | open | ndmps
49152/tcp | open | unknown
49153/tcp | open | unknown

### Pwnd: False

### Notes:
  - Not shown: 982 closed ports


## ReadyNAS

### URL: [http://192.168.10.146](http://192.168.10.146)

### Path:
  - 192.168.10.146

### Ports:

PORT | STATE | SERVICE
----|-----|-----
80/tcp | open | http
139/tcp | open | netbios-ssn
443/tcp | open | https
445/tcp | open | microsoft-ds
548/tcp | open | afp
8200/tcp | open | trivnet1
10000/tcp | open | snet-sensor-mgmt

### Pwnd: False

### Notes:
  - Not shown: 993 closed ports


## Seagate NAS

### URL: [http://192.168.10.147](http://192.168.10.147)

### Path:
  - 192.168.10.147

### Ports:

PORT | STATE | SERVICE
----|-----|-----
80/tcp | open | http
111/tcp | open | rpcbind
139/tcp | open | netbios-ssn
443/tcp | open | https
445/tcp | open | microsoft-ds
548/tcp | open | afp
631/tcp | open | ipp
9876/tcp | open | sd

### Pwnd: False

### Notes:
  - Not shown: 992 closed ports


## casa verde veralite

### URL: [http://192.168.10.148](http://192.168.10.148)

### Path:
  - 192.168.10.148

### Ports:

PORT | STATE | SERVICE
----|-----|-----
22/tcp | open | ssh
53/tcp | open | domain
80/tcp | open | http
544/tcp | filtered | kshell
888/tcp | filtered | accessbuilder
1131/tcp | filtered | caspssl
1719/tcp | filtered | h323gatestat
3878/tcp | filtered | fotogcad
3945/tcp | filtered | emcads
8045/tcp | filtered | unknown
10010/tcp | filtered | rxapi
32781/tcp | filtered | unknown

### Pwnd: False

### Notes:
  - Not shown: 988 closed ports


## Control4

### URL: [http://192.168.10.174](http://192.168.10.174)

### Path:
  - 192.168.10.174

### Ports:

PORT | STATE | SERVICE
----|-----|-----
22/tcp | open | ssh
80/tcp | open | http
139/tcp | open | netbios-ssn
445/tcp | open | microsoft-ds
5100/tcp | open | admd
5101/tcp | open | admdog
5102/tcp | open | admeng
5810/tcp | open | unknown
5900/tcp | open | vnc

### Pwnd: False

### Notes:
  - Not shown: 991 closed ports


## Clicker thing

### URL: [http://192.168.10.187](http://192.168.10.187)

### Path:
  - 192.168.10.187

### Ports:

PORT | STATE | SERVICE
----|-----|-----
80/tcp | open | http

### Notes:
  - Not shown: 999 closed ports


## Nuuo NVR

### URL: [http://192.168.10.193](http://192.168.10.193)

### Path:
  - 192.168.10.193

### Ports:

PORT | STATE | SERVICE
----|-----|-----
21/tcp | open | ftp
22/tcp | open | ssh
80/tcp | open | http
443/tcp | open | https

### Pwnd: True

### Notes:
  - Not shown: 996 closed ports
  - No pivot attempts have been made after pwn


## DCS-930LB1

### URL: [http://192.168.10.209](http://192.168.10.209)

### Path:
  - 192.168.10.209

### Ports:

PORT | STATE | SERVICE
----|-----|-----
80/tcp | open | http
443/tcp | open | https

### Pwnd: True

### Notes:
  - Not shown: 998 closed ports
  - screen name: admin password: [leave it blank]
  - camera that doesn't seems useful is visible
  - Will not attempt to pivot, unless desperate
