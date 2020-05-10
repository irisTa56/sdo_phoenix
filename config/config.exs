# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :sdo_phoenix,
  ecto_repos: [SdoPhoenix.Repo]

# Configures the endpoint
config :sdo_phoenix, SdoPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rqgzURn/Q5CqeptHG5juttRlQZAkhSEV5Pi/ojAO+CwEGUxUqLVJh+k/Q+mE7U3D",
  render_errors: [view: SdoPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SdoPhoenix.PubSub,
  live_view: [signing_salt: "qaubt4i8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
