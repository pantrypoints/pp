---
title: Anonymous functions
description: "These store and pass executable code around as if it was an integer or a string. They start with `fn` and end with `end" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 14
---


These store and pass executable functions around as if it was an integer or a string. They start with `fn` and end with `end`


<!-- def secret_and(secret), do: &(Bitwise.&&& &1, secret)
  def secret_xor(secret), do: &(Bitwise.^^^ &1, secret)
  def secret_combine(secret_function1, secret_function2), do: &(&1 |> secret_function1.() |> secret_function2.()) -->



## Setting the anonymous function

`variable_that_holds_the_function = fn variable1, variable2, variable3 -> variable1 + variable2 + variable3 end`

with Capture Operator & as Shortcut

`variable_that_holds_the_function = &(&variable1 + &variable2 + &variable3)`


````elixir
def adder(n), do: &(&1 + n)

adder = Calc.adder(6)  		# This is n
assert adder.(9) === 15   	# This is &1
````


## Calling the anonymous function

`variable_that_holds_the_function.(data1, data2, data3)`


Static variables set within the anoynmous function will reference that static variable in memory.




```
add = fn a, b -> a + b end
#Function<12.71889879/2 in :erl_eval.expr/5>

add.(1, 2)
3

is_function(add)
true
```

The anonymous function is `fn`.
- It gets 2 arguments: a and b
- It returns the result of a + b

`fn` is stored in the variable `add`.

A dot between the variable and parentheses is required to invoke an anonymous function.
- It prevents `add/1` or `add/2` 


## Anonymous Functions vs Named Functions

Anonymous Functions are identified by the number of arguments they get.

A function can be checked for arity via `is_function/2`:

Check if add is a function that expects exactly 2 arguments
```
is_function(add, 2)
true
```

Check if add is a function that expects exactly 1 argument

```
is_function(add, 1)
false
```

Anonymous functions can also access variables that are in scope when the function is defined. 

This is typically referred to as closures, as they close over their scope.

```
add = fn a, b -> a + b end

double = fn a -> add.(a, a) end
#Function<6.71889879/1 in :erl_eval.expr/5>

double.(2)
4
```

A variable assigned inside a function does not affect its surrounding environment.

```
x = 42

(fn -> x = 0 end).()
0

x
42
```


## Functions

enclosed in Modules

``` elixir
def function_name(argument_name) do

def function_name(argument_name\\ "default-value-if-no-argument-name-is-given") do
```

### Anonymous Functions

**Setting**

``` elixir
function_name = fn(argument1, argument2, argument3..) -> argument1 + argument2 + argument3.. end
```

eg:

``` elixir
square = fn(x) -> x * x end
function_name = fn(a,b,c,d) -> (a,b,c,d)
function_name = &(&1 + &2 + &3 + &4)
function_name = &(ModuleName.another_function/4)
```

**Calling** 

``` elixir
function_name.(4) #anonymous function
function_name(4) #named function
```

#### Capture Operator: Shortcut for those lazy to write code

`&1` is the shortcut for *the arguments* in `fn(x..) -> x..`

``` elixir
&1 #represents or captures the first argument 
&2 #represents or captures the second argument
```

eg: 

``` elixir
function_name = &(&1 * &2)
```

``` elixir
&(Module.function_name/1) #shortcut for the whole Module
```

``` elixir
var_too_lazy_to_type_module = &(LongNamedModule.long_named_function/100)
```

<!-- &($1 * %1) 

variables &capture
 -->
