---
title: Mosquitto Flag
description: Get flags out of MQTT
tags:
  - MQTT
  - mosquitto
  - protocol
  - patience
categories:
  - SOHOplessly Broken
draft: false  # change to false when time to publish
---

The hint for the flag was.

> See if you have the patience to scratch the itch; patience is key. Mosquitto bites are so annoying!
> Connect at: 209.97.159.20:1883 Creds: iot:iot

We had a feeling that this had something to do with MQTT based off the mosquitto name. Searching for port `1883` confirmed this, as this is a standard port of MQTT.

We installed the mosquitto client using:

```sh
sudo apt install -y mosquitto-clients
```

We then connected to the server using:

```sh
mosquitto_sub -h 209.97.159.20 -p 1883 -u iot -P iot -t "#"
```

The `#` topic is the standard wildcard topic, so that we can listen to all the topics on the server. From here, well, we waited.

When subscribed to all the topics, we were greeted with a message every second

```txt
Representative
Bruno
Person
Horses
Blonde
Cork
Fish
Margin
Fly
Battery
Dinner
Wind
Blonde
Copy
Truck
Look
Crate
...
```

After about 30 minutes, the flag was sent, and we got it.
