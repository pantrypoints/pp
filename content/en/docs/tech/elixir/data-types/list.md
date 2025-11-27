---
title: Lists
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 130
---


`[Lists]` are for non-fixed number of elements.

```
[3.14, :pie, "Apple"]
```

## Linked Lists

Elixir lists are linked lists which are not "arrays" arranged by index where you can get the first element by `list[0]`

Instead, linked lists allows fast prepending of data but slower appending as the process has to go through the list. 

This is because data in Elixir is immutable and sit in its own process which maniuplates it via functions. Variables are permanently assigned to a value. To change a value, functional languages copy the variable into a new one with a new value via functions.  

- In object-oriented programming, data and functions (behaviors) are together. 
- In functional programming, data and functions (behaviors) are separated. This makes it good for concurrency where processes talk to each other. 
<!-- There is no null values.  -->


### Concatenation ++/2

```
[1, 2] ++ [3, 4, 1]
[1, 2, 3, 4, 1]
```

### Subtraction --/2

```
[1, 2, 3, 4, 1] -- [1, 2]
[3, 4, 1]
```

### Head Tail as hd tl

`hd` is the frst element. 

`tl` are the remaining.

```
hd [3.14, :pie, "Apple"]
3.14

tl [3.14, :pie, "Apple"]
[:pie, "Apple"]
```


```
a = [1, 2, 3]
length(a)
# 3
```


`Enum`, `in`, `[head | tails]` works with lists

```
Enum.at(a, 2)
# 3

3 in a
# true
```


## Keyword lists

These are a special list of two-element tuples.
- First element or key is an atom which are ordered and do not have to be unique
- This is why they are commonly used to pass options to functions.

```
[foo: "bar", hello: "world"]

[{:foo, "bar"}, {:hello, "world"}]

[foo: "bar", hello: "world"]
```

