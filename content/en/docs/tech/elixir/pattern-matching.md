---
title: Pattern Matching
description:  Pattern Matching 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 160
---


Pattern Matching Steps:

1. Evaluate the contents
2. Match them

```
a = 1 # if a matches 1 then ok. Since a has nothing then 1 is assigned to it

[a, a] = ["z", "z"]

[a, a] = ["x", "z"] # error

["x", "x"] = [a, a] # error because a is "z". This exposes that = is really key = value

[^a, ^a] = ["x", "x"] # error because pin operator pins the value of a to "z" which does not match "x"

[a, a] = ["x", "x"] # works because the pattern is matches even if the "x" values are new
```

```
data = %{ name: "Dave", state: "TX", likes: "Elixir" } 

for key <- [ :name, :likes ] do
  %{ ^key => value } = data
  value
end
```