---
title: Ecto Commands
description: Ecto commands
image: "/graphics/elixir.jpg"
tags: ['Phoenix']
date: 2022-04-15
---

```elixir
post = MyRepo.get!(Post, 42)
post = Ecto.Changeset.change post, title: "New title"
case MyRepo.update post do
  {:ok, struct}       -> # Updated with success
  {:error, changeset} -> # Something went wrong
end
```

```elixir
Repo.get_by(Chat, id: chat_id)
|> Ecto.Changeset.change(%{visible: true}) 
|> Repo.update()
```
