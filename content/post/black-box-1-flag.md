---
title: Black Box 1 Flag Writeup
description: Getting the flag from the Control4 Server
tags:
  - md5
  - reading the instructions
categories:
  - SOHOplessly Broken
---

## Previous Exploit

Doing a search of Control 4 C4-HC250-BL + exploit in Google netted us with the default password used to exploit. 
[http://www.davidsonfamily.ca/discussion-board/topic/logging-into-controller/](http://www.davidsonfamily.ca/discussion-board/topic/logging-into-controller/)

## Black Box 1 Flag

I noticed there was a Black Box Challenge for Control 4, which we previously exploited.

With the password we previously used, we could ssh into the ip to access the directory: /etc/init.d/c4server.

We took the MD5 sum of /etc/init.d/c4server to retrieve the flag.
