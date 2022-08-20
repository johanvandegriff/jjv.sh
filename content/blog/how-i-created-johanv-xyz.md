---
title: "How I Created johanv.xyz (and subsequently destroyed it)"
date: 2019-06-08T04:18:50-04:00
tags: []
---

## Update 2022-08-05
I have since moved to [johanv.net](https://johanv.net). Keep reading if you want, but most of the links in this article are old.

## The Backstory

A few weeks ago, I was bemoaning the fact that my website URL was too long ([johan.vandegriff.net](https://johan.vandegriff.net/)), so I went on the search for a shorter (and more trendy ;) domain name. I found johanv.xyz on [namesilo](https://www.namesilo.com/) for only a few dollars a year. Then I decided to use [DigitalOcean](https://www.digitalocean.com/) to host the new website since it's only $5 a month and it provides a lot of flexibility for setting up web services.

As I was creating a droplet (that's what DigitalOcean calls their cloud virtual machines), I noticed a "Marketplace" tab with dozens of preconfigured options! After doing my reading on the ones that seemed interesting, I chose to go with Dokku because it advertised easy installation of separate web apps. And little did I know that I had found my new favorite software project!

As I started to build the site, I was amazed at the awesome features of Dokku. Deploying an app is really easy - just create some files, initialize them as a git repo, and push the repo to Dokku, which takes care of the rest. Each app is on a separate subdomain (e.g. [johanv.xyz](http://johanv.xyz/), [blog.johanv.xyz](http://blog.johanv.xyz/), [games.johanv.xyz](http://games.johanv.xyz/), etc.), and Dokku manages each one, keeping track of the virtual hosts, docker containers, etc. behind the scenes. It even has a Let's Encrypt module to add https with only two commands!

I haven't been this impressed with a software project since I discovered that you can install almost anything in the Arch User Repository (AUR). Oh wait, turns out Dokku is [in the AUR](https://aur.archlinux.org/packages/dokku) as well - a match made in heaven! Maybe I'll migrate to an Arch server in the future... or install it on Manjaro locally to easily test web apps.


## The Update

The first thing I did was log in and update the system:

```
ssh root@johanv.xyz
apt update
apt dist-upgrade
apt-get install -qq -y dokku herokuish sshcommand plugn
reboot
```


## The Main Site

For the main site, I just copied my old site over and pushed it to Dokku. Most of the links don't work, and I plan to rework it in the future anyway (adding mobile support as well).

```
mkdir main-site
cd main-site
git init
git remote add dokku dokku@johanv.xyz:main-site
cp /path/to/old-site/johan.vandegriff.net/{index,header,footer}.php .
git add --all
git commit -m "importing php from old site"
git push dokku master
```


## Let's Encrypt!

To enable HTTPS, I had to install a plugin, which is super easy and well documented:

```
ssh root@johanv.xyz dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
ssh dokku@johanv.xyz letsencrypt:cron-job --add #auto renew certs
```

Then I could set the "main-site" app's url to johanv.xyz and enable HTTPS:

```
ssh dokku@johanv.xyz domains:set main-site johanv.xyz
ssh dokku@johanv.xyz config:set --no-restart main-site DOKKU_LETSENCRYPT_EMAIL=my@email.address
ssh dokku@johanv.xyz letsencrypt main-site
```


## Messing Around

I added and removed some subdomains to get more familiar with Dokku. Here's the process for a subdomain at test1.johanv.xyz serving a static index.html page:

```
mkdir test1
cd test1
touch .static
nano index.html #add anything
git init
git remote add dokku dokku@johanv.xyz:test1
git add --all
git commit -m "test static site"
git push dokku master
ssh dokku@johanv.xyz config:set --no-restart test1 DOKKU_LETSENCRYPT_EMAIL=my@email.address
ssh dokku@johanv.xyz letsencrypt test1
```


## Adding an SSH Key

At a certain point I wanted to switch to another local computer to continue working on the site, so I had to add another ssh key to Dokku. First, I generated the key:

```
[new computer] ~$ ssh-keygen -b 4096
```

Then I logged in as root from the old computer and added the public key to the root account by opening the file in nano and pasting the key as a new line:

```
[old computer] ~$ ssh root@johanv.xyz
[root@johanv.xyz] ~$ nano /root/.ssh/authorized_keys
```

Then I still had to add it to the dokku user, which stores it differently, with this command:

```
[new computer] ~$ cat ~/.ssh/id_rsa.pub | ssh root@johanv.xyz "sudo sshcommand acl-add dokku `hostname`"
```


## WriteFreely

After looking around for things that would run easily on Dokku that I could use to post content to my new website (wordpress, ghost, grav, etc.), I settled on WriteFreely since there was [an awesome tutorial by Evan Walsh](https://write.hellowelcome.org/evan/deploying-writefreely-via-dokku) on how to set it up.

First I created a new directory and some config files:

```
mkdir blog
cd blog
cat <<EOF >Dockerfile
FROM writeas/writefreely

COPY config.ini .

EXPOSE 8080

CMD ["bin/writefreely"]
EOF

cat <<EOF >config.ini
[server]
hidden_host          = 
port                 = 8080
bind                 = 0.0.0.0
tls_cert_path        = 
tls_key_path         = 
templates_parent_dir = 
static_parent_dir    = 
pages_parent_dir     = 
keys_parent_dir      = 

[database]
type     = sqlite3
filename = db/writefreely.db
username = 
password = 
database = 
host     = localhost
port     = 3306

[app]
site_name         = johanv.xyz blog
site_description  = 
host              = https://blog.johanv.xyz
theme             = write
disable_js        = false
webfonts          = true
single_user       = true
open_registration = false
min_username_len  = 3
max_blogs         = 3
federation        = true
public_stats      = true
private           = false
local_timeline    = true
user_invites      = user
EOF
```

These were mostly copied from the tutorial, but I changed the site's name, the site's URL, and I set it to a single user instance. Then I created the app:

```
ssh dokku@johanv.xyz apps:create blog
```

And set up persistent storage to preserve the database and keys when rebuilding the app:

```
ssh root@johanv.xyz mkdir -p /var/lib/dokku/data/storage/writefreely/{db,keys}
ssh root@johanv.xyz chown -R bin:bin /var/lib/dokku/data/storage/writefreely/
#https://github.com/dokku/dokku/issues/2215

ssh dokku@johanv.xyz storage:mount blog /var/lib/dokku/data/storage/writefreely/keys:/go/keys
ssh dokku@johanv.xyz storage:mount blog /var/lib/dokku/data/storage/writefreely/db:/go/db
ssh dokku@johanv.xyz proxy:ports-set blog http:80:8080
```

Now it was time to push the app to Dokku:

```
git init
git add --all
git commit -m "init"
git remote add dokku dokku@johanv.xyz:blog
git push dokku master #this build fails
```

After that, the site was visible, but it displayed an internal error. Next I initialized the WriteFreely instance, and viewed the list of commands because I was curious how to manage users:

```
ssh dokku@johanv.xyz run blog --help
ssh dokku@johanv.xyz run blog --init-db
ssh dokku@johanv.xyz run blog --gen-keys
```

With the app initialized, I rebuilt it and the internal error was replaced with an empty blog site:

```
ssh dokku@johanv.xyz ps:rebuild blog
```

Since I set it up as a single user instance, I had to initialize an admin account to be able to log in (Of course I put a real password instead of just "password" :):

```
ssh dokku@johanv.xyz run blog -create-admin johanv:password
```

Lastly, I enabled HTTPS (otherwise anyone could sniff my creds when logging in) and it worked without a hitch!

```
ssh dokku@johanv.xyz config:set --no-restart blog DOKKU_LETSENCRYPT_EMAIL=my@email.address
ssh dokku@johanv.xyz letsencrypt blog
```


## Conclusion

So, that's how I got this site to its current state, thanks to DigitalOcean, WriteFreely, and most of all, Dokku. I have much migration from [the old site](https://johan.vandegriff.net/) to do, and many more subdomains planned. :)


## Credits

[Comprehensive Dokku Tutorial by Max Schmidt](https://maximilianschmitt.me/posts/tutorial-deploy-apps-websites-dokku/)
[Let's Encrypt Cert for Main Domain](https://github.com/dokku/dokku-letsencrypt/issues/146)
[WriteFreely for Dokku](https://write.hellowelcome.org/evan/deploying-writefreely-via-dokku)
[Permissions Issue in WriteFreely](https://github.com/dokku/dokku/issues/2215)
[Adding a New SSH Key](https://www.digitalocean.com/community/questions/dokku-add-new-ssh-key)