---
title: "Linux! (or as I've recently taken to calling it, GNUbody cares about saying the full name)"
date: 2018-04-10T15:00:00-04:00
tags: ["featured"]
---

![My Linux Mint Setup](/blog/images/linux-desktops/my-mint.png)

Linux is an operating system, comparable to Windows or MacOS. You can use it to browse the web, run applications, edit files, and all the normal tasks you use computers for. But Linux is fundamentally different from Windows and MacOS in several ways that I find very appealing.

This article covers my reasons for using the Linux, and some cool things you can do with it (such as a keyboard shortcut for an airhorn sound). Along the way, it has links to different tutorials and resources for learning more. If you have a question or a suggestion, don’t hesitate to leave a comment at the bottom of the article and I will be happy to respond.

## Why I Love Linux
### User Rights
The main reason I love Linux is that it respects the user’s rights. Linux is [free and open source software](https://en.wikipedia.org/wiki/Free_and_open-source_software), which means anyone can modify, distribute, and use the source code. Even people like me who are not well-versed in writing operating systems still benefit from the diversity that this creates.

Linux is not run by a single company, but a large number of organizations that maintain [distributions](https://distrowatch.com/), or “distros”. Some examples are Ubuntu, Linux Mint, ElementaryOS, Fedora, and Arch. Because of the separate distros, there is no single company trying to lock you into an ecosystem of services. If one distro tried to do that, people would stop using it and switch to a different one, or someone would create and distribute a copy of it without the restrictive aspects. There are no applications that cannot be removed (unlike Edge on Windows), and components of the system can even be uninstalled and replaced with alternate types to suit your needs. Different distros have different forms of these alternate components to appeal to audiences with specific interests.

### Security and Privacy
Linux’s security comes from the fact that it is open source. This might seem counter-intuitive as anyone could examine the code for vulnerabilities. But, since there are more benevolent people examining the code than malicious ones, this has the demonstrated effect of bugs and security holes being found quicker on average than proprietary operating systems. Because it is open source, it is verifiable that no telemetry data is being sent back through the OS to a company to collect and track Linux users.

The actual level of security depends on the distro. There are some security focused distros such as [QubesOS](https://www.qubes-os.org/), which runs every application in a separate container to keep it isolated from other applications and personal data. Another security distro is [Tails](https://tails.boum.org/), which runs from a USB drive and resets every time you start up (for ultra-paranoid people, or anonymous journalists).

All this being said, no system is completely secure from a determined hacker or government, but Linux has shown itself to be the most secure.

### Control of Updates
One of the most freeing things about Linux is that there are no forced updates! You can choose to update whenever you want, or never update at all (not recommended, but possible). You can using the system while it is being updated, and most updates do not require a restart. When updating, you can choose which updates you want, and you can downgrade each application later if you want to.

When a large update is released, such as a significant change to the layout of the desktop, there are usually a group of people who like the old layout better. On other operating systems, they would be out of luck. But on Linux, the programmers among them make a copy of the component (called a “fork”). They are able to maintain that fork and anyone is still able to use it and keep getting updates for it. The two versions then continue in parallel and most everyone is happy.

### Customizability
There are hundreds of Linux distros to choose from, dozens of which with a significant number of users. There are also many “desktop environments,” a component that determines the layout of the menus and apps on the desktop.

These are all Linux desktop environments, each with a different layout and workflow suited for different tasks and types of people:

![GNOME](/blog/images/linux-desktops/gnome.jpg)
GNOME – unique setup with a sidebar, and “activities” at the top-left corner
 

![Pantheon](/blog/images/linux-desktops/elementary.png)
Pantheon on ElementaryOS with Leos 7  icon pack – made to look like MacOS
 

![Budgie](/blog/images/linux-desktops/solus-budgie.jpg)
Budgie on Solus Linux – clean and simple start-menu style interface
 

![XFCE](/blog/images/linux-desktops/xfce.png)
XFCE – lightweight, this particular setup has the menu on the top
 

![MATE](/blog/images/linux-desktops/fedora-mate.png)
MATE on Fedora – fork of GNOME 2, menus on top and bottom in this setup
 

![Cinnamon](/blog/images/linux-desktops/mint-cinnamon.png)
Cinnamon on Linux Mint – fork of GNOME, start-menu based (I use this one)
 

![i3](/blog/images/linux-desktops/i3.png)
i3 tiling window manager – for real hackers (my friend uses this one)
 

![Settings](/blog/images/linux-desktops/mint-cinnamon-settings.png)
Linux Mint Cinnamon Settings


Within each desktop environment, you can change the position of the menu(s), the theme, the position of buttons on the windows, and much more. Some desktop environments even have extensions that people can write, such as an extension I downloaded to make windows become transparent when being dragged so I can see the window underneath.

I have set up many keyboard shortcuts, ranging from silly sound effects played when I press Shift-F1, Shift-F2, etc (more on how to set this up later in the article!), to application launchers on Super-A (Arduino IDE), Super-B (Web Browser), Super-C (LibreOffice Calc), etc. I also set up shortcuts for moving windows around, like Alt-Left/Right to snap a window to one side of a screen, and Alt-<1-9> with the numberpad to move a window to a corner or edge of the screen.

### Bootable USB
You can [boot Linux from a USB drive](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows)! This is very useful for a variety of tasks. You can troubleshoot computers that won’t boot by booting from the USB drive and running diagnostics. You can remove passwords from Windows computers using a utility. You can retrieve files from any computer you forgot the password to (as long as it is not encrypted). If you accidentally formatted (erased) a hard drive, you may be able to recover it with a bootable Linux USB. It is also great for working with storage devices in general since Linux is compatible with all major file systems, and has some great easy-to-use tools for partitioning. I have put together a USB drive with multiple distros on it with software called [MultiBootUSB](http://multibootusb.org/).

### Terminal Stuff
![Nethack](/blog/images/linux-desktops/nethack.gif)
Nethack, a game that runs in the terminal

A terminal is an application that allows the user to type commands to interact with the system if different ways. Linux comes with a very diverse and useful set of terminal commands for just about anything. Basically, the terminal acts as the glue for the system, giving access to all utilities, and allowing you to write scripts that automate tasks like backup of files, changing desktop backgrounds and themes, or installing apps on a new system. One of my favorite scripts lets me swap between the default skin of Linux Mint and a [Windows XP theme](https://github.com/petrucci4prez/CinnXP) that someone made for Linux Mint!

* [File utilities](http://www.jpgtutorials.com/some-basic-linux-commands-everyone-must-know)
* [Text editors](https://www.nano-editor.org/)
* [Installing apps](https://www.howtogeek.com/140679/beginner-geek-how-to-start-using-the-linux-terminal/)
* [Launching any app by typing its name](https://www.lifewire.com/ways-to-open-a-ubuntu-application-4075529#5)
* [Interacting with the system](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
* [System info and diagnostics](https://pypi.python.org/pypi/Glances)
* [Logging into remote servers](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-to-connect-to-a-remote-server-in-ubuntu)
* [Games](https://www.tecmint.com/best-linux-terminal-console-games/)
* [Web browsing](https://www.unixmen.com/use-terminal-as-a-web-browser/)

Later in the article I will discuss some of the fun terminal apps you can run.

### Lightweight
Linux uses very few system resources. Depending on the distro, it can use about 300 MB (0.3GB) to 800MB (0.8GB) of ram with no apps open, leaving the rest for all those browser tabs that somehow take up 250MB (0.25GB) each… By comparison, Windows 10 uses 1GB to 2GB of ram with no apps open. Linux also uses only a few GB of disk space, and boots very fast (again, depending on the distro).

This makes Linux perfect for…

### Old Hardware
A lightweight distro such as [Lubuntu](https://lubuntu.me/) or [Debian](https://www.debian.org/) can run on old hardware (or cheap hardware like a chromebook) and still receive security updates. You can finally turn that 10-year-old laptop into a portable [emulator for the Atari 2600](https://www.lifewire.com/classic-games-emulators-linux-2204886) (among many others)! [This project](http://yeokhengmeng.com/2018/01/make-the-486-great-again/) took a computer from 1989 and put modern Linux on it, and it still gets updates.

### Ease of Technical Use
I have tried to install python on Windows before, and it is not a good experience. Linux, on the other hand, has python already installed and even has multiple versions for compatibility with older python programs. Setting up custom networking with a system of servers, or even devices around the home is a lot easier and cheaper (no licences required) in Linux. If you want to set up an audio production machine, you can use the [Ubuntu Studio](https://ubuntustudio.org/) distro, or install the programs it uses on any other distro to create your customized audio setup.

### Home Server
While Linux only has 3% market share on personal computers, it dominates the server market, with about 2/3 of the world’s servers running some form of Linux. That means that you most likely use Linux without knowing it every time you use the internet! This makes it the ideal choice for a home server since there is so much high quality server software available for free. You can use Linux to host your own website, store a backup of your laptop, run a minecraft server, [act as a DVR](https://www.mythtv.org/detail/mythtv), stream music, control home automation, etc. Since most of the world’s servers run Linux, having experience with Linux servers is an important skill to have if you are going into IT or web development.

## Cool Things to Do with Linux
Open a terminal in Linux (Ctrl-Alt-T on most systems) and type the following command to install some fun scripts:

```
apt install hollywood filters nyancat bb libaa-bin oneko toilet fortune lolcat figlet cowsay sl cmatrix
```

Then type some of these commands in for some surprises:

```
oneko (press Ctrl-C to exit)
cmatrix (press Ctrl-C to exit)
nyancat (press Ctrl-C to exit)
fortune
fortune|pirate
fortune|lolcat
fortune|cowsay
fortune|cowsay|lolcat
fortune|figlet|lolcat
fortune|rev
fortune|pirate|rev|figlet|lolcat
sl
telnet towel.blinkenlights.nl
bb
hollywood (press Ctrl-C twice, then Ctrl-D to quit)
```

![Mystery Command](/blog/images/linux-desktops/fortune-pirate-rev-cowsay-lolcat.png)
extra bonus nachos if you can guess what command created this

See the appendix for the links where I found these cool commands.

### Keyboard Soundboard
In Linux, you can map key pressed to sound effects! In Ubuntu, click on “Activities,” type “keyboard,” and click on “keyboard” under “settings.”

![Step 1](/blog/images/linux-desktops/ubuntu-keyboard-1.png)

Scroll to the bottom of the list and click on the wide “+” button.

![Step 2](/blog/images/linux-desktops/ubuntu-keyboard-2.png)

Fill in the fields as follows, replacing “johanv” with your username, then click on “Set Shortcut…” and press Shift-F1 (or whatever you want the key sequence to be).

![Step 3](/blog/images/linux-desktops/ubuntu-keyboard-3.png)

Download [this sound](/blog/files/Airhorn.ogg) effect and put it in your home directory.

![Step 4](/blog/images/linux-desktops/ubuntu-keyboard-4.png)

Press Shift-F1 and enjoy! You can add more sounds to the other Shift-F<1-12> keys using the same process. [Here is a link](/blog/files/KeyboardShortcuts.zip) to all the sound effects I added.

## Conclusion
Thanks for reading (or skipping) all the way to the end! This has been my perspective on the world of Linux. Whether you find Linux appealing, appalling, or somewhere in between, I hope you got something useful out of this article. The appendix has some useful articles on learning more about Linux if you are interested. You can also leave a comment if you have any questions, suggestions, or… well… comments!

## Appendix
Here are some tutorials explaining more about Linux and how to use it:
 * https://www.rosehosting.com/blog/intro-to-linux-how-to-learn-linux-as-a-newbie/
 * http://haktuts.com/Linux/
 * http://www.jpgtutorials.com/some-basic-linux-commands-everyone-must-know
 * https://www.tutorialspoint.com/listtutorials/linux/basic-concepts/1

Sources for cool things to do in Linux:
 * https://www.quora.com/What-are-some-cool-things-you-can-do-with-Linux-that-you-cannot-with-Windows-or-OSX
 * https://www.quora.com/What-are-some-cool-things-that-I-can-do-on-Linux
 * https://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
 * https://lifehacker.com/top-10-uses-for-linux-even-if-your-main-pc-runs-window-1513172815