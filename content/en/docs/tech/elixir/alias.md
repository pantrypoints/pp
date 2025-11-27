---
title: Alias, Import, Require, Use 
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 13
---


## Reuse Directives: alias, require, import, use


Directive | CookingCourse.CookingMethod.fry/0 | Notes
--- | --- | --- 
`alias as Cook` | `Cook.fry` | Just a shortcut 
`import as CookingCourse.CookingMethod` | `fry` | Allows you to inject functions from another Module inside the current Module. Can conflict if imported Module has same methods unless only: [method: 1]
`use CookingCourse` | `CookingCourse.fry(..)` | Allows you to inject functions, aliases, imports and uses from another Module inside the current Module


<!-- `use as Cook` | Cook.fry |  -->


<!-- # alias as Cook | Cook.fry  -->


### Alias

`alias` shortens the names of long dependent functions so you can reference them with a shorter name

```
alias Enum, as: E
E.each(["one", "two", "three"], &(IO.puts(&1))
```


```
alias VeryLongAppName.{Module1, Module2}

Module1.method
# instead of VeryLongAppName.Module1.method
```


### Use

`use Module` allows the used Module to inject stuff


### Import

`import Module` imports the methods used by that Module so that it can be used in the current Module without referencing it all the time. 


### Require 

`require Module` this lets you use the methods in the Module but you have to add that Module's name

use Module first requires module and then calls the __using__ macro on Module.

Consider the following:

```
defmodule ModA do
  defmacro __using__(_opts) do
    IO.puts "You are USING ModA"
  end

  def moda() do
    IO.puts "Inside ModA"
  end
end


defmodule ModB do
  use ModA

  def modb() do
    IO.puts "Inside ModB"
    moda()     # <- ModA was not imported, this function doesn't exist
  end
end
```

This will not compile as `ModA.moda()` has not been imported into `ModB`.

The following will compile though:

```
defmodule ModA do
  defmacro __using__(_opts) do
    IO.puts "You are USING ModA"
    quote do          # <--
      import ModA     # <--
    end               # <--
  end

  def moda() do
    IO.puts "Inside ModA"
  end
end

defmodule ModB do
  use ModA

  def modb() do
    IO.puts "Inside ModB"
    moda()            # <-- all good now
  end
end
```

As when you used `ModA`, it generated an import statement that was inserted into `ModB`.




### Alias and Import: References to modules

``` elixir
alias Module # just identifies which Module to look into eventually so you call by Module.method()

import Module # actually gets all the functions of Module so you just call method()

@constant = value # assigns a value as a constant at compile-time 
```



### Alias and Import: References to modules

``` elixir
alias Module # just identifies which Module to look into eventually so you call by Module.method()

import Module # actually gets all the functions of Module so you just call method()

@constant = value # assigns a value as a constant at compile-time 
```


