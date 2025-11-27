---
title: Functions and Classes
description: "" 
image: "/photos/code.jpg"
tags: ['Functions']
date: 2025-01-07
---


Functions are like actions. Classes are like ideas. 

Typescript lets you set the data kinds within functions. 

Constructor creates the properties of the Class. These are attributes of the idea. 

Super calls the constructor from a child Class or idea. 

Functions can be shortened with fat arrows

```
function name(parameter: kind): returnKind{ ... };

let functionName = (parameter: kind): returnKind => { ... };

let getName = (name: string): string => { return name; };
```


Typescript lets you create classes. 

```
class User {
	name: string;
	age: number;

	constructor(name: string, age: number) {
		this.name = name;
		this.age = age;
	}

	public getDetails(): string {
		return `${this.name} ${this.age}`;
	}

	public get name() {
		return this.name;
	}	

	public set name(nickname: string) {
		if (!nickname) {
			throw new Error('invalid nickname');
		}
		this.age = nickname;
	}		
} 

let user = new User('Lam', 24);
```


### Access Modifiers

- public
- private
- protected

