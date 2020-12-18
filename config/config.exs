# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :catrello,
  ecto_repos: [Catrello.Repo]

# Configures the endpoint
config :catrello, CatrelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2LmJJ9IpHoDb60VLFKlCWt2IQvokRD0pces3KlQFJTafBJVWhCQCEmjyXfn45zfp",
  render_errors: [view: CatrelloWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Catrello.PubSub,
  live_view: [signing_salt: "9jMW96dl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
