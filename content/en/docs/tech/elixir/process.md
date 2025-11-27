---
title: Processes
description:  Processes 
image: "/graphics/process.jpg"
tags: ['Elixir']
date: 2023-08-22
weight: 160
---



A process is an isolated entity where code execution happens.

{{< img src="/graphics/process.jpg" >}}

- Stack: keeps local variables.
- Heap: keeps larger structures.
- Mailbox: stores messages sent from other processes.
- Process Control Block: keeps track of the state of the process.


Functions:

```
Kernel.spawn/1
Kernel.spawn/3
Kernel.spawn_link/1 
Kernel.spawn_link/3
Kernel.spawn_monitor/1
Kernel.spawn_monitor/3
Kernel.self/0
Kernel.send/2
```

Process lifecycle is:

## Process creation

`spawn`

```
function = IO.puts "Process #{inspect(self())}."

pid = spawn(function)
 Process.alive?(pid) 
false
```


## Code execution

`send`


## Process termination 