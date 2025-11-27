---
title: "List and Map Function: Enums "
description: Here are a few Enum functions for Lists and Maps
image: "/graphics/elixir.jpg"
tags: ['Phoenix']
date: 2022-03-15
weight: 51
---


<!-- Unlike object-oriented programming languages, Elixir uses structs a lot. This requires a way to manipulate structs which is done by `Enum` and functions.  -->

`Enum.premade_function_to_manipulate_enumerables([a, b, c, d], function_to_manipulate_each_item_in_enumerable)`


## Streams

Streams are lazy Enums. Each element is processed whole before going to the next one. 

Enums on the other hand go through each list before processing each. 

```
range = 1..3 
|> Stream.map(&IO.inspect(&1)) 		# writes range to device
|> Stream.map(&(&1 * 2)) 			# doubles each element
|> Stream.map(&IO.inspect(&1)) 		# writes new element
|> Enum.reverse(range) 				# reverses list
```

## Common Enum Functions




### `.each`

Get each element, returning the atom :ok

```elixir
Enum.each(list, fn(s) -> IO.puts(s) end)

Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
# one
# two
# three
# :ok
```


### `.find`

```elixir
Enum.find([array], default_result, fn x -> method_using_x end)
```

Finds the element in the list that fulfills the function, otherwise returns a default result

```elixir
Enum.find([2, 3, 4], fn x -> rem(x, 2) == 1 end) #3

Enum.find([2, 4, 6], fn x -> rem(x, 2) == 1 end) # nil

Enum.find([2, 4, 6], "No Result!", fn x -> rem(x, 2) == 1 end) # "No Result!" as the default result
```


### `.map`

Applies a function to each element and creates a new list with the results


```elixir
Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
# [-1, 0, 1, 2]

range = 1..5
Enum.map(range, &(&1 * 2)) # gets each element then multiplies by 2
# [2, 4, 6, 8, 10]

stream = Stream.map(range, &(&1 * 2))  # 
Enum.map(stream, &(&1 + 1))
# [3, 5, 7]
```



### `.map_every`

<!-- Sometimes chunking out a collection isn’t enough for exactly what we may need. If this is the case, map_every/3 can be very useful to hit every nth items, always hitting the first one: -->

Applies the function every n items

```elixir
Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)
[1001, 2, 3, 1004, 5, 6, 1007, 8]
```


### `.new`

<!-- Sometimes chunking out a collection isn’t enough for exactly what we may need. If this is the case, map_every/3 can be very useful to hit every nth items, always hitting the first one: -->

Applies the function every n items

```elixir
Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)
[1001, 2, 3, 1004, 5, 6, 1007, 8]
```


### `.min/1`

Finds the minimal value in the list:

```elixir
iex> Enum.min([5, 3, 0, -1])
-1
```

### `.min/2` 

In case the enumerable is empty, it lets us specify a function to produce the minimum value.

```elixir
iex> Enum.min([], fn -> :foo end)
:foo
```

## `.max`

returns the maximal value in the collection:

```elixir
iex> Enum.max([5, 3, 0, -1])
5
```

max/2 is to max/1 what min/2 is to min/1:

```elixir
iex> Enum.max([], fn -> :bar end)
:bar
```


## filter/2

Filters the list accepting only those that match the function.

```elixir
iex> Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
[2, 4]
```


## reduce/2

`Enum.reduce` goes through the first 2 elements of a list, applies a function then converts the result as the 1st element to be processed onto the 3rd element (which is now the 2nd element)


## reduce/3

This adds an optional accumulator to be passed into our function. If there is no accumulator, the first element in the enumerable is used:

```elixir
Enum.reduce(list, accumulator, &(&1 + &2))
Enum.reduce([1, 2, 3], 10, &(&1 + &2))
# 1 + 2 = 3
# 3 + 3 = 6
# 6 + 10 = 16
# 16

Enum.reduce(["team", "name"], @data, fn element, accumulator -> accumulator[element] end) 
# @data[team]
# 

Enum.reduce(["a","b","c"], "1", &(&1 <> &2)
"cba1"
```

<!-- ```elixir
iex> Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end)
6
``` -->


## sort/1

Sorts lists

```elixir
iex> Enum.sort([:foo, "bar", Enum, -1, 4])
[-1, 4, Enum, :foo, "bar"]
```

## sort/2

Uses two sorting functions.

```elixir
iex> Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
[%{val: 4}, %{val: 1}]
```
sort/2 allows :asc or :desc

```elixir
Enum.sort([2, 3, 1], :desc)
[3, 2, 1]
```

## uniq/1

Remove duplicates:

```elixir
iex> Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
[1, 2, 3]
```


## uniq_by/2

allows a function to do the uniqueness comparison.

```elixir
iex> Enum.uniq_by([%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end)
[%{x: 1, y: 1}, %{x: 3, y: 3}]
```



## Enum using the Capture operator (&)

```elixir
iex> Enum.map([1,2,3], &(&1 + 3))
[4, 5, 6]

or

plus_three = &(&1 + 3)
Enum.map([1,2,3], plus_three)
[4, 5, 6]
```


## Named Functions

<!-- First we create a named function and call it within the anonymous function defined in Enum.map/2. -->

```elixir
defmodule M, do: def add_tatlo(number), do: number + 3

Enum.map([1,2,3], fn number -> M.add_tatlo(number) end)
[4, 5, 6]

Enum.map([1,2,3], &M.add_tatlo(&1))
[4, 5, 6]

Enum.map([1,2,3], &M.add_tatlo/1)
[4, 5, 6]
```



## Not-so-common Functions 

### all?

`fn` applies a function to all elements

```elixir
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end) # false because hello fails
```

### any?

applies a function to all elements and returns true if at least one elements is true

```elixir
iex> Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end) # true
```

### chunk_every

Breaks up a list into smaller groups by size

```elixir
iex> Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)
[[1, 2], [3, 4], [5, 6]]
```

### chunk_by

Breaks up a list into smaller groups according to function

```elixir
iex> Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(x) -> String.length(x) end)
[["one", "two"], ["three"], ["four", "five"], ["six"]]
```


### zip

Converts a list into a tuple

```
Enum.zip([[1, 2, 3], [:a, :b, :c], ["alpha", "beta", "gamma"]])
[{1, :a, "alpha"}, {2, :b, "beta"}, {3, :c, "gamma"}]

Enum.zip([[1, 2, 3, 4, 5], [:a, :b, :c]])
[{1, :a}, {2, :b}, {3, :c}]
```

