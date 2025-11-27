---
title: Operators
description:  
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 150
---


Operators are non-qualified calls.

`.' is an operator.


Elixir operators always return a float.

**Infix Expression** `1 + 1` 

**Prefix Expression** `+(1, 1)`

**Postfix Expression** `(1, 1)+`



Operator | Name | What it does | Precedence
--- | --- | --- | ---
@ | module attribute | defines compile constants too | Unary
. | dot |  | Left
^ | pin | prevents the variable from changing |
= | match |  |
& | capture | | 
:: | type | | 
! ^ not ~~~  | strict and relaxed boolean "not" | Unary
. + - | positive/negative | |  Unary
/ * + -	| division, multiplication, etc | arithmetic | Left
<> ++ -- +++ --- .. | list concatenation and subtraction | | Right
in not in | | | Left 
|> <<< >>> <<~ ~>> <~ ~> <~> <|> | | | Left
< > <= >= | | | Left
== != =~ === !== | | | Left
&& &&& and | strict and relaxed boolean "and" | | Left
|| ||| or | strict and relaxed boolean "or" | | Left
= | | | Right
& | | | Unary
-> | arrow | used in anonymous functions and case statements |  
=> (valid only inside %{}) | fat arrow | Defines key value-pairs | Right
| | Cons | Splits list to head and tail | Right
:: |  | | Right
when |  | | Right
<- \\ |  | | Left
in and not in |  | membership | 
.. | range creation |  | 
<> | binary concatenation | | 
|> | pipeline | | 
=~ | text-based match: the left side has the right side | |
=> | %{} | |
when | Guards | |
<- | for with | |
\\ | Default arguments | used to enter something if there is null value |  


## Sorting Order

`number < atom < reference < function < port < pid < tuple < map < list < bitstring`

Possible operators:

```
|||
&&&
<<<
>>>
<<~
~>>
<~
~>
<~>
<|>
+++
---
~~~
```


### Pipe Operator

This takes the result on the left, and passes it to the right.

```
"This is tough." |> String.upcase() |> String.split()
# ["THIS", "IS", "TOUGH."]
```


<!-- functions div/2 and rem/2 for integer division and remainder. -->

Attach `++` or Detach `--` to a `[list]`


```elixir
iex> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]

iex> [1, 2, 3] -- [2]
[1, 3]
```

Concatenate strings `<>`

```
iex> "inter" <> "nation" <> "alization"
"internationalization"
```


## Boolean and or not

`or`  `and` `not`


```
iex> true and true
true

iex> false or is_atom(:example)
true
```


## Non-boolean and or not


`||` gets the first one


`&&` gets the last one


`!`  not


```
iex> 1 || true
1

iex> false || 11
11
``` 


```
iex> nil && 13
nil

iex> true && 17
17
```


`not`

```
iex> !true
false

iex> !1
false

iex> !nil
true
```

<!-- As a rule of thumb, use and, or and not when you are expecting booleans. If any of the arguments are non-boolean, use &&, || and !. -->



## Comparison Operators

`<=` `>=`  `<` `>` 

`==`  `!=` 


```
iex> 1 == 1
true

iex> 1 != 2
true

iex> 1 < 2
true
```


Stricter:
`===` `!==` 


```
iex> 1 == 1.0
true

iex> 1 === 1.0
false
```