---
title : "Meta-Programming and the Abstract Syntax Tree"
description: "Metaprogramming and the Abstract Syntax Tree"
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-09-22
weight: 135
---


AST is a data structure composed of the following elements:

## Quote Literals

- :atom
- 1nteger
- f.loat
- "string"
- ["l", "i", "s", "t"]
- {"2-element", :tuple}


## 3-Element Tuples

The building block of an Elixir program is a tuple with three elements

- variables `{name, meta, context}`
- calls `{function, context/meta, arguments}`


"Calls" such as `sum(1, 2, 3)` create ASTs such as `{:sum, meta, [1, 2, 3]}`. 



