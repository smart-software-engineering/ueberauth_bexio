import Config

config :ueberauth, Ueberauth,
  providers: [
    bexio: {Ueberauth.Strategy.Bexio, []}
  ]

config :ueberauth, Ueberauth.Strategy.Bexio.OAuth,
  client_id: "client_id",
  client_secret: "client_secret",
  token_url: "token_url"
