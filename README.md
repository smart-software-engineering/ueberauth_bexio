# Überauth Bexio

[![Continuous Integration](https://github.com/smart-software-engineering/ueberauth_bexio/actions/workflows/elixir.yml/badge.svg)](https://github.com/smart-software-engineering/ueberauth_bexio/actions/workflows/elixir.yml/badge.svg)
[![Module Version](https://img.shields.io/hexpm/v/ueberauth_bexio.svg)](https://hex.pm/packages/ueberauth_bexio)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/ueberauth_bexio/)
[![Total Download](https://img.shields.io/hexpm/dt/ueberauth_bexio.svg)](https://hex.pm/packages/ueberauth_bexio)
[![License](https://img.shields.io/hexpm/l/ueberauth_bexio.svg)](https://github.com/ueberauth/ueberauth_bexio/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/smart-software-engineering/ueberauth_bexio.svg)](https://github.com/smart-software-engineering/ueberauth_bexio/commits/master)


> Bexio OAuth2 strategy for Überauth.

## Installation

1.  Setup your application at [Bexio Developer](https://developer.bexio.com/).

2.  Add `:ueberauth_bexio` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [
        {:ueberauth_bexio, "~> 0.1.3"}
      ]
    end
    ```

3.  Add Bexio to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        bexio: {Ueberauth.Strategy.Bexio, []}
      ]
    ```

4.  Update your provider configuration:

    Use that if you want to read client ID/secret from the environment
    variables in the compile time:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Bexio.OAuth,
      client_id: System.get_env("BEXIO_CLIENT_ID"),
      client_secret: System.get_env("BEXIO_CLIENT_SECRET")
    ```

    Use that if you want to read client ID/secret from the environment
    variables in the run time:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Bexio.OAuth,
      client_id: {System, :get_env, ["BEXIO_CLIENT_ID"]},
      client_secret: {System, :get_env, ["BEXIO_CLIENT_SECRET"]}
    ```

5.  Include the Überauth plug in your controller:

    ```elixir
    defmodule MyApp.AuthController do
      use MyApp.Web, :controller
      plug Ueberauth
      ...
    end
    ```

6.  Create the request and callback routes if you haven't already:

    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

7.  Your controller needs to implement callbacks to deal with `Ueberauth.Auth` and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initiate the request through:

    /auth/bexio

Or with options:

    /auth/bexio?scope=email%20profile

By default the requested scope is "email". Scope can be configured either explicitly as a `scope` query value on the request path or in your configuration:

```elixir
config :ueberauth, Ueberauth,
  providers: [
    bexio: {Ueberauth.Strategy.Bexio, [default_scope: "openid email profile"]}
  ]
```

TODO: decide what we want to write here!

To guard against client-side request modification, it's important to still check the domain in `info.urls[:website]` within the `Ueberauth.Auth` struct if you want to limit sign-in to a specific domain.

## Copyright and License

Copyright (c) 2024 Rico Metzger

Released under the MIT License, which can be found in the repository in [LICENSE](https://github.com/smart-software-engineering/ueberauth_bexio/blob/master/LICENSE).
