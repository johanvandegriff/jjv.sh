---
title: "How to send MMS messages on the Pinephone with vgmms"
date: 2020-09-18T01:00:45-04:00
tags: []
---

Update! While vgmms is not working yet, you can use jmms in the meantime: https://git.sr.ht/~amindfv/jmms Just head to that link and read the instructions for installation. Right now jmms only supports receiving MMS messages (group texts and pictures), not sending.

NOTE: this guide is still a work in progress and while installing vgmms works, sending MMS does not work yet. (although you can send SMS through vgmms).

open bug report for group messages: [#23](https://todo.sr.ht/~anteater/mms-stack-bugs/23)
open bug report for sending photos: [#39](https://todo.sr.ht/~anteater/mms-stack-bugs/39)

## Overview
 * install the mobian operating system on the SD card
 * create swap space so the build process doesn't run out of memory
 * install dependencies
 * clone vgmms and other repos
 * build ofono, mmsd, and vgmms
 * reboot and run vgmms

## Install Mobian
[https://wiki.mobian-project.org/doku.php?id=install](https://wiki.mobian-project.org/doku.php?id=install)
Other operating systems might work but I have only tested mobian.
You might find it useful to set up an SSH connection to the phone to make it easier to copy/paste these commands.

## Create Swap Space
```
f=/swapfile1
mb=3000

sudo dd if=/dev/zero of="$f" bs=1M count="$mb" status=progress
sudo chmod 600 "$f"
sudo mkswap "$f"
sudo swapon "$f"
```

## Install Dependencies
```
sudo apt install git curl make gcc automake libtool-bin autotools-dev libudev-dev libdbus-1-dev libglib2.0-dev libcairo2-dev libjpeg-dev libgif-dev libpango1.0-dev libgdk-pixbuf2.0-dev librust-atk-dev librust-gdk-dev libsqlite3-dev mobile-broadband-provider-info

curl https://sh.rustup.rs -sSf | sh #install rust
```

## Clone the repos
```
cd
mkdir mms
cd mms
git clone https://git.sr.ht/~anteater/vgmms
git clone https://git.sr.ht/~anteater/mmsd
git clone https://git.sr.ht/~anteater/ofono
git clone https://github.com/bryanperris/ell.git
```

## Build ofono
Note: requires the ell repo to be in the parent directory. (if you ran the git clone commands as above, it will be.) Also, there is an apt package for ofono, but we need to build it manually for it to work.

```
cd ~/mms/ofono
#instead of running ./bootstrap-configure, run the configure without the --enable-maintainer-mode which will get rid of -Werror and the extra test modem
test -f config.status && make maintainer-clean
./bootstrap && ./configure \
                --enable-debug \
                --prefix=/usr \
                --mandir=/usr/share/man \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --enable-test \
                --enable-tools \
                --enable-dundee \
                --disable-datafiles

make && sudo make install
```

## Build mmsd

```
cd ~/mms/mmsd
./bootstrap-configure
sed -i 's/-Werror //g' Makefile #remove -Werror from the Makefile
make && sudo make install
```

## Build vgmms
```
cd ~/mms/vgmms
cargo update -p rustdoc-stripper --precise 0.1.14 #temporary fix needed for the latest commit as of 2020-09-30, will not be needed in the future
cargo build --release
```
If the last command uses too much CPU, you can restrict it to 1 core with this command instead:
```
cargo build -j 1 --release
```

## Reboot
```
sudo reboot
```

## Run vgmms
First start the daemons and enable the modem.
```
sudo service ofono start

~/mms/ofono/test/enable-modem
~/mms/ofono/test/online-modem

/usr/libexec/mmsd
```

Run vgmms itself. A window will pop up on the phone that you can interact with.
```
~/mms/vgmms/target/release/vgmms
```