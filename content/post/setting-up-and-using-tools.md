---
title: Setting Up and Using Tools
description: Setting and using the tools we have been using for this CTF
tags:
  - tools
categories:
  - SOHOplessly Broken
draft: false  # change to false when time to publish
---

We've learned how to use couple different tools since we've started working on the SOHOplessly Broken CTF.

## Kali

We set up a [Vagrant](https://vagrantup.com) machine to use as a common starting place for each of our machines. It has all of the standard Kali tools installed, as well as some other standard exploit tools.

### Requirements

* [Git](https://git-scm.com/)
* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)

### Package Managers

It is recommended to use a package manager for installing and updating this software.

#### macOS ###

[Homebrew](https://brew.sh/) is a package manager similar to Debian and Ubuntu's apt, but for macOS. It installs software with a single `brew install $package` command.

To install `brew` if it isn't installed, open the terminal and paste this command:
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once `brew` is installed, you can run the following commands in your terminal to install the dependencies:
```bash
brew install python3 git
brew cask install vagrant virtualbox
```

#### Windows ###

[Chocolatey](https://chocolatey.org/install) is the most commonly used package manager on Windows and has all of the necessary software available.

To install `chocolatey` if it isn't installed, open an administrative PowerShell and paste this command:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Once `chocolatey` is installed, you can run the following commands in your elevated powershell to install the dependencies:
```powershell
choco install git python3 vagrant virtualbox
```

### Getting the files

Use git to pull in the vagrant machine. This will download the files and put them into a directory named `vagrant`, located inside the directory you ran the command in.

```bash
git clone https://github.com/weslack/vagrant
```

### Running Vagrant

Change your shell to the `vagrant` directory.

```sh
cd vagrant
```

To get the vagrant machine, you will need to clone it to your local machine.

```sh
vagrant up
```

### Stopping vagrant

To stop vagrant, you can run the following command

```sh
vagrant halt
```

## SOHOpelessly Broken VPN

All of the devices are available on the VPN network that the IoT village provides.

We need to install their OpenVPN profile and and start it up.

### Get the profile

Go to https://ctf.iotvillage.org/vpn and generate a VPN configuration.

Put that configuration into a file called `iotvillage_ctf.ovpn`

### Connect the VPN

Change to the directory that the profile is in, and run the following command

```sh
sudo openvpn --config iotvillage_ctf.ovpn
```

Use the login for CTF page for the username and password.

This should connect you to the VPN. To test, go to this page in the VPN.

http://192.168.10.187/vpntest.html

### Troubleshooting

Run this script and try again

```sh
#!/bin/bash
​
RED='\033[1;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'
​
echo ""
echo ""
echo -e "${WHITE}---------------------------------------------------------------------------------"
echo -e "   IoT Village CTF VPN Fix Script for Kali Linux.  Tested on Kali Linux 2020.2a"
echo -e "---------------------------------------------------------------------------------${NC}"
echo ""
echo ""
if [ "$EUID" -ne 0 ]
  then echo -e "${RED}This script requires root.  Please execute with 'sudo ./iot-ctf-fix.sh'.${NC}"
  echo ""
  echo ""
  exit
fi
​
if [ -f "/etc/network/interfaces" ]; then
    echo -e "${GREEN}/etc/network/interfaces${NC} found, proceeding."
else
    echo -e "${RED}/etc/networt/interfaces not found.  Maybe you are not using Kali Linux and maybe you should figure this out yourself.${NC}"
    exit
fi
​
echo ""
echo -e "${RED}Running commands...${NC}"
echo ""
echo -e "...Adding '${BLUE}allow-hotplug tap0${NC}' to ${GREEN}/etc/network/interfaces${NC}, if missing"
grep -qxF 'allow-hotplug tap0' /etc/network/interfaces || echo 'allow-hotplug tap0' >> /etc/network/interfaces
​
echo -e "...Adding '${BLUE}iface tap0 inet dhcp${NC}' to ${GREEN}/etc/network/interfaces${NC}, if missing"
grep -qxF 'iface tap0 inet dhcp' /etc/network/interfaces || echo 'iface tap0 inet dhcp' >> /etc/network/interfaces
​
echo -e "...Running '${BLUE}daemon-reload${NC}'"
sudo systemctl daemon-reload
​
echo -e "...Restarting networking with '${BLUE}systemctl restart networking${NC}'"
sudo systemctl restart networking
​
echo ""
echo ""
echo -e "${YELLOW}If you had already connected to the IoT Village CTF VPN before running this script, please disconnect and reconnect.${NC}"
echo ""
echo ""
```

## Metasploit

As we've been looking at how to exploit devices, we've found a lot of epxloits hosted on sites like [Exploits Database](https://www.exploit-db.com/). We originally were trying to run these exploit scripts locally on our machine. While this works, we found it was a lot easier to just use them with metasploit.

To launch metasploit,

```sh
msfconsole
```

### Search for exploit

To look for specific exploits, we can use the search command from within this console.

For example, we can search for Asus exploits using 

```txt
search Asus
```

which will return something like

```txt
Matching Modules
================

   #  Name                                              Disclosure Date  Rank       Check  Description
   -  ----                                              ---------------  ----       -----  -----------
   0  exploit/apple_ios/browser/webkit_trident          2016-08-25       manual     No     WebKit not_number defineProperties UAF
   1  exploit/linux/http/asuswrt_lan_rce                2018-01-22       excellent  No     AsusWRT LAN Unauthenticated Remote Code Execution
   2  exploit/linux/misc/asus_infosvr_auth_bypass_exec  2015-01-04       excellent  No     ASUS infosvr Auth Bypass Command Execution
   3  exploit/windows/browser/asus_net4switch_ipswcom   2012-02-17       normal     No     ASUS Net4Switch ipswcom.dll ActiveX Stack Buffer Overflow
   4  exploit/windows/misc/asus_dpcproxy_overflow       2008-03-21       average    No     Asus Dpcproxy Buffer Overflow
```

### Use an exploit

To use a found expoit, take the name of the exploit, something like `exploit/linux/http/asuswrt_lan_rce` and run it with the `use` command.

```txt
msf5 > use exploit/linux/http/asuswrt_lan_rce
msf5 exploit(linux/http/asuswrt_lan_rce) >
```

The prompt will change, showing that you are now using that exploit.

### Configure an exploit

Each exploit has multiple options, but the most common one you will need to configure is `RHOSTS`.

To confure this, we use the `set` command

```txt
set RHOSTS 192.168.10.0/24
```

We are setting the RHOSTS to to look at all of the IP addresses in the `192.168.10.0/24` subnet.

### Run the exploit

To start running the exploit, just type `exploit`. This will run it and let you know if it works.

### Leave the exploit

To get out of an exploit, run the `back` command, which should take you out of the exploit.
