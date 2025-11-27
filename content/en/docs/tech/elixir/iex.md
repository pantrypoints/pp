---
title: IEX
description: "These run elixir commands" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 90
---


Have autocomplete in Windows:`iex --werl`



`i something` get info about something

`h something` get help about something




## How to get out of multiline: type `""""`

```
iex(1)> {a 
...(1)>
...(1)> """"
..
iex(1)>
```

## Compile the Elixir app

```
iex -S mix

iex> c(lib/app.ex)
```

## Recompile

```
recompile()
```


## Reveal Module info

`ModuleName.module_info(:method)`

 `