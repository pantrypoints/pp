---
title: How to Install Elixir Phoenix on Linux
description: How to Install Elixir Phoenix on Linux Mint
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2023-12-12
weight: 160
---


## 1. Install `asdf`

```
sudo apt install curl git unzip

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
```

Add to `~/.bashrc`

```
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
```


## 2. Use `asdf` to Install Plugins


### Erlang

<!-- apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk inotify-tools -->

```
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk inotify-tools

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf list all erlang
```

Install the version you want

```
asdf install erlang 26.2

asdf global erlang 26.2
````


### Elixir 

```
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf list all elixir
```

Install the version you want

```
asdf install elixir 1.15.7-otp-26

asdf global elixir 1.15.7-otp-26
````


### Others

```
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

## Install Phoenix

```
mix archive.install hex phx_new
```


