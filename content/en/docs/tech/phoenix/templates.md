---
title: Templates
description: Phoenix Templates
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-04-22
weight: 200
---


Data loading should never happen inside the template

Use functions instead of static variable assignments

As of Phoenix 1.7, HEEX tags can only be used in the body of the tag. 

Explicitly precompute the assign outside of render:

`assign(socket, sum: socket.assigns.x + socket.assigns.y)`


Do not compute it withiin a static render

```
def render(assigns) do
	sum = assigns.x + assigns.y
	~H"""
		<%= sum %>
	"""
end
```

