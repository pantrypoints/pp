---
title: Tuples
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 198
draft: true
---

These are stored contiguously in memory.
- This makes accessing their length fast but modification expensive.
- The new tuple must be copied entirely to memory

Elixir uses tuples to return information from functions.

```
File.read("path/to/existing/file")
{:ok, "... contents ..."}
```

