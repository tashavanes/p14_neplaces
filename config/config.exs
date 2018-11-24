# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :p14_neplaces,
  ecto_repos: [P14Neplaces.Repo]

# Configures the endpoint
config :p14_neplaces, P14NeplacesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TE+R0ISG2qsvKNIr3qprW17Ojk+zNbY3KcmN37pM564PizrCk4Tm4ttdwZ3YDtpA",
  render_errors: [view: P14NeplacesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: P14Neplaces.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
