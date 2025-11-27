---
title: Recursion
description: "Recursion" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-09-24
weight: 181
draft: true
---


Elixir uses recursion instead of for..loops. 

```
# base case
def a(0), do: 0

def a(n) do
  IO.puts n
  a(n - 1) # run a again but this time reduce n by 1
end
```

