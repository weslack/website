---
title: Control4 Flag 2
description: Look through the contents of a device for a flag
tags:
  - Control4
  - Default Credentials
categories:
  - IotVillage
draft: false  # change to false when time to publish
---

# Challenge

> Submit the contents of flag.txt, found in USB storage on the device.

# Device

Control4 Device

Location: 192.168.10.174

Port: A bunch

Exploit: Default SSH credentials

# Getting the flag

Look through USB devices. didn't find anything.

```sh
~# cd /mnt/media/usb/
/mnt/internal/usb# ls
```

Looking for USB devices

```sh
~# dmesg | grep usb 
<6>[42949373.260000] usbcore: registered new interface driver usbfs
<6>[42949373.260000] usbcore: registered new interface driver hub
<6>[42949373.260000] usbcore: registered new device driver usb
<6>[42949373.280000] musb_hdrc: version 6.0, cppi-dma, host, debug=0
<7>[42949373.300000] musb_hdrc: ConfigData=0x06 (UTMI-8, dyn FIFOs, SoftConn)
<7>[42949373.300000] musb_hdrc: MHDRC RTL version 1.300 
<7>[42949373.300000] musb_hdrc: setup fifo_mode 2
<7>[42949373.300000] musb_hdrc: 7/9 max ep, 2624/4096 memory
<7>[42949373.300000] musb_hdrc: hw_ep 0shared, max 64
<7>[42949373.300000] musb_hdrc: hw_ep 1tx, max 512
<7>[42949373.300000] musb_hdrc: hw_ep 1rx, max 512
<7>[42949373.300000] musb_hdrc: hw_ep 2tx, max 512
<7>[42949373.300000] musb_hdrc: hw_ep 2rx, max 512
<7>[42949373.300000] musb_hdrc: hw_ep 3shared, max 256
<7>[42949373.300000] musb_hdrc: hw_ep 4shared, max 256
<6>[42949373.300000] musb_hdrc: USB Host mode controller at 90008000 using DMA, IRQ 12
<6>[42949373.300000] musb_hdrc musb_hdrc: MUSB HDRC host driver
<6>[42949373.300000] musb_hdrc musb_hdrc: new USB bus registered, assigned bus number 1
<6>[42949373.300000] usb usb1: configuration #1 chosen from 1 choice
<6>[42949373.300000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
<6>[42949373.300000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
<6>[42949373.300000] usb usb1: Product: MUSB HDRC host driver
<6>[42949373.300000] usb usb1: Manufacturer: Linux 2.6.28.10-rc8.77 musb-hcd
<6>[42949373.300000] usb usb1: SerialNumber: musb_hdrc
<6>[42949375.180000] usbcore: registered new interface driver usb-storage
<6>[42949375.200000] usbcore: registered new interface driver libusual
<6>[42949441.010000] usbcore: registered new interface driver zd1211b
```

Looking at the mounted devices

```sh
/dev# mount
/dev/root on / type jffs2 (ro)
/devfs on /dev type tmpfs (rw,size=16k)
/proc on /proc type proc (rw)
/tmp on /mnt/ram/tmp type tmpfs (rw,size=16384k)
/var on /mnt/ram/var type tmpfs (rw,size=32768k)
/dev/mtdblock4 on /mnt/jffs2 type jffs2 (rw,noatime,nodiratime)
/dev/mtdblock5 on /mnt/internal type jffs2 (rw,noatime,nodiratime)
/dev/mtdblock10 on /mnt/persistent type jffs2 (rw,noatime,nodiratime)
none on /proc/bus/usb type usbfs (rw)
/sysfs on /sys type sysfs (rw)
none on /dev/pts type devpts (rw,mode=600)
/dev/mmcblk0p1 on /mnt/internal/packages type ext3 (rw,errors=continue,data=ordered)
/dev/mmcblk0p2 on /mnt/sd type ext3 (rw,errors=continue,data=ordered)
/dev/mtdblock5 on /mnt/internal/www/flash type jffs2 (rw,noatime,nodiratime)
/dev/mtdblock5 on /mnt/internal/www/flash type jffs2 (rw,noatime,nodiratime)
/dev/mtdblock5 on /mnt/internal/usb type jffs2 (rw,noatime,nodiratime)
/tmp on /mnt/ram/tmp type tmpfs (rw,size=16384k)
/var on /mnt/ram/var type tmpfs (rw,size=32768k)
```

We've got a usb mounted as `/mnt/internal/usb`.

Take a look in there, and find nothing

```sh
~# ls /mnt/internal/usb/
```

Run `find` to find flags

```sh
$ find /mnt/internal/www/ -name "Flag.txt"
/mnt/internal/www/Flag.txt
```

`cat` and submit
