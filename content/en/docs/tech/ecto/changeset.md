---
title: Ecto Changeset
description: Ecto Changeset
image: "/graphics/elixir.jpg"
tags: ['Phoenix']
date: 2022-04-15
---


Changsets allow manipulation of the data to match Schema so that it can be passed to the Repo

- Cast: filters the parameters with the attributes to be accepted into the changeset
- Validate: validates those filtered attributes. This includes constraints which are set on the database level


<!-- @primary_key
    @primary_key {:uuid, :binary_id, autogenerate: true}

@schema_prefix
@foreign_key_type
@timestamp_opts
 -->


<!-- Creates a changeset named-struct from the changeset settings based on change:

`def change_tablename(%Tablename{} = tablename, attrs \\ %{}), do: Tablename.changeset(tablename, attrs)` -->


<!-- Functional programming is continuous where each function is connected to each other with the and the main advantage is that the state management.  -->

<!-- Object-oriented programming is not continuous. Functions are split into objects. This makes it easy for the mind.  -->

## Schema'd Changeset

Schemas are a useful shortcut used in querying so you don't have to specify all the attributes 


### Defining 

``` elixir
def changeset(schemaname, attrs) do
  schemaname
  |> cast(attrs, [:key1, :key2,..])
  |> validate_required([:key1])
  |> validate_inclusion(:name, ["John", "Jack"])
  |> validate_exclusion(:name, ["Jub Jub"])
  |> validate_length(:country, is: 2)
  |> validate_length(:password, min: 8, max: 32)
end
```


### Calling

``` elixir
attrib_name = get_field(changeset, :attrib_name)
```


## Schemaless Changeset

### Defining

``` elixir    
model = %{key1: :string, key2: string} 
attributes = %{key1: "value", key2: "value"}    
changeset = {%{}, model}
  |> cast(attributes, Map.keys(model))
  |> validate_required([:key1])
end
```


## Schema Associations 

sets relationships between tables 

- has_many
- has_one
- belongs_to
- many_to_many


### Virtual Attributes

Disposable attributes that are not saved to the database. For example, an office address that is used to get a latitude and longitude to store in the database, without storing the office address

### Embedded Schema

A schema that doesn't use a datbase

