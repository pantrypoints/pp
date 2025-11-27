---
title: Array Data Kind
description: "" 
image: "/photos/code.jpg"
tags: ['Types']
date: 2023-08-22
---

The array kind is a list of data. 


```
Let skills: string[] = [];

Let stuff: (string|number)[];

stuff = [1, 2, 'bag']
```

Adding items through array position:

```
skills[0] = "Eating";
skills[1] = "Sleeping";
```


### Methods


Adding items through `push()`:

```
skills.push('Eating, Sleeping');
```

```
array.length
```


```
typeof(array)
```

forEach()

map()

reduce()

filter()



## Tuple

A tuple is a fixed array.

```
let color: [number, number, number?] // ? is optional
```

