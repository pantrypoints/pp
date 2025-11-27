---
title: Sigils
description: "These store and pass executable code around as if it was an integer or a string. They start with `fn` and end with `end" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 190
---


## Sigils

A sigil is a tilde with a character. 

Sigil | Generates..
--- | ---
~C | ..a character list with no escaping nor interpolation
~c | ..a character list with escaping and interpolation
~R | .. a regular expression with no escaping or interpolation
~r | .. a regular expression with escaping and interpolation
~S | .. a string with no escaping or interpolation
~s | .. a string with escaping and interpolation
~W | .. a word list with no escaping or interpolation
~w | .. a word list with escaping and interpolation
~N | .. a NaiveDateTime struct
~U | .. a DateTime struct (since Elixir 1.9.0)
~D | converts to date which can be accessed by .day .year .month



Sigils are used with delimiters:

<...> A pair of pointy brackets
{...} A pair of curly brackets
[...] A pair of square brackets
(...) A pair of parentheses
|...| A pair of pipes
/.../ A pair of forward slashes
"..." A pair of double quotes
'...' A pair of single quotes


### Char List

```
~c/2 + 7 = #{2 + 7}/ #interpolates
'2 + 7 = 9'

~C/2 + 7 = #{2 + 7}/ #does not interpolate
'2 + 7 = \#{2 + 7}'
```


## Regex

```
re = ~r/elixir/
~r/elixir/

iex> "Elixir" =~ re
false

iex> "elixir" =~ re
true
```

```
string = "100_000_000"
"100_000_000"

iex> Regex.split(~r/_/, string) # ~r/_/ splits the _ and .split turns it to a list
["100", "000", "000"]
```



## String

```
~s/welcome to elixir #{String.downcase "SCHOOL"}/
"welcome to elixir school"

~S/welcome to elixir #{String.downcase "SCHOOL"}/
"welcome to elixir \#{String.downcase \"SCHOOL\"}"
```


## Word List

```
iex> ~w/i love #{'e'}lixir school/
["i", "love", "elixir", "school"]

iex> ~W/i love #{'e'}lixir school/
["i", "love", "\#{'e'}lixir", "school"]
```

## NaiveDateTime

```
NaiveDateTime.from_iso8601("2015-01-23 23:50:07") == {:ok, ~N[2015-01-23 23:50:07]}
```


## DateTime

```
DateTime.from_iso8601("2015-01-23 23:50:07Z") == {:ok, ~U[2015-01-23 23:50:07Z], 0}
DateTime.from_iso8601("2015-01-23 23:50:07-0600") == {:ok, ~U[2015-01-24 05:50:07Z], -21600}
```


## Custom Sigils

```
defmodule MySigils do
  def sigil_p(string, []), do: String.upcase(string)
end

import MySigils
nil

~p/elixir school/
ELIXIR SCHOOL
```
