---
title: Protocols
description: "These store and pass executable code around as if it was an integer or a string. They start with `fn` and end with `end" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 162
---


Protocols add polymorphic dispatch to Elixir. They are contracts implementable by data types. 

The standard protocols are:

Protocol | Description
--- | ---
Collectable | collects data into a data type
Enumerable | handles collections in Elixir, as `Enum` module for eager functions and `Stream` module for lazy functions
Inspect | converts data types into their programming language representation
List.Chars | converts data types to their outside world representation as charlists (non-programming based)
String.Chars | converts data types to their outside world representation as strings (non-programming based)

