---
title: Bindings and Streams
description: Bindings are essential to connect client events to the server and update the socket struct
image: "/img/phx.jpg"
tags: ['Phoenix']
weight: 20
date: 2023-04-22
---


PHX- | What it does
--- | ---
phx-value-* | parameters
phx-click , phx-click-away | Click Events
phx-change , phx-submit , phx-feedback-for , phx-disable-with , phx-trigger-action , phx-auto-recover | Form Events
phx-blur , phx-focus , phx-window-blur , phx-window-focus | Focus
phx-keydown , phx-keyup , phx-window-keydown , phx-window-keyup , phx-key | Key Events
phx-viewport-top , phx-viewport-bottom | Scroll
phx-update , phx-remove | DOM Patching
phx-hook | JS Interop
phx-mounted , phx-disconnected , phx-connected | Lifecycle Events
phx-debounce , phx-throttle | Rate Limiting
phx-track-static | Static

### phx-click

Sends data to the LiveView process through the socket as an event name or a value via `JS.exec` `JS.push` or `phx-value-`


### phx-value-

```
# client
<div phx-click="food" phx-value-veg1="Cucumber" phx-value-veg2="Potato" >


# server
def handle_event("food", %{"veg1" => "Cucumber", "veg2" => "Potato"}, socket) do
``` 

### phx-click-away

runs when a click event happens outside the element. This is useful for hiding drop-downs.


### phx-blur and phx-focus

Used for input

```
<input name="email" phx-focus="myfocus" phx-blur="myblur"/>
```

### phx-window-focus and phx-window-blur

