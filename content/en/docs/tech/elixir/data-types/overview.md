---
title: Overview
description: "Elixir uses Data Types" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 2
---


Elixir uses dynamic types based on Erlang where the type is determined by the data entered in the variable. 

## Data Types

### Built-in types

1. Atom - literal constants with a name (true, false, and nil are atoms)
2. Float - numbers with floating point precision
3. Function - a reference to code chunk, created with the fn/1 special form
4. Integer - whole numbers (not fractions)
5. List - collections of a variable number of elements (linked lists)
6. Map - collections of key-value pairs
7. Process - light-weight threads of execution
8. Port - mechanisms to interact with the external world
9. Tuple - collections of a fixed number of elements


### Data types without a module

1. Bitstring - a sequence of bits, created with Kernel.SpecialForms.<<>>/1. When the number of bits is divisible by 8, they are called binaries and can be manipulated with Erlang's :binary module
2. Reference - a unique value in the runtime system, created with make_ref/0


### Other Data types

These are built on top of the types above.

1. Date - year-month-day structs in a given calendar
2. DateTime - date and time with time zone in a given calendar
3. Exception - data raised from errors and unexpected scenarios
4. MapSet - unordered collections of unique elements
5. NaiveDateTime - date and time without time zone in a given calendar
6. Keyword - lists of two-element tuples, often representing optional values
7. Range - inclusive ranges between two integers
8. Regex - regular expressions
9. String - UTF-8 encoded binaries representing characters
10. Time - hour:minute:second structs in a given calendar
11. URI - representation of URIs that identify resources
12. Version - representation of versions and requirements



### "Strings"

#### Manipulating Strings

`String.split` - converts string into a list with each word put in quotes, separated by a comma

```
"asdfasd" |> String.split
```



### {Tuples} for fixed number of elements

`{"string", integer, f.loat, :atom}`

`elem(variable, position_in_index)` to extract values in the tuple

```
a = {"Lam", 143}
elem(a, 1)`
# 123
```



### [Character List]

Denoted by `~c`

`?x` denotes the code point of `x`



### Binary <<1, 2, 3>>




<!-- 
is_integer()
is_float()
--> 



### Atom

An atom's name is the same as its value

```
Atom
:atom_name
:Atom_name
:"Atom name"
```



## Converting Data Types


### Convert string to numbers 

`String.to_integer` and `String.to_float` - converts a string-integer and string-float into an integer and float 

```
"123" |> String.to_integer
"123.123" |> String.to_float
```

```
Integer.parse, Float.parse

123 |> Integer.parse
```


``` elixir
# returns tuple e.g. {123.45, ""}
Integer.parse(n)
Float.parse(n)

# returns integer
String.to_integer(n)
String.to_float(n)


Decimal.new(n) |> Decimal.to_integer
Decimal.new(n) |> Decimal.to_float
```


Example
``` elixir
"1.0 1 3 10 100" |> String.split |> Enum.map(fn n -> Float.parse(n) |> elem(0) end)
[1.0, 1.0, 3.0, 10.0, 100.0]
```


### Convert numbers to string

``` elixir
n |> to_string([decimals: 2, compact: true])
```



### Convert float to charlist

``` elixir
n |> to_charlist()
```




### Erlang Functions

``` elixir
:timer
```
``` elixir
IO.puts "whatever"
```


## Module

container for the functions

``` elixir
defmodule ModuleName1 do
  def function_name(argument1, argument2,..) do 
    ModuleName2.function_name()
```








<!-- Integer.parse("01") # {1, ""}
Integer.parse("01.2") # {1, ".2"}
Integer.parse("0-1") # {0, "-1"}
Integer.parse("-01") # {-1, ""}
Integer.parse("x-01") # :error
Integer.parse("0-1x") # {0, "-1x"}
Similarly
String.to_integer/1
has the following results:
String.to_integer("01") # 1
String.to_integer("01.2") # ** (ArgumentError) argument error
:erlang.binary_to_integer("01.2")
String.to_integer("0-1") # ** (ArgumentError) argument error
:erlang.binary_to_integer("01.2")
String.to_integer("-01") # -1
String.to_integer("x-01") # ** (ArgumentError) argument error
:erlang.binary_to_integer("01.2")
String.to_integer("0-1x") # ** (ArgumentError) argument error
:erlang.binary_to_integer("01.2")
Instead, validate the string first.
re = Regex.compile!("^[+-]?[0-9]*\.?[0-9]*$")
Regex.match?(re, "01") # true
Regex.match?(re, "01.2") # true
Regex.match?(re, "0-1") # false
Regex.match?(re, "-01") # true
Regex.match?(re, "x-01") # false
Regex.match?(re, "0-1x") # false -->
