---
title: Config
description: Config of a Phoenix App
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2023-08-20
weight: 32
draft: true
---


## Filter Parameters

```
config :phoenix, :filter_parameters, ["attribute1", "attribute2"]
# encrypts attribute1 and attribute2

config :phoenix, :filter_parameters, {keep: "attribute1"}
# encrypts all attributes except attribute1
```

