---
title: DateTime
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 41
---



## DateTime Module Functions

The DateTime module contains functions for timezone aware dates and times.

Here are a few common functions to get you started.

Function | Description
--- | ---
`add/4` | Add time to an existing DateTime struct
`compare/2` | Compare two DateTime structs to see if one is before, after, or the same as another
`diff/3` | Determine the time between two DateTime structs
`new/4` | Create a new DateTime struct and return an {:ok, datetime} tuple
`new!/4` | create a new DateTime struct or raise an error
`utc_now/2` | Get the current utc DateTime.
```
