---
title: Firmware Analysis
description: Look through a root file system of an embedded linux device and find a function
tags:
  - TerraMaster
  - Static Analysis
categories:
  - IoT Village CTF
draft: true  # change to false when time to publish
---

## Challenge

Who knew embedded web servers ran php natively? And it's easy to read! Or is it?! NOTE find the function mb_version(). Ensure you have a clean text file with ONLY this function (no unreadable/gibberish chars) and use the md5sum as the flag.

## Cursory look

Looking at the provided file, we extracted it and started looking through the contents of this file. It was a root filesystem for a linux machine.

## Initial Binwalk

Running binwalk on provided file with file extraction:

```
$ binwalk -e --signature firmware.ins
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             bzip2 compressed data, block size = 900k
43554559      0x29896FF       MySQL MISAM compressed data file Version 9
115163080     0x6DD3FC8       Cisco IOS experimental microcode, for "p"
125785487     0x77F558F       MySQL MISAM compressed data file Version 3
136365277     0x820C4DD       MySQL MISAM compressed data file Version 7
161060592     0x99996F0       MySQL ISAM compressed data file Version 1
183343749     0xAED9A85       MySQL MISAM compressed data file Version 8
Extraction gave one file output (not sure how much of it was extracted or if all of it was...). Starting to dig through the extracted file.
```

## Get a webserver working

We looked through the contents of `/usr/www` to see what we could find. We weren't able to find much since the contents of the PHP files were unreadable. We couldn't figure out why, but we assumed that getting the server working would let us view it.

The challenge asked us to look for a particular function running in an embedded webserver in this device. We worked to get the webserver running so we could look around at what the system was supposed to look like. We needed to create a couple of files and directories in order for nginx to start working. Once we did that we modified the nginx configuration to allow for access from any location and allow for indexing.

We started to import some of the php files and look for which one had an `md_version` function. While we were doing that, we were also looking for other things about this system

## Figuring out the system

We figured out that the firmware we were looking at was for a TerraMaster NAS. We've had experience with TerraMaster stuff before, and knew that there has been a lot of research done on their devices. We started looking for why the PHP files were encrypted. And also looking though Ghidra tutorials to see the contents of the files. We found an [exploit discovery on TerraMaster devices running a custom version of PHP](https://blog.securityevaluators.com/terramaster-nas-vulnerabilities-discovered-and-exploited-b8e5243e7a63?gi=1d74ff591425) and that looked like it what we were looking for.

It turns out, these files are AES encrypted during build time, and decrypted as part of the PHP server. It turns out the key is exactly the same as the one in the write up, and we followed the steps get decrypt all of the files. A simple find on the files led us to the `www/3.0/config/version.php` file. We cleaned up the file and submitted it.
