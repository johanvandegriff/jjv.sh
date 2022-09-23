---
title: "Raspberry Pi Dual Audio Output (or: Walmart JACK Audio)"
date: 2020-10-03T03:32:24-04:00
tags: []
---

## Background (skip if you want)
I use the raspberry pi to connect to my thrift store keyboard with a USB MIDI cable so that I can use better software instruments than the crappy ones built in to the keyboard.

I have made 2 songs using this so far:
[MIDI Cable Is Here](https://odysee.com/@johanv:5/midi-cable-is-here:c) &
[Magically Infinite Dank Inspiration](https://odysee.com/@johanv:5/midi-magically-infinite-dank-inspiration:5)

In addition to plugging in some headphones to the Pi and hearing the sound, I also wanted the option to pipe the audio to another device at the same time. The problem was that the user interface on the Pi only allows you to select one audio output at a time. After some digging online, I found [this post](http://www.6by9.net/output-to-multiple-audio-devices-with-alsa/) on how to output to 2 devices. However this guide was general, and the device names were wrong for the Pi. So I eventually found out that you can do `aplay --list-pcms` to get the right names, so I put the name for the HDMI device and the audio jack device into the config file.

## Solution
Edit the `.asoundrc` file in the home directory and replace the entire thing with this:

```
#from
# duplicate audio to both devices
pcm.!default plug:both

ctl.!default {
  type hw
  card 0
}

pcm.both {
  type route;
  slave.pcm {
      type multi;
      #aplay --list-pcm
      slaves.a.pcm "sysdefault:CARD=b1";
      slaves.b.pcm "sysdefault:CARD=Headphones";
      slaves.a.channels 2;
      slaves.b.channels 2;
      bindings.0.slave a;
      bindings.0.channel 0;
      bindings.1.slave a;
      bindings.1.channel 1;

      bindings.2.slave b;
      bindings.2.channel 0;
      bindings.3.slave b;
      bindings.3.channel 1;
#      bindings.4.slave b;
#      bindings.4.channel 2;
#      bindings.5.slave b;
#      bindings.5.channel 3;
  }

  ttable.0.0 1;
  ttable.1.1 1;

  ttable.0.2 1; # front left
  ttable.1.3 1; # front right
#  ttable.0.4 1; # copy front left to rear left
#  ttable.1.5 1; # copy front right to rear right
}

ctl.both {
  type hw;
  card Live;
}

pcm.onboard {
   type dmix
   ipc_key 1024
   slave {
       pcm "hw:1,0"
       period_time 0
       period_size 2048
       buffer_size 65536
       buffer_time 0
       periods 128
       rate 48000
       channels 4
    }
    bindings {
       0 0
       1 1
       2 2
       3 3
    }
}

pcm.sblive {
   type dmix
   ipc_key 2048
   slave {
       pcm "hw:0,0"
       period_time 0
       period_size 2048
       buffer_size 65536
       buffer_time 0
       periods 128
       rate 48000
       channels 2
    }
    bindings {
       0 0
       1 1
    }
}

ctl.onboard {
   type hw
   card 1
}

ctl.sblive {
   type hw
   card 0
}

```

If you ever interact with the audio settings, this file will be overwritten, so make sure to make a copy of the file so you can always restore it. Or you can copy it from here again.