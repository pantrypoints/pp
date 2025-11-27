---
title: Structs
description: "Structs" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 193
---



## Structs

<!-- ```
u = %User{email: "a@a.com", account: %Account{type: "general"}}
``` -->

`struct(Struct_name, map)` inserts a map into a Struct


### Updating structs

```
# via struct
a = %Computer{id: 1, kind: "laptop"}
struct(a, kind: "server")

# via | cons
a = %{a | kind: "server"}
```


`put_in` updates a struct 


