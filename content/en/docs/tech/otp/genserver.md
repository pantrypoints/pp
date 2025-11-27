---
title: Erlang Genserver
description: Erlang Genserver is a process spawner and manager
image: "/graphics/elixir.jpg"
tags: ['Phoenix']
date: 2022-04-22
weight: 70
---


Erlang Genserver is a process spawner and manager
- simple state change --- Elixir agent wraps state with `get/2` `update/2` `get_and_update/2`
- short asynch computation --- Elixir task provides functions `async/1` `await/1`

GenServer has client and server. 


Client | Server | Client Return | Server Return | Decription 
--- | --- | --- | --- | ---
`.start/3` or `.start_link/3` | `init` | `{:ok, pid}` or `{:error, reason}` | `{:ok, state}` or `{:stop, reason_any_type}` | Initial `state`
`.call/2` | `handle_call/3` | | | sync client to server
`.cast/` | `handle_cast/` | | | async client to server
`.send/` | `handle_info/` | | | handle_info is internal 




## `start_link(__MODULE__, state)` and `init`

Starts the GenServer with a state

Client `.start_link/1` `.start/1` | Server `init`
--- | ---
1 `__MODULE__` | 
2 `state` | 
output: `{:ok, pid}` `:ignore` `{:error, reason}` | output: `{:noreply, state}`


```
  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  # __MODULE__ represents the current Module name
``` 



## `call`

Call is synchronous and waits for a reply. This should be used to prevent the client from sending too much data to the server

Client `.call/2` | Server `handle_call/3`
--- | ---
1 `pid` | 2 `origin`
2 `data` | 1 `data`
(initial `state` from .start/3) | 3 `state`
output: `{:ok, pid}`  | output: `{:reply, reply_data, state}`


```
# Client
def call_name(pid) do
  GenServer.call(pid, :call_name)
end

# Server
def handle_call({:call_name}, origin_of_call_with_pid, state) do
  {:reply, return_value_to_origin, new_state}
end
```



## `cast`

Cast is asynchronous and does not wait for a reply.

Client `.cast/2` | Server `handle_cast/2`
--- | ---
1 `pid` | 
2 `data` | 1 `data`
(initial `state` from .start/3) | 2 `state`
. | output: `{:noreply, state}` 
<!-- :ok -->


```
# Client
def add(pid, item) do
  GenServer.cast(pid, item)
end

def remove(pid, item) do
  GenServer.cast(pid, {:remove, item})
end


# Server
def handle_cast({:cast_data}, state) do
  {:noreply, state}
end
``` 



### `handle_info` responds with 2-tuple asynch

For internal messages

Client `.send/2` | Server `handle_info/2`
--- | ---
1 `pid` | 
2 `data` | 1 `data`
(initial `state` from .start/3) | 2 `state`
. | output: `{:noreply, state}` 


```
# triggered within the GenServer by and returns :ok
Process.send(pid, {:info_data}, [])   

def handle_info ({:info_data}, state) do
  {:noreply, state}
end
```

### stop 

```
# Client
def stop(pid) do
  GenServer.stop(pid, :normal, :infinity)
end
```



```
defmodule ShoppingList do
  use GenServer

  #Server
  def terminate(_reason, list) do
    IO.puts("We are all done shopping.")
    IO.inspect(list)
    :ok
  end
  def handle_cast({:remove, item}, list) do
    updated_list = Enum.reject(list, fn(i) -> i == item end)
    {:noreply, updated_list}
  end

  def handle_cast(item, list) do
    updated_list = [item|list]
    {:noreply, updated_list}
  end

  def init(list) do
    {:ok, list}
  end

end
```



## @impl

Defines a behaviour and **force-implements** it. 

For example, our app has different behaviours [Genservers] for each payment provider.
- We define the behaviour [Genserver] and say that every module that implements the `App.PaymentProvider` behaviour needs to implement a `credit/2` and `debit/2` callback.
- In our own Stripe module we can `@behaviour App.PaymentProvider`
  - It means we will need to implement `debit/2` and `credit/2`

We should switch between Paypal and Stripe. Both `Paypal.credit/2` and `Stripe.credit/2` should take the same arguments and return the same type/structure.

They have optional callbacks. You can define your own or use the default. This is why we do not need to implement `Phoenix.LiveComponent.update/2`, but you can `impl` it if you want.

If you put one `@impl` over a function, the compiler will complain because you iplemented it for another callback but not that specific one, so it thinks you made a possible mistake.



<!-- 
## Client

### `start_link`

`GenServer.start_link(__MODULE__, [initial_data])`


### `cast`

``` 
def message_name(message)
  GenServer.cast(pid_or_name, {:message_name, message})
end
```


## Server 

### `init(arguments)` returns `{:ok, data}`


`GenServer.start_link(__MODULE__, [initial_data])`



### `handle_call(:pid_or_name, origin, state)` returns `{:reply, reply, state}`




```
def handle_call(:ask, _from, state) do
    reply = cond do
      state <= 3 -> "No."
      state <= 10 -> "I told you #{state} times already. No."
      true -> "..."
    end

    # increase the count of questions asked
    new_state = state + 1
    # reply to the caller
    {:reply, reply, new_state}
  end


handle_info
 -->