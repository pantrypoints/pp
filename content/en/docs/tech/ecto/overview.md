---
title: Overview
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 2
---


## Ecto

Handles external data such as databases and JSON APIs

- Repo
- Query
- Schema
- Changset

### Repo: communicates with external data source or database

Has common methods:
- get(): gets the record
- insert(): creates the record in that database
- update()
- delete()
- transaction()
...

Phoenix uses Repo through:
- `config.exs` as config `:appname, Appname.Repo,` ...
- `repo.ex` in `/lib/appname/repo.ex`

#### Common methods

``` elixir
Repo.count()
Repo.update_all("tablename", set: [updated_at: Ecto.DateTime.utc])
```



<!-- Ecto has 4 components:

## Ecto.Changeset -- Changes data

These let us track and validate changes before they are applied to the data.


## Ecto.Query -- Reads data
 
Queries are used to retrieve information from a Repo. Ecto queries are secure and composable


## Ecto.Repo -- Where data is

A Repo is a wrapper around the data store. It lets us create, update, destroy and query existing entries. 

A repository needs an adapter and credentials to communicate to the database.


## Ecto.Schema -- How data is

Schemas are used to map external data into Elixir structs.  We often use them to map database tables to Elixir data. 



## get_by/3

`get_by(query, clauses, options)`


 -->