---
title: Mosquitto Flag 2
description: Base64 our way to victory
tags:
  - Mosquitto
  - Base64
categories:
  - IoT Village
draft: true  # change to false when time to publish
---

## Challenge

See if you have the patience to scratch the itch; patience is key. Mosquitto bites are so annoying! Except, in this case.. you can become an admin. Connect at: x.x.x.x:1883 using iot:iot Web Portal: http://x.x.x.x

## Solve

Look at the new Mosquitto server, connecting using the following command

```sh
mosquitto_sub -h x.x.x.x -p 1883 -u iot -P iot -t "#"
```

Grab the text that looks like a flag.

Base64 decode the username and password.

Grab the giant base64 string that looks a lot like an image and look a the file header. Realize it is an image. Turn it into a file.

Try to use it, realize it is an actual OTP and do it all again quickly.

Use the credentials to get the flag.
