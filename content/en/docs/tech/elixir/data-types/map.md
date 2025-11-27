---
title: Maps
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-09-22
weight: 139
---


These are key-value stores.

Keyword lists allow only atom-keys and are ordered. 

But Maps do not. 



``` elixir
map = %{ph -> manila, us -> wash}
```

**Setting**  

```
m = %{a: 1}

m = %{a => 1} # the => goes deeper

%{a: 1} == %{:a => 1}

map = %{:atom => "string", "string" => "string"}
mapshortcut = %{atom: "string", atom2: "string"}

# binding to variable
%{"string" => string}
```

```
defstruct [:name, :age]

attributes_map = %{name: "Lam", age: 20}
struct()
```


**Calling**

```
m[:a]
1

map.atom
map["string"]
map[:atom]
```

Vars can be set as map keys

```
v = "very long name representing a long integer"
m = %{v: 123456789}
m = %{v => 123456789} # want to assign what v represents and attach it to 123456789 value
```

If a duplicate is added to a map, it will replace the former value:

```
m = %{:v => 1, :v => 2}
%{v: 2}

m = %{v: 1, v: 2}
%{v: 2}
```


<!-- 
## Maps

### Structs: Specialized Maps

#### Defining

``` elixir
defmodule ModuleName do
  defstruct [:key1, :key2]
end
```

#### Calling

``` elixir
%ModuleName{key1: value, key2: value}

module = %ModuleName{key1: value, key2: value}
module.key1
```

> data type must match! (atoms vs strings)

 -->

### Updating Maps via Pattern Matching

Unlike other languages where `=` forces assignment, `=` in Elixir is a query for match. 


```
person = %{ name: "Dave", height: 1.88 }


%{ name: a_name } = person  # checks if person has a name key
%{height: 1.88, name: "Dave"} 

%{ name: _, height: _ } = person  # checks if there are values for the keys :name and :height
%{height: 1.88, name: "Dave"}

%{ name: "Dave" } = person # checks whether the key :name has the value "Dave"

%{ name: _, weight: _ } = person # check for key :weight
** (MatchError) no match of right hand side value: %{height: 1.88, name: "Dave"}
```


Updating a map ceates a new map

```
m = %{a: 1}
m = %{m | a: 2} # or m = %{m | a => 2}
```



