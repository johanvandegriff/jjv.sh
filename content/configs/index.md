---
title: "My Config Files (Now Managed with Git and Ansible)"
description: "Johan Vandegriff's config files for zsh, emacs, tmux, nano, nethack, etc."
date: 2019-08-01T23:37:18-04:00
tags: []
---

Update: I now manage my config files in [this repo](https://codeberg.org/johanvandegriff/dotfiles). A description of a few of them is below:

## .tmux.conf
I changed the prefix key from Ctrl-B from Ctrl-A since it is closer to the control key, especially with caps lock [set to Ctrl](/blog/linux-remap-right-alt-and-ctrl-to-home-and-end/). Other settings in [.tmux.conf](https://codeberg.org/johanvandegriff/dotfiles/src/branch/main/roles/tmux/files/tmux.conf) make splitting the window easier to remember with / and \ instead of " and %.

## .gitconfig
My [.gitconfig](https://codeberg.org/johanvandegriff/dotfiles/src/branch/main/roles/git/files/gitconfig) has my name, email, and my gpg key for verifying commits. It also has a custom alias "git pushall" which pushes to all the remote repos with one command.

## .nethackrc
NetHack is a roguelike dungeoncrawler game released in 1987 (that's older than me!), and after 2003, it stopped getting updates. But in 2016, development began again and NetHack 3.6.0 was released! I've been playing it off and on for a few years, and I've accumulated a growing config file as I discovered useful options or saw other players' setups at [alt.org/nethack/](https://alt.org/nethack/). You can see my user page [here](https://alt.org/nethack/player-all.php?player=jjvan), which includes records of all my games, and even a [ttyrec recording](https://alt.org/nethack/browsettyrec.php?player=jjvan) of them. When the new version was released, some config options changed, which is why so much of my [.nethackrc](https://codeberg.org/johanvandegriff/dotfiles/src/branch/main/roles/nethack/files/nethackrc) is commented out.
