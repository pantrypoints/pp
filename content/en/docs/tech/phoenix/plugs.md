---
title: Function Plugs and Module Plugs
description: Function Plugs and Module Plugs
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-04-22
weight: 160
---


A Plug manipulates data in `conn` structs. It's a Module that has a 'Conn' Struct. It takes and returns that conn struct between modules. 

It allows state management when combined with Agents and Genservers (like Live View). The state is held by the struct and then is passed between Modules. The ability to pass data turns Plugs into Elixir webservers

It has two types:
- Module Plug
- Function Plug

These are functions that get a `Plug.Conn` struct and give a `Plug.Conn` struct.


## Module Plugs

These need to be initialized.


<!-- ```
def blah(conn, options) do
  IO.;puts """
  #"{inspect(conn.method)}"
  """
end
``` -->

This is a large function, as a Module, that needs to be initialized with additional data such as state (i.e. initial state). This makes it more complicated than a function plug

**Setting**

``` elixir
defmodule App.Modulename do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _options) do 
  end

end
```

**Calling**

``` elixir
alias ModulePlugName
plug ModulePlugName, [option: "Blah"] when action is [:index]
```

``` elixir
Controller 

alias Appname.Plugname

plug

function_name.(1,2,3,4)
```



## Function Plugs

These add a `conn` to a Module function. It is a simple function that receives a `conn` struct, manipulates it, and outputs the modified conn struct 


### How to Create Function Plugs

1. Create new Module "test" with `import Plug.conn`
2. Write the function `def function_plug(conn, _options)` that uses `assign()`
3. In the controller, use that Function Plug Module by importing it
4. Call function `plug :blah`
5. Render it in the view with `<%= @conn.assigns[:blah] %>`

Function Plugs take 2 items: 
- `conn`
- `options`

If data is available in `conn` then use function plugs.


<!--     function_name = fn(a,b,c,d) -> (a,b,c,d)
    function_name = &(&1 + &2 + &3 + &4)
    function_name = &(Module.method/4) -->

**Calling**

``` elixir
defmodule App.TotalController do
  import App.ModuleName
  plug :get_total
  ..
end 
```

<!-- in layout:
<%= @conn.assigns[:get_total] %> -->


**Setting `non_piped` and `piped` Function Plugs**

``` elixir
defmodule App.ModuleName do
  import Plug.Conn

  def non_pipe(conn, options) do 
    assign(conn, :non_pipe, 123)
  end

  def piped(conn, _options) do
    conn
    |> put_resp_content_type("text/plain") 
    |> send_resp(200, "From a Piped Function Plug that outputted this data inside this conn struct")
  end

end 
```

**Calling in Elixir**

``` elixir
plug :non_piped
```

**Calling in Phoenix View**

```
<%= @conn.assigns[:non_piped] %>
<%= @non_piped %>
```


<!-- name(1,2,3,4)

function_name = &(Calculator.subtract/2) -->


## Assigns 

``` elixir
assign(key: "#{data.attrib}")
```

<!-- plug = dsl webserver
cowboy = webserver -->
