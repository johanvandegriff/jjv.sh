---
title: "How I Created jjv.sh"
date: 2024-11-03T02:31:00-05:00
tags: ["featured", "how i created"]
---

## Here We Go Again...
Time for the biennial (which I just learned is a word meaning every two years) migrating my website to a new domain name!

I haven't done distro hopped in several years. I haven't browser hopped in twice that time (yes, I copied my browser files over to the next distro). But I HAVE server hopped my website every few months, mostly keeping the same domain name, but every two years now I have changed the domain name the same time I change the server.

## Towing the Mobile Home
This most recent one was more of a lift-and-shift, where I zipped up the files on the old server, copied them over to the new server, unzipped them, and ran `docker compose up -d` to download and run all the docker containers with the various subdomains. Ok, the zip file WAS 12 gigabytes and took more than an hour to copy, but it was a simple process. I did tweak the caddy setup so now caddy runs outside of docker so it can proxy services that run outside of docker, and this comes with the limitation that it has to reference docker containers by port instead of hostname.

## We're Visiting, Might as Well Renovate
Also, I had some services already running on jjv.sh, on a different old server, so I lifted-and-shifted those to the new server as well. Then I figured I might as well move johanv.net to jjv.sh, since they were now hosted on the same server. So it was just a matter of going thru each subdomain and updating the caddy config to serve on jjv.sh and redirect any old requests from johanv.net to jjv.sh.

## The Aftermath
Then I had to update all the links in files wherever I could find them, and rename a few repos. I still need to change links to my site on external sites, but the redirects will handle that for now.
