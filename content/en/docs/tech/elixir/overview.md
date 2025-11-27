---
title: Overview
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 10
---

- [Data types](/docs/tech/elixir/data-types)
  - Built-in types
    - [Lists](/docs/tech/elixir/data-types/list/)
    - [Maps](/docs/tech/elixir/data-types/map/)
    - [Tuples](/docs/tech/elixir/data-types/tuple/)

  - Data types without a module
  - Other Data types
- [Enum](/docs/tech/elixir/data-types/enums/)    
- Behaviours: Modules that are publicly-available APIs
  - GenServer (part of OTP)
  - Supervisor (part of OTP)
  - Protocols



## Naming

Syntax | Description
--- | ---
`_` | unused variable
`!` | for times when you want the error details from Elixir directly. Having no `!` lets your write the error manually
`?` | check if true or false
`is_something/1` | checks if true or false for guard clauses
`function/1` | Arity is the number of arguments that a function takes.



## System modules

Modules that interface with the underlying system, such as:

1. IO - handles input and output
2. File - interacts with the underlying file system
3. Path - manipulates file system paths
4. System - reads and writes system information


## Process-based and application-centric functionality

The following modules build on top of processes to provide concurrency, fault-tolerance, and more.

Module | Description
--- | ---
Agent | a process that encapsulates mutable state
Application | functions for starting, stopping and configuring applications
GenServer | a generic client-server API
Registry | a key-value process-based storage
Supervisor | a process that is responsible for starting, supervising and shutting down other processes
Task | a process that performs computations
Task.Supervisor | a supervisor for managing tasks exclusively



## Code Behaviours

Access Behaviour - for key-based data

```
# Setting
map1 = %{key: 1}
map2 = %{"key" => 2}

# Calling via Access Behaviour
map1[:key]
# 1

map1.key 
# 1

map2[:key]
# error

map2["key"]
# 2
```



Object-oriented programming uses Classes that define the mold for objects which are instances of that Class. Each object thus has the methods of that class. Data is then passed to those objects and manipulated according to the Class methods. 

Functional programming uses Module Functions with sub functions instead of methods. Data is passed through the functions as immutable data.   

Elixir Universe | Description | Java Universe
--- | --- | ---
Erlang | Language | Java
Elixir | Easier Language | Groovy, Kotlin
Beam | Where language runs | JVM
OTP | Libraries | JDK
GenServer | Server Functions | Spring Boot
Mix | Build Tool | Gradle, Maven
Phoenix | Web Framework | Spring MVC
LiveView | Websocket Framework | Spring-websocket
Ecto | SQL | JDBC



**Elixir Compiler Steps:**

1. Read file
2. Tokenize
3. Parse (builds Abstract Syntax Tree [has precedence])
4. Expand Macros
5. Apply Rewrite Rules
6. Lower Elixir AST to Erlang AST

Erlang Compiler

7. Compile Erlang AST to Core AST
8. Core Optimizations & True Inlining
9. Compile Pattern Matching

Kernel Erlang 

10. Run Kernel Optimizations 
11. Generate and Optimize Assembly
12. Generate bytecode
13. Write .beam file


## Elixir Files

`.ex` is a compile file

`.exs` is a script file



## Syntax

`_anonymous_variable` is used to tell that that variable is unused. For example: `{:ok, _contents}` 

`arguments -> expression`

`Module.__info__(:functions)` exposes the functions of the Module

`method!` returns error if there is an error




## Elixir Expressions

`{function, metadata, arguments}`


`h Module_name` helper function that shows help info for the Module


## Keywords

`[atom: data, "string atom": data]` is the same as `[{:atom, data}, {"string atom": data}]`



<!-- `hd` head

``` elixir
hd(array-name) #returns the first element or head
``` -->


## Pipe Operator

``` elixir
|>
```

passes output of earlier function into the next function due to the functional or flowing nature of Elixir. This requires the functional programmer to have more intelligence than an object-oriented programmer as to remember the long chain of cause and effect

puts the result in the last series
<!-- 
mix = gem
hex = rvm
mix phoenix.new --version
mix local.hex = gem install hex  -->


## Pattern Matching Rules

`=` is a 'match operator' not an equals sign. This requires more intelligence from the programmer as to decide whether two sides match or not, instead of being equal to just one side like in object-oriented or procedural programming.
- accepts left and right 'operands', with left being dominant
- if left is a letter/s, the right is bound to that letter/s-variable `x = 1`

``` elixir
x = 'a'
'b' = x # error because left must be a letter/s or number such as 1 + 1 = 2
b = b # error because right side needs non-variable
```

- if right is a letter/s, the right is matched to the value of the left `x = y`
- entering new match operators `x = 2` will re-bind the operands
- pin operator `^` prevents re-binding so it prevents the operand does not change


### Integer Separator

``` elixir
1123_456_789 --> 123456789
```

### Booleans

Strict:
``` elixir
and
or
not
```

Non-strict: 
``` elixir
&& 
|| 
!
```


### Comparison

``` elixir
>
<
>=
<=
```

#### Non-Strict Comparison

``` elixir
!=
==
```

#### Strict Comparison

``` elixir
!==
===
```

### String literals 

`\` escape character indicates a special string with certain abilities
- `\n` new line eg: 

``` elixir
"Donald\nTrump"
```

`#{}` interpolation inserts expression within the string

``` elixir
"Donald Trump #{'J' == 'r' == '.'}"
```


### Atom literal 

used as labels or tags

``` elixir
:text
:"<>" 
true  
```




## Recursion (Iteration) 

## Conditional Macros for the Lazy

`->` if-then

``` elixir
case condition do
    true -> a
    false -> b
end 
```

``` elixir
case mega_function(input) do
    {:error, error_message} -> {:error, error_message}
    {:ok, mega_function_output} -> case mini_function(input) do  
        {:error, error_message} -> {:error, error_message}
        {:ok, input} -> %{key: mini_function_output}
    end          
end 
```



`with <-` if-then, if-then, if-then

``` elixir
case mega_function(input) do
    with {:ok, mini_function_output} <- mini_function(input)} do
        {:ok, %{key: mini_function_output} 
        # mega_function_ouput has mini_function_output inside of it
    end          
end 
```


## Guard Clauses

Filters functions

``` elixir
def function_name(input) when condition1 do
end

def function_name(input) when condition2 do
end
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
