---
title: Supervisors
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 198
---


## Elixir Supervisors 

- restarts child processes when they fail 


## Strategies

1. `:one_for_one`

If a child terminates, only that process is restarted.

2. `:one_for_all`

If a child terminates, all other children are terminated. Then all children (including the terminated one) are restarted.

3. `:rest_for_one`

If a child terminates, the terminated child and the rest of the children started after it, are terminated and restarted.

