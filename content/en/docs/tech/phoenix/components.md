---
title: Components (Phoenix 1.7)
description: We list down essential concepts in Phoenix Components 
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2022-04-22
weight: 30
draft: true
---


## Templates Versus Components

Templates are do not change dynamically, but Components can 

```
<%= render "child_template.html", assigns %>

<.show_name name={@user.name} />
```
