---
title: "How I Created johanv.net: Personal Website with Seamless Livestream"
date: 2022-08-20T19:39:55-04:00
tags: ["how i created"]
---

## Update 2024-11-03
I have since moved to [jjv.sh](https://jjv.sh), read about it [here](/blog/how-i-created-jjv-sh). Keep reading if you want, but most of the links in this article are old.

## The Backstory
Ever since I [moved my site to johanv.xyz](/blog/how-i-created-johanv-xyz), some things have been slightly off. When I texted someone a link, they didn't get it. When I visited it at work, it was blocked (and so I couldn't link to it on my "about me" page). It turns out, `.xyz` domains, due to their low price, are heavily involved in scam texts and such. So, I made a short-term solution: pointing `johan.vandegriff.net` (my old site's domain which I still owned) to the same content as `johanv.xyz`.

Then the problem is that vandegriff is STILL hard to spell, and having two duplicate sites is unelegant. A more long-term solution was in order. I initially thought of moving to `johanv.tv`, but after a asking people [online](https://fosstodon.org/@johanv/108750900373968186) and in person, and thinking it over, `johanv.net` seemed like a more general-purpose name. The subdomains would make more sense (`games.johanv.net` seems better than `games.johanv.tv`), and people already know about `.net` while `.tv` remains a bit of a novelty.

I had a moment of inspiration: What if I make my Owncast livestream my main page, and modify the code so I can host the rest of the site on it? That way when people visit my site and I am streaming, it appears at the top. I could just do this with an embed, but then the stream would be available in two places. Besides, this method gives me some cool long-term ideas: I want to be able to edit pages from the Owncast admin dashboard, like wordpress.

## First Steps
First, I wanted to make a prototype to see how hard it would be to modify Owncast into a more full personal website. I spent some time hacking on Owncast's `index.html` to hide the Owncast generated content and insert a static HTML page that resembled my existing site.

Then, I did some research on how I wanted to make the HTML that I would be inserting into Owncast. Previously, I used PHP to do templating on my site, with a common header and footer for each page. You could set custom values when including the header to modify it slightly, such as changing the title, description, and selected page in the navigation bar. In my research, I found that I was looking for a "static site generator" which does this sort of thing, but in a less janky way than PHP. I settled on Hugo, because it seemed the simplest, and it is written in golang, the same language Owncast is written in.

## hugowncast
Since Hugo and Owncast are both written in golang, that got me thinking... what if I could include Hugo as a library within Owncast? Then I could write code to make them interact how I want, rather than trying to do it with some bash scripts that might break eventually. I forked the Owncast repo, and [hugowncast](https://github.com/johanvandegriff/hugowncast) was born!

The first problem was that there are two different places to serve webpages from. I had to modify the logic to first check if Owncast provides the file, and if not, then check Hugo. For the index.html, there has to be a special case that serves the first half of the file from Owncast, and the second half from Hugo.

Then, I separated my personal content from the template, so that hugowncast would be useful for anyone who wants to use it.

## Deploying
I initially deployed hugowncast to a Kubernetes (k8s) cluster on DigitalOcean, and even made a script for managing all the actions I might need to take with that process. In theory, k8s provides scalability and resiliency for applications by running duplicate containers of the same app. Unfortunately, Owncast does not currently support this kind of horizontal scaling. And without the main benefit of k8s, I couldn't justify the extra costs and complexity of managing deployments on a k8s cluster.

So, I moved to a $6/month cloud VM running RancherOS, which is built to run docker containers efficiently. I could have just as well used Ubuntu, but I wanted to try something different, and RancherOS did not disappoint: it comes with docker out of the box, and starts docker containers much faster, so I don't have to wait around for changes to deploy, and there is less downtime.

## Caddy
Imagine you have a web app that serves HTTP on port 8080, such as a hugowncast docker container deployed on RancherOS (hypothetically :). Now you want to enable HTTPS on that web app to make it more secure. If only it was as easy as:
```
johanv.net {
        reverse_proxy www:8080
}
```
Well, with [caddy](https://caddyserver.com/), it is! Before this, I was using apache virtual hosts and certbot, but caddy does all that for me now under the hood. Now, I just have to modify one file (/etc/caddy/Caddyfile) for all my sites, and the format is a lot simpler. Also, caddy itself can run inside docker which makes it easy to run on RancherOS.

Caddy also solves the problem of redirecting my old URLs to the new site, and it can even function as a URL shortener using path-based routing.

## Multistreaming
My old setup had a system for streaming to multiple sites at once (Owncast, Twitch, YouTube, Odysee, DLive, etc.) by using someone's custom build of nginx to forward RTMP streams to any number of destinations.

I searched online for "RTMP multiplexing" and found an app called [prism](https://github.com/muesli/prism), and another based on it called [prism+](https://github.com/geekgonecrazy/prismplus), which are coincidentally both made by folks I happen to follow on Mastodon. I decided on prism because it is a simple command I can run locally for now. Update: I tried to stream with prism, and it failed, so I'm back to nginx until I can fix that.

In the future, I want to integrate prism or prism+ into the hugowncast server to provide multistream support out of the box, which is much nicer than having to multiplex from your local computer. To aggregate all the chatrooms, I currently have a service I wrote in nodejs, which I want to rewrite in golang so I can include it as a library in hugowncast.

## Oops, All Golang
Let me let you in on a little secret: All this stuff is written in golang! (Owncast, Hugo, Caddy, Prism, Prism+). I swear I didn't do it on purpose, but it has the side effect of making integrating the components easier.

Given this, maybe I can even integrate caddy into hugowncast to further streamline the deployment process, so users can get HTTPS out of the box. Imagine renting a cloud server, pointing a domain to it, running this:
```bash
docker run --name myhugowncast -d --restart unless-stopped \
  -p 80:80 -p 443:443 -p 1935:1935 \
  -v ~/data:/app/data \
  -v ~/hugo:/app/hugo \
  -e EMAIL="user@example.com" \
  -e DOMAIN="johanv.net" \
  -it johanvandegriff/hugowncast:latest
```
and having a livestream server and personal website ready to go. (disclaimer: don't run the command now, not all of this is implemented yet.) Maybe a better solution would be docker-compose to keep hugowncast and caddy separate, so you can have other sites.

## File Upload Service
One thing I missed about my old site was the file upload and sharing service. I could easily log in from any computer and upload files, then see a listing and download them from any computer. The new site doesn't have this ability since Hugo only does static sites (not dynamic like this would be), so I did some research and found [miniserve](https://github.com/svenstaro/miniserve), which serves a directory as a webpage. I deployed minserve to [files.johanv.net](https://files.johanv.net), with read-only permission, then I deployed it again to [upload.johanv.net](https://upload.johanv.net) with read and write permissions, but password protected.

## Full Setup Commands
For the full list of commands I ran to set up `johanv.net`, as well as the source code for my entire site, see [this repo](https://codeberg.org/johanvandegriff/johanv.net/).
