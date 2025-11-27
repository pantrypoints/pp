---
title: Overview
description: Live View is one of the best features of Phoenix
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-01-22
weight: 1
---


Live View is a Genserver that turns Phoenix into a Websocket Server. This eliminates the need for Javascript frameworks like React or Vue. Live Components replace React Components. Though you can still use React if you want to make life difficult for yourself.


## The Socket

- a `%struct{}` that has an `assigns` key-value `%{map}` 
- the assigns map has the LiveView state info
- 'socket assigns' therefore means the map-data
- changes in the socket always need any of the following tuples

```
{:ok, socket}
{:no_reply, socket}
{:error, socket}
```


### mount/3

- creates a LiveView process from the router

`(map_of_query_router_params, session_data, socket_struct)`

- `GET` in REST is `mount` or `patch` for websockets
- **must return a `{:ok, socket}` tuple**
- can be revealed by `IO.inspect(socket)`
- called twice:
  1. To load the HTML
  2. After it has connected to the websocket
  

```
def mount(map_of_query_router_params, session_data, socket_struct) do
  {:ok, assign(socket_struct, :key, value)}
end
```

### assign function for the assign map


`assign(socket, :key1, value1)`

- sets the state or gives data to the socket struct
- usually written in 2 ways

```
# inline in the :ok tuple
{:ok, assign(socket_struct, :key, value)}

# before the :ok tuple
socket = assign(
  socket,
  key1: value1,
  key2: value2,
  ...  
  )
{:ok, socket}
```




### render(assigns_map)

- renders the socket assigns
- needs to output content as a 'sigil'

```
~L"""
# Liveview 0.16
<div style="width: <%= @key_in_the_assigns_map %>"}

# Liveview 0.19
<div style={"width: #{@key}"}
"""
```





## Subscribe - Broadcast

### Subscribe 

``` elixir
def mount(_params, session, socket) do
  Phoenix.PubSub.subscribe(App.PubSub, "topic_name")
  ...
  {:ok, socket}
end
```

### Broadcast

``` elixir
def broadcast({:ok, message}, event) do 
  Phoenix.PubSub.broadcast(App.PubSub, "topic_name", message)
  {:ok, data}
end`
```


## LIVE COMPONENTS

### @impl true

Tells LiveView to implement the callback

```
@impl true 
def render(assigns) do
  ~L"""
  whatever
  """
```


### Stateful by adding `id` and pointing to the Component with `@myself`

Add `id` to the live_component to make it 'stateful'

```elixir
<%= live_component @socket, MessageComponent, id: 1 %>
```

Add `@myself` to the stateful form to make the Component handle the event

```elixir
<form phx-submit="send-message" phx-target="<%= @myself %>" %>
```
 



### Card Component with Form

```elixir
defmodule CardComponent do

  def render(assigns) do
    ~H"\""
    <form phx-submit="..." phx-target={@myself}>
      <input name="title"><%= @card.title %></input>
      ...
    </form>
    "\""
  end
```


### Listing of cards

```elixir
<%= for card <- @cards do %>
  <%= live_component CardComponent, card: card, id: card.id, board_id: @id %>
<% end %>
```

Form submission triggers `CardComponent.handle_event/3` which must update the card. 


## LiveView as the Source: self()

The component and the view run in the same process. So, sending an internal message from the LiveComponent to the parent LiveView is done by sending a message to `self()`:


```elixir
send self(), {:message_name, %{content_of_message}}
```



```elixir
defmodule CardComponent do
  ...
  def handle_event("update_title", %{"title" => title}, socket) do
    send self(), {:updated_card, %{socket.assigns.card | title: title}}
    {:noreply, socket}
```

LiveView then receives this event using `c:Phoenix.LiveView.handle_info/2`:

```elixir
defmodule BoardView do
  ...
  def handle_info({:updated_card, card}, socket) do
    # update the list of cards in the socket
    {:noreply, updated_socket}
```

The LiveView will send the updated card to the component.

Alternatively, the could be updated via broadcast by using `Phoenix.PubSub` to all users subscribed to it.
 
```elixir
defmodule CardComponent do
  ...
  def handle_event("update_title", %{"title" => title}, socket) do
    message = {:updated_card, %{socket.assigns.card | title: title}}
    Phoenix.PubSub.broadcast(MyApp.PubSub, board_topic(socket), message)
    {:noreply, socket}
  end

  defp board_topic(socket) do
    "board:" <> socket.assigns.board_id
```


## LiveComponent as the Source

In this case, LiveView must only fetch the card ids, then render each component only by passing an ID:

```elixir
<%= for card_id <- @card_ids do %>
  <%= live_component CardComponent, id: card_id, board_id: @id %>
<% end %>
```

Each CardComponent will load its own card making expensive N queries, where N is the number of cards. So we use the `c:preload/1` callback to make it efficient.

Once the card components are started, they can each manage their own card, without concern for the parent LiveView.

Components do not have a `c:Phoenix.LiveView.handle_info/2` callback. Therefore, if you want to track distributed changes on a card, you must have LiveView receive those events and redirect them to the appropriate card. 

For example, if card updates are sent to the "board:ID" topic, and that the board LiveView is subscribed to the  said topic, one could do:

```elixir
def handle_info({:updated_card, card}, socket) do
  send_update CardComponent, id: card.id, board_id: socket.assigns.id
  {:noreply, socket}
```

With `Phoenix.LiveView.send_update/3`, the `CardComponent` given by `id` will be invoked, triggering both preload and update callbacks, which will load the most up to date data from the database.


## LiveComponent blocks

When `live_component/3` `(Phoenix.LiveView.Helpers.live_component/3)` is invoked, it is also possible to pass a `do/end` block:

```elixir
<%= live_component GridComponent, entries: @entries do %>
  <% entry -> %>New entry: <%= entry %>
<% end %>
```

The `do/end` will be available in an assign named `@inner_block`.

You can render its contents by calling `render_block` with the assign itself and a keyword list of assigns to inject into the rendered
content. For example, the grid component above could be implemented as:

```elixir
defmodule GridComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"\""
    <div class="grid">
      <%= for entry <- @entries do %>
        <div class="column">
          <%= render_block(@inner_block, entry) %>
        </div>
      <% end %>
    </div>
    "\""
  end
end
```

Where the `entry` variable was injected into the `do/end` block.

Note the `@inner_block` assign is also passed to `c:update/2`
along all other assigns. So if you have a custom `update/2`
implementation, make sure to assign it to the socket like so:

```elixir
def update(%{inner_block: inner_block}, socket) do
  {:ok, assign(socket, inner_block: inner_block)}
end
```