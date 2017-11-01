# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :awesome_api,
  ecto_repos: [AwesomeApi.Repo]

# Configures the endpoint
config :awesome_api, AwesomeApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "meD+a1kJ2k/3nj4ZjThXtcXS1QQxxu43QbIVU1D/XxmbCm86LfgsT/S78RIFiq4Q",
  render_errors: [view: AwesomeApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: AwesomeApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
