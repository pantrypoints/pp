---
title: Streams
description: Live View Streams
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-01-22
weight: 191
---


## Streams

Streams began in Liveview `0.18.16`


In server:

```
```

In view:

```
# long version
<div id="list_name" phx-update="stream">
  <%= for {dom_id, i} <- @streams.items do -update="stream" do>
  	<div id={dom_id}>

# for version
<div id="list_name" phx-update="stream">
  <div :for={{dom_id, i} <- @streams.items} id={dom_id} > 
```


### stream_delete

stream_delete(socket, :albums, album)



### stream_insert

Needs a boiler plate

```
def save_post(socket, :new, post_params) do
  case Blog create_post(post_params) do
  	{:ok, post }


defp notify_parent(m), do: send(self(), {__MODULE__, msg})
```
