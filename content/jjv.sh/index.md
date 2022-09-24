---
title: "jjv.sh: my personal URL shortener for my URL shortening needs"
description: "info about jjv.sh, my personal URL shortener"
date: 2021-08-13T11:27:55-04:00
tags: []
---

jjv.sh is my personal URL shortener. It stands for <u>J</u>ohan <u>J</u>. <u>V</u>andegriff's <u>sh</u>ort links. Here are some example short links:

 * [jjv.sh/music](https://jjv.sh/music) - all the music me and my brother have made
 * [jjv.sh/boggle](https://jjv.sh/boggle) - play my boggle game online with friends
 * [jjv.sh/about](https://jjv.sh/about) - a bit about me
 * [jjv.sh/lucy](https://jjv.sh/lucy) - pictures of the cute doggo
 * [jjv.sh/charlie](https://jjv.sh/charlie) - pictures of another cute doggo
 * [jjv.sh/carl](https://jjv.sh/carl) - a chatbot
 * [jjv.sh/resume](https://jjv.sh/resume) - my online resume

How does it work, you ask? It uses [caddy](https://caddyserver.com/) with some basic redirect rules:

## /etc/caddy/Caddyfile
```
jjv.sh, www.jjv.sh {
    redir / https://johanv.net/jjv.sh/ html
    redir /about https://johanv.net/about/ html
    redir /boggle https://games.johanv.net/boggle html
    redir /charlie https://johanv.net/gallery/charlie/ html
    redir /resume https://johanv.net/resume/ html
    redir /carl https://games.johanv.net/carl html
    redir /site https://johanv.net html
    redir /music-yt https://www.youtube.com/playlist?list=PL9MPtw9DDuDIJ5uFq6CzSEjeHLLwfEWGx html
    redir /music https://freemusicarchive.org/music/johan-vandegriff html
    redir /dressember https://dressember2021.funraise.org/fundraiser/johan-vandegriff html
    redir /lucy https://johanv.net/gallery/lucy/ html
    redir /ATinyGame https://johanv.net/ATinyGame/ html
    redir /art https://johanv.net/gallery/drawings/ html
    redir /bella https://johanv.net/gallery/bella/ html
    redir https://johanv.net/jjv.sh/ html
}
```
