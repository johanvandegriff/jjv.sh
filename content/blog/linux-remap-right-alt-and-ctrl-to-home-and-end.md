---
title: "Linux: Remap Right Alt & Ctrl to Home & End (and Caps to Ctrl)"
date: 2021-09-26T12:09:11-04:00
tags: []
---

I recently got a [framework laptop](https://frame.work/) and I have been [customizing](https://codeberg.org/johanvandegriff/dotfiles) it, including changing the [touchpad swipe gestures](https://github.com/iberianpig/fusuma) and the keyboard layout. I couldn't find an easy guide on how to re-map the right Alt and Ctrl keys to Home and End, so once I figured it out I decided I'd post it here. I also map Caps Lock to Ctrl, so I have included an optional step here to do that as well.

![keyboard with remapped keys labelled](/blog/images/linux-remap-keyboard/framework13-keyboard-remap.png)

## Update 2024-05-01 for Framework 16
There's now an [even easier tool](https://keyboard.frame.work/) to remap keys for the framework 16's keyboard (Only works for the framework 16, not the framework 13 which I had before). You don't need to install it, but you will need a browser with WebUSB, such as chromium. You will also need to give permission by adding [this file](https://github.com/qmk/qmk_firmware/blob/master/util/udev/50-qmk.rules) to `/etc/udev/rules.d/` and running `sudo udevadm control --reload-rules; sudo udevadm trigger`. As before, scroll down to see the old way, which is not limited to framework, but will only work on X11 and not wayland.

![my key remappings shown in the keyboard configurator web interface](/blog/images/linux-remap-keyboard/framework16-keyboard-remap.png)

## Update 2022-09-23 for Framework 13
There's now a [tool](https://www.howett.net/posts/2021-12-framework-ec/#using-fw-ectool) to remap keys in the framework laptop's firmware. Scroll down to see the old way, which is not limited to framework.

Installing on arch-based linux systems:
```bash
yay -S fw-ectool-git
```

To remap the keys
```bash
sudo ectool raw 0x3E0C d1,d1,b0,b3,w6C #RAlt -> Home
sudo ectool raw 0x3E0C d1,d1,b0,bc,w69 #RCtrl -> End
sudo ectool raw 0x3E0C d1,d1,b4,b4,w14 #Caps Lock -> Ctrl
```

To put Caps Lock back to it's original state:
```bash
sudo ectool raw 0x3E0C d1,d1,b4,b4,w58 #Caps Lock -> back to Caps Lock
```

## Original 2021-09-26 for Any X11 System
Note: this only works on X11, not Wayland.

Create a file in your home folder called ".Xmodmap"
`nano ~/.Xmodmap`

Put the following as the file's contents:
```
clear control
clear mod1


! right alt becomes home
keycode 108 = Home Home Home Home

! right ctrl becomes end
keycode 105 = End End End End


add control = Control_L
add mod1 = Alt_L Meta_L
```

If you also want to map Caps Lock to Ctrl, use these contents instead:
```
clear lock
clear control
clear mod1


! caps lock becomes right control
keycode 66  = Control_R

! right alt becomes home
keycode 108 = Home Home Home Home

! right ctrl becomes end
keycode 105 = End End End End


add control = Control_L Control_R
add mod1 = Alt_L Meta_L
```

Reload the keyboard mapping:
`xmodmap ~/.Xmodmap`
