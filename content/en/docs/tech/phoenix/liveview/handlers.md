---
title: Handlers
description: Live View handlers handle changes in state
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-01-22
weight: 80
---


Handlers handle events from the HTML attributes `phx-` in the view and render the changes in the data (or "state") by updating the assign-map in the socket-struct. 

```
phx-value-id="<%= struct.id %>"


%{"input-data" => elixir-variable-repersenting-a-string}
```


### handle_params

- handles URL parameters that affect Routes via live_patch
- why not call it as handle_url??
- sends an event as data-phx-link-state
- always invoked after `mount`
- handles dynamic states, just as mount handles static states

``` elixir
handle_params(parameters_of_url, url, socket) do 
  # manipulate the socket data here to automatically output and update the view
  {:noreply, socket}
```


``` elixir
# has parameters
def handle_params(%{"id" => id}, parameters_of_url, url, socket) do 
  # manipulate the socket data via the id state
  {:noreply, socket}
end

# empty parameters
def handle_params(%{_, _url, socket) do
  # if no url parameter is entered then just show the socket
  {:noreply, socket}
end

# rendering whatever
def render(data) do
  always_needed_assigns = %{key: data}
  ~L"""
    <%= @key %>
  """
end
```




### handle_event

- handles external messages (events) from the template bindings such as `phx-click`
- why not call it `handle_external`???
- must return `:no_reply` tuple `{:no_reply, socket}`


```
def handle_event("name_of_external_message_or_event_in_html", %{metadata_about_the_event}, socket_struct) do
  # set the value
  key = socket.assigns.key + 10
  socket = assign(socket, key: value)

  # update the value
  socket = update(socket, :key, &(&1 + 10))

  {:no_reply, socket}
end 
```



#### handle_info

- handles internal messages (info) 
- why not call it `handle_internal`???
- must return `:no_reply` tuple `{:no_reply, socket}`


``` elixir
def handle_info(name_of_internal_message, socket_struct) do
  assign(socket, :key, value)
  {:no_reply, socket}
end 
```

