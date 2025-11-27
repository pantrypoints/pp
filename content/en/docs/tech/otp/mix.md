---
title: Mix
description: Mix 
image: "/graphics/elixir.jpg"
tags: ['Phoenix']
date: 2022-04-22
weight: 137
---

Mix is a build tool for Elixir.

It scaffolds a new app as a project which has:

- project: 
  - dependencies as deps
  - tests
- application (a Module that runs the Supervision tree, starting and stopping it)

```
mix new app_name --sup
```

```
mix phx.new app_name options
```

`mix phx.new` options:

Option | Description
--- | ---
`--umbrella` | generate an umbrella project
`--database` | database adapter for Ecto either: postgres, mysql, mssql, sqlite3, 
`--no-esbuild` | do not include esbuild. This is for API only apps
`--no-assets` | equivalent to `--no-esbuild` and `--no-tailwind`
`--no-dashboard` | do not include Phoenix.LiveDashboard
`--no-ecto` | do not generate Ecto files
`--no-gettext` | do not generate gettext files
`--no-html` | do not generate HTML views
`--no-live` | comment out LiveView socket setup in assets/js/app.js. Automatically disabled if `--no-html` is given
`--no-mailer` | do not generate Swoosh mailer files
`--no-tailwind` | do not include tailwind dependencies and assets. The generated markup will still include Tailwind CSS classes, those are left-in as reference for the subsequent styling of your layout and components
`--binary-id` | use binary_id as primary key type in Ecto schemas
`--verbose` | use verbose output
`-v` `--version` | prints the Phoenix installer version