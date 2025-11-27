---
title: Errors Common in Phoenix
description: We list down common errors in Phoenix
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2023-08-30
weight: 51
---


**Error** `(EXIT) shutdown: failed to start child: Phoenix.PubSub.PG2`

**Solution**
```
mix deps.clean --all
mix deps.get
```


**Error** `undefined module: rename all to heex`


<.form let={f} for={:upload} action={Routes.audio_path(@socket, :upload)} options={multipart={true}} >


**Error**  `(UndefinedFunctionError) function :crypto.hmac/3 is undefined or private`

**Solution** `mix deps.update --all`



