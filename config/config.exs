# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gm8,
  ecto_repos: [Gm8.Repo]

# Configures the endpoint
config :gm8, Gm8Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jXs3MeH6yq6fykZ1Z+uoA59CPmvWaQA/y7bu0y/0GvsHpyZ90Yf19gfTkeHCkg+Y",
  render_errors: [view: Gm8Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Gm8.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
