# PlugRemoteIp2Logger

## Description

Takes the _overwritten_ Conn.remote_ip and shoves it into the Logger metadata
Depending on your setup you might need some Plugs _before_ this one.
See: https://github.com/ajvondrak/remote_ip

## Installation
Add to your `mix.exs`

```elixir
def deps do
  [
    {:plug_remote_ip_2_logger, "~> 0.1.0"}
  ]
end
```

## Usage 
Add the `RemoteIp2Logger` plug to your app's plug pipeline:

```elixir
defmodule MyApp do
  use Plug.Builder

  plug RemoteIp2Logger
end
```

And then add the `:remote_ip` to your Logger's metadata line:
```elixir
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:remote_ip, :request_id, :module, :function, :line]
```
