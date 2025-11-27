---
title: How to Set up Mail in Phoenix 1.7
description: We list down How to Set up Mail in Phoenix 1.7 
image: "/img/phx.jpg"
tags: ['Phoenix']
date: 2023-04-22
weight: 51
---


This assumes you made your app with Phoenix 1.7 which has:
- essential mailer config
- mailbox in the router 


1. Create mail template in `/lib/app/emails.ex`

```
defmodule App.Emails do
  import Swoosh.Email

  def test do
    new()
    |> to({"John", "john@gmail.com"})
    |> from({"Martha", "martha@gmail.com"})
    |> subject("Hello!")
    |> html_body("<h1>Hello there</h1>")
    |> text_body("Hello there\n")
  end
end
```

2. Trigger the email in a controller

```
defmodule AppWeb.SomeController do
  use AppWeb, :controller

  alias App.{Mailer, Emails}

  def some_method(conn, params) do
    
    Emails.test() |> Mailer.deliver()

    render(conn, :template) 
  end

end
```


## POW Emails (Reset Password)

1. Add callbacks in the config

```
config :app, :pow,
  user: App.Users.User,
  repo: App.Repo,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks
  mailer_backend: AppWeb.Mails.Pow,
  web_mailer_module: AppWeb  
```


2. Update `users`

```
defmodule App.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword]

  # ...

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
  end
end
```

3. Add extension routes

```
defmodule AppWeb.Router do
  use AppWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword]

  # ...

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

end
```


4. Generate the form and the email templates 

```
mix pow.extension.phoenix.gen.templates --extension PowResetPassword
mix pow.extension.phoenix.mailer.gen.templates --extension PowResetPassword
```


5. Add POW mailer in `/lib/app_web/mails/pow.ex` since the previous generator already generated the `mails` library

Make sure to add the adapter: Swoosh.Adapters.Local or your preferred adapter

```
defmodule AppWeb.Mails.Pow do
  use Pow.Phoenix.Mailer
  use Swoosh.Mailer, otp_app: :city, adapter: Swoosh.Adapters.Local

  import Swoosh.Email

  require Logger

  def cast(%{user: user, subject: subject, text: text, html: html, assigns: _assigns}) do
    %Swoosh.Email{}
    |> to({user.firstname, user.email})
    |> from({"Pantrypoints", "noreply@email.com"})
    |> subject(subject)
    |> html_body(html)
    |> text_body(text)
  end

  def process(email) do
    email
    |> deliver()
    |> log_warnings()
  end

  defp log_warnings({:error, reason}) do
    Logger.warn("Mailer backend failed with: #{inspect(reason)}") # This is the log message I'm getting. `reason` doesn't provide much info.
  end

  defp log_warnings({:ok, response}), do: {:ok, response}

end
```

