---
title: Data Kinds (Type Annotations and Inference)
description: "" 
image: "/photos/code.jpg"
tags: ['Types']
date: 2023-08-22
---


Typescript sets data-kinds through `let` and `const`.

- colon `:` is for setting data-kinds
- equals `=` is for assigning variables


#### Explicit (Annotations)

```
let counter: number;  // counter is set to accept only number-kinds (numeric data type)
const counter: number;

counter = 2; // computer allows 2 because it is a number
counter = 'This should error'; // computer rejects this because it is a string 
```

#### Implicit (Inference or Contextual)

```
let counter = 0;

function startCounter (max=100) { ... }

// Computer understands that event is a kind of MouseEvent because of click
document.addEventListener('click', function(event) { console.log(event.button) });

```

Setting different data-kinds:

### Array

```
let names: string[];

names = ['Adam', 'Barry'];
```

### Object

```
let user: {
	name: string,
	age: number
};


user = {
	name: 'John',
	age: '4'
};

names = ['Adam', 'Barry'];
```

## Primitive Data Kinds

number
bigint
string
boolean `&& || !`
null
undefined
symbol


### String Interpolations

```
'string ${var} string'
```
