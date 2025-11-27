---
title: ExUnit
description: "ExUnit" 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 54
---


## Doc Module

The documentation module is also a test. This leads to Doctest fail or success.


## How to Create Tests

Create a file as `file_test.exs`

Write macros:

```
describe "App.function_name/1" do
	
	test "what I want to test" do
		assert App.function_name(1) == 1
	end 
end
```

## How to Run Tests

Run all Tests
```
mix test
```

Run a specific test based on its row in the file
```
mix test test/app_test.exs:row_number
```

## ExUnit

`ExUnit.Case` -- provides helpers


`assert` tests whether an expression is true

`refute` tests whether an expression is false

`assert_receive/d` for send() 



