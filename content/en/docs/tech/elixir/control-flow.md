---
title: Control Flow
description: "" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 35
---



## Guard: `when`

Executes the function when the conditions are met

``` elixir
def function_name(input) when condition1 do
end

def function_name(input) when condition2 do
end
```




## If

```
if (condition, do: this, else: that)

if(condition, [do: this, else: that])

if(condition, [{:do, this}, {:else, that}])

if true do
  this
else
  that
end

if(true, do: (this), else: (that))
```

<!-- if true do
  this
  that
end

if(true, do: (
  this
  that
)) -->

falsey = false or nil

truthy = everything that is not false or nil



## Case

Focuses on simple patterns

```
case condition do
  x when x in [false, nil] -> cases...
  _ -> cases..
end
```

Case is most commonly used for the insert actions

```
# liveview
def save_post(socket, :new, post_params) do
  case Blog create_post(post_params) do
    {:ok, post } -> 
      notify_parent({:saved, post})
      {:no_reply, socket |> put_flash(:info, "ok")} |> push_patch(to: socket.assigns.patch}
    {:ok, %Ecto.changeset = changeset } -> 
      {:no_reply, assign_form(socket, changeset)}

# phoenix
def create(conn, %{"email" => email_params}) do
  case Emails.create_email(email_params) do  
```

## with

This is used to shorten nested `case` statements.

```
user = %{fname: "Lam", lname: "Nguyen"}

with {:ok, fname} <- Map.fetch(user, :fname), {:ok, lname} <- Map.fetch(user, :lname), do: lname <> " " <> fname
# Lam Nguyen
```


Example

```
case Repo.insert(changeset) do
  {:ok, user} -> case Guardian.encode_and_sign(user, :token, claims) do # if changeset is good, then run encode function on Guardian with user, :token, and claims data
    {:ok, token, full_claims} -> evaluate(token, full_claims) # if token and claims data (as full_claims) is good, then run evaluate function with those data 
    error -> error
  end
  error -> error
end
```

The above is shortened to:

```
with {:ok, user} <- Repo.insert(changeset),  # if user changeset is good, then run the next function
  {:ok, token, full_claims} <- Guardian.encode_and_sign(user, :token, claims) do # if token and claims data (as full_claims) is good, then run the next function 
  important_stuff(token, full_claims) 
end
```

<!-- m = %{a: 1, c: 3}

a =
  with {:ok, number} <- Map.fetch(m, :a),
    true <- is_even(number) do
      IO.puts "#{number} divided by 2 is #{div(number, 2)}"
      :even
  else
    :error ->
      IO.puts("We don't have this item in map")
      :error
    _ ->
      IO.puts("It is odd")
      :odd
  end


with {:ok, variable} <- Module.action(changeset),
     {:ok, token, full_claims} <- Guardian.encode_and_sign(user, :token, claims) do
  important_stuff(token, full_claims)
end
 -->



## Cond

Focuses on complex patterns or conditions

```
cond do
  age >= 10 -> IO.puts "A"
  age <= 10 -> IO.puts "B"
  true -> IO.puts "Z" # fallback
end  
```




 
## Recursion 


## Iteration 


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

