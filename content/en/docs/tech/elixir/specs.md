---
title: Type Specs
description: "Type Specs" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 194
---


Used to document types, specs, behaviors

`input :: return_value`

Example:

```
@type year :: integer

@spec age(year) :: integer

@type error_map :: %{message: String.t, line: integer}
```



