---
title: Day2 Port Scan Update
description: Update of initial Nmap showing what has been completed
tags:
  - nmap
  - devices
  - recon
categories:
  - SOHOplessly Broken
draft: false  # change to false when time to publish
---

After getting connected to the SOHOplesslyBroken VPN, we did an nmap scan of the local IP range for any devices. This as an update to show what flags have already been captured.

```bash
nmap 192.168.10.0/24
```

## Control4 Open Source Software Notice

url: [http://192.168.10.101/](http://192.168.10.101/)

PORT | STATE | SERVICE
--- | --- | ---
21/tcp | closed | ftp
22/tcp |closed | ssh
80/tcp | open | http

Current State: Has not been accessed. Possible vulnerability in ssh used by server (dropbear).


## Link Clicker

url: [http://192.168.10.187/](http://192.168.10.187/)

PORT | STATE | SERVICE
--- | --- | ---
80/tcp | open | http

No flag, is used as a link clicker that will access any url provided to it.


## NUUO Network Video Recorder

url: [http://192.168.10.193/](http://192.168.10.193/)

PORT | STATE | SERVICE
--- | --- | ---
21/tcp | open | ftp
22/tcp | open | ssh
80/tcp | open | http
443/tcp | open | https

Current State: Flag has been captured.


## Any time & Any where, IP Surveillance for Your Life

url: [http://192.168.10.196/](http://192.168.10.196/)

PORT | STATE | SERVICE
--- | --- | ---
80/tcp | open | http
554/tcp | open | rtsp

Current State: Flag not captured. It is likely a DVR that might have vulnerabilities.

## GEO Vision - GV-SNVR0811

url: [http://192.168.10.197/](http://192.168.10.197/)

PORT | STATE | SERVICE
--- | --- | ---
80/tcp | open | http
443/tcp | open | https
10000/tcp | open | snet-sensor-mgmt

Current State: Flag Captured.

## 192.168.10.208

url: [http://192.168.10.208/login](http://192.168.10.208/login)

PORT | STATE | SERVICE
--- | --- | ---
22/tcp | open | ssh
80/tcp | open | http
113/tcp | closed | ident
443/tcp | open | https
541/tcp | open | uucp-rlogin
8000/tcp | closed | http-alt
8009/tcp | open | ajp13

Current State: This was a fortinet machine. Flag Captured.

## DCS-930LB1

url: [http://192.168.10.209](http://192.168.10.209)

PORT | STATE | SERVICE
--- | --- | ---
23/tcp | open | telnet
80/tcp | open | http
443/tcp | open | https
749/tcp | filtered | kerberos-adm
4444/tcp | open | krb524

Current State: No new information on this machine.
