# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :petal_stack,
  ecto_repos: [PetalStack.Repo]

# Configures the endpoint
config :petal_stack, PetalStackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Oe4bNe2Pz2LfWnUiFb7MxRS+DeTOZCzofKrb9yvLqaqWGn9RNus53NAxVXvSPOYX",
  render_errors: [view: PetalStackWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PetalStack.PubSub,
  live_view: [signing_salt: "op1w3rxR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
