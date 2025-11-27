---
title: OTP 
description: "OTP means Open Telecom Platform, based on Erlang. It has a huge set of libraries and tools from BEAM." 
image: "/graphics/elixir.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 2
---


OTP is made up of:

{{< img src="/graphics/otp.png" >}}


1. Elxir Tool Set

  - `mix`: a build tool
  - `application`: sets the other independent Modules that will run   

2. Erlang OTP Features

- `ETS` : Erlang Term Storage
- `mnesia` : Database Management System
- `crypto` 


3. Behaviors

- GenServer: has client and server
- Supervisor: manages workers in a GenServer
- Protocols: allows polymorphism. An example of a bult-in protocol is `String.Chars`



# OTP Processes and State Management

This allows functions to hold data independent of the function which is really held through the Genserver. <!-- In other web languages, this ability is done through an in-memory database such as Redis which holds the state for the webserver. --> This makes the OTP a real app. 


## Processes

- runs the actual functions and modules in memory 
- has PID


## Tasks: Start-Stops a Function or Module on a Process

- Runs a single process such as polling
- 1 task : 1 process
- has no state

``` elixir
Task.start(function_name)
```

## Agents: Adds Lightweight State management on a Process 

Only gets and updates single states. This makes it faster. 


## Genservers: Adds Heavy Duty State management on a Process

Gets, manipulates, and updates states by allowing "messages".

