---
title: Initial Port Scan
description: Nmap of the local network
tags:
  - nmap
  - devices
categories:
  - sohoplesslybroken
draft: false  # change to false when time to publish
---

After getting connected to the SOHOplesslyBroken VPN, we did an nmap scan of the local IP range for any devices.

```bash
nmap 192.168.10.0/24
```

## Control4 Open Source Software Notice

url: http://192.168.10.101/

PORT | STATE | SERVICE
--- | --- | ---
21/tcp | closed | ftp
22/tcp |closed | ssh
80/tcp | open | http


## Link Clicker

url: http://192.168.10.187/

PORT | STATE | SERVICE
--- | --- | ---
80/tcp | open | http


## NUUO Network Video Recorder

url: http://192.168.10.193/

PORT | STATE | SERVICE
--- | --- | ---
21/tcp | open | ftp
22/tcp | open | ssh
80/tcp | open | http
443/tcp | open | https


## Any time & Any where, IP Surveillance for Your Life

url: http://192.168.10.196/

PORT | STATE | SERVICE
--- | --- | ---
80/tcp | open | http
554/tcp | open | rtsp

## GEO Vision - GV-SNVR0811

url: http://192.168.10.197/

PORT | STATE | SERVICE
--- | --- | ---
80/tcp | open | http
443/tcp | open | https
10000/tcp | open | snet-sensor-mgmt


## No NAME

url: http://192.168.10.208/login

PORT | STATE | SERVICE
--- | --- | ---
22/tcp | open | ssh
80/tcp | open | http
113/tcp | closed | ident
443/tcp | open | https
541/tcp | open | uucp-rlogin
8000/tcp | closed | http-alt
8009/tcp | open | ajp13

## DCS-930LB1

url: http://192.168.10.209

PORT | STATE | SERVICE
--- | --- | ---
23/tcp | open | telnet
80/tcp | open | http
443/tcp | open | https
749/tcp | filtered | kerberos-adm
4444/tcp | open | krb524
