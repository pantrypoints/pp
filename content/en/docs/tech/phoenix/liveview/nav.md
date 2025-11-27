---
title: Navigation
description: We list down essential concepts in Liveview Navigation 
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-04-22
weight: 140
---


Liveview has two ways to Navigate:

1. Client 

```
# 0.16
<%= live_patch "Text", to: Routes.live_path(@socket, __CURRENTMODULE__, id: struct.id) %>

# 0.19
<.link patch={~p"/pages/#{@page}"}Go</.link>
```



2. Server   

```
# 0.16
push_patch(to: socket.assigns.return_to)

# 0.19
{:noreply, push_patch(socket, to: ~p"/pages/#{@page})
```

	


### live_patch push_patch

This navigates to the same Liveview. 

Live Routes are `PATCH` because it updates or patches the LiveView process with the new data and sends a new 'diff' to the DOM


`__CURRENTMODULE__` is a shortcut for the Module Name

