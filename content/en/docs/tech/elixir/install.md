---
title: Installation
description: "Installation steps for Phoenix starting with ASDF" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 91
---


## Install ASDF

asdf installs into ~/.asdf dir:
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
```

Add to ~/.bashrc:

```
. "$HOME/.asdf/asdf.sh" # to be able to type asdf
. "$HOME/.asdf/completions/asdf.bash" # for autocompletion
```


## Use ASDF to install Erlang

```
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git # adding erlang asdf plugin

sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

asdf list-all erlang

asdf install erlang 25.2.3
```


## Use ASDF to install Elixir

```
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf list-all elixir
```

Install the Elixir that matches your Erlang

```
asdf install elixir 1.14.3-otp-25
```

Activate Erlang and Elixir

```
asdf global erlang 25.2.3
asdf global elixir 1.14.3-otp-25
```


## Install Phoenix with Elixir Mix Build Tool


Use Mix to install Hex Erlang Package Manager locally

```
mix local.hex
or
mix archive.install github hexpm/hex branch latest
```

Scaffold a new app
```
mix phx.new hello
```

<!-- $ sudo apt-get install inotify-tools # for Ubuntu users to use hot reload
$ sudo apt-get install postgresql-client # to install DB
$  # to create a Phoenix app named hello -->
