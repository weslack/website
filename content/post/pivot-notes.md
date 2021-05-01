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

## Getting a pivot into a new network

It looks like the device we need to pivot to is the fortinet device.

After messing around on the device, we've found some information.

```txt
FGT60C3G12011171 # ifconfig
Unknown action 0

FGT60C3G12011171 # sh
#config-version=FGT60C-5.00-FW-build271-140124:opmode=1:vdom=0:user=Fortimanager_Access
#conf_file_ver=7342996052771862690
#buildno=0271
#global_vdom=1
config system global
    set fgd-alert-subscription advisory latest-threat
    set gui-antivirus disable
    set gui-application-control disable
    set gui-dlp disable
    set gui-endpoint-control disable
    set gui-explicit-proxy disable
    set gui-ips disable
    set gui-spamfilter disable
    set gui-vulnerability-scan disable
    set gui-webfilter disable
    set gui-wireless-controller disable
    set hostname "FGT60C3G12011171"
    set timezone 04
end
config system accprofile
    edit "prof_admin"
        set admingrp read-write
        set authgrp read-write
        set endpoint-control-grp read-write
        set fwgrp read-write
        set loggrp read-write
        set mntgrp read-write
        set netgrp read-write
        set routegrp read-write
        set sysgrp read-write
        set updategrp read-write
        set utmgrp read-write
        set vpngrp read-write
        set wanoptgrp read-write
        set wifi read-write
    next
end
config wireless-controller vap
    edit "mesh.root"
        set vdom "root"
        set mesh-backhaul enable
        set ssid "fortinet.mesh.root"
        set alias "m"
        set passphrase ENC RObUXNSaMDm2ZjZE9uANA5Uy+7gYfZ9MAPGbUBcKmX9mjt5mvzNsPn29vg3G6k7lteboNnmcxqXf4gHXaSDkHoFmR15Ence9jVnOTYLWoriH1CUK2dZhaIg69sN4SNfZ1rq38I0BxS7TJZMZOBnZtrZtbAn8DQrn+uRYPGzyLdYCxuyj7aEOWFaVnbFPboTaaSHuSA==
    next
end
config system interface
    edit "dmz"
        set vdom "root"
        set ip 10.10.10.1 255.255.255.0
        set allowaccess ping https fgfm capwap
        set type physical
        set snmp-index 4
    next
    edit "wan2"
        set vdom "root"
        set ip 192.168.101.99 255.255.255.0
        set allowaccess ping fgfm auto-ipsec
        set type physical
        set snmp-index 3
    next
    edit "wan1"
        set vdom "root"
        set mode dhcp
        set allowaccess ping https ssh http fgfm auto-ipsec
        set type physical
        set explicit-web-proxy enable
        set listen-forticlient-connection enable
        set snmp-index 2
        set defaultgw enable
    next
    edit "modem"
        set vdom "root"
        set mode pppoe
        set type physical
        set snmp-index 5
        set defaultgw enable
    next
    edit "ssl.root"
        set vdom "root"
        set ip 0.0.0.0 255.255.255.255
        set type tunnel
        set alias "sslvpn tunnel interface"
        set snmp-index 6
    next
    edit "mesh.root"
        set vdom "root"
        set type vap-switch
        set snmp-index 7
    next
    edit "internal"
        set vdom "root"
        set ip 192.168.1.99 255.255.255.0
        set allowaccess ping https ssh http fgfm capwap
        set type physical
        set snmp-index 1
    next
end
config system admin
    edit "admin"
        set accprofile "super_admin"
        set vdom "root"
            config dashboard-tabs
                edit 1
                    set name "Status"
                next
                edit 2
                    set columns 1
                    set name "Top Sources"
                next
                edit 3
                    set columns 1
                    set name "Top Destinations"
                next
                edit 4
```
