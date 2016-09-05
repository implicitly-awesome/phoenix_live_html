# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_live_html,
  ecto_repos: [PhoenixLiveHtml.Repo]

# Configures the endpoint
config :phoenix_live_html, PhoenixLiveHtml.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FZNBXJOlTCjtZR1v/YppOb2JQkQtxFSBUw3oam/gf0r0tIWOUZq3Xc7900QZ7sbA",
  render_errors: [view: PhoenixLiveHtml.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixLiveHtml.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
