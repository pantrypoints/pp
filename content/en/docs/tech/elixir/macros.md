---
title: Macros
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 130
---


Elixir is based on functions in functions in functions. 

Functions have a complicated syntax. To simplify them, the functions are organized into "macros" by `defmacro`. 

Macros are evaluated at compile time and must return `quote` expression. 

These are then used to define constants and DSLs. But macros are really just reused functions. 



## Quote

`quote` substitutes `{function, metadata, arguments}` usually `{Expression, Modules, Nested Expressions}`

`quote` translates whatever is in it as AST which has precedence. 



```
quote do 
  1 + (2 - 3)
end
```

is translated as AST:

`{:+, [...], [1, {:-, [...], [2,3]}]}`



`quote do: variable` translates to `{:variable, [], Elixir}``


Quoted literals return themselves

```
quote do: "hey"
# "hey"
```


## Unquote

String interpolation inside quotes

```
n = 12

quote do: 1 + unquote(n)
# {:+, [context: Elixir, imports: [{1, Kernel}, {2, Kernel}]], [1, 12]}
```



Macro.to_string -- converts the long macro to its string version


## Defmacro

```
defmacro my_if do

end
```

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end


<!-- grok is to simplify -->

<!--   def some_method do
    quote do
      use Phoenix.Router, helpers: false

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end -->
