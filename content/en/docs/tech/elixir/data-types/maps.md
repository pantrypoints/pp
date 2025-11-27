---
title: Map Functions
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-09-22
weight: 139
---


## Map Functions

### Map.get(map, key, default_value)

Gets the value of a key in map.
- If key is present, its value is returned. Otherwise, default is returned.
  - If default is not provided, nil is used.


```
Map.get(%{}, :a)
nil # because a is not defined

Map.get(%{a: 1}, :a)
1 # because a is 1

Map.get(%{a: 1}, :b, 3)
3 # because b is nowhere and 3 is the default output 
```

### Map.put(map, key, value)

Puts the value under key in map.

```
Map.put(%{a: 1}, :b, 2)
%{a: 1, b: 2}

Map.put(%{a: 1, b: 2}, :a, 3)
%{a: 3, b: 2}
```