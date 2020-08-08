---
title: Control4 Flag
description: Accessing and getting Control4 Flag
tags:
  - Control4
  - 
categories:
  - SOHOplessly Broken
draft: false  # change to false when time to publish
---

After doing some research on the control4 product, we found that there is a default root password.

user | password
--- | ---
`root` | `t0talc0ntr0l4!`

## Getting the flag

The flag is located on the SD card, so we go look in `/mnt/sd/`

```sh
$ cd /mnt/sd/
$ ls
Flag.txt    flash       lost+found
```

We found the flag, and now we can `cat` it out and capture it.