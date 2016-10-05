# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :eventil_admin,
  ecto_repos: [EventilAdmin.Repo]

# Configures the endpoint
config :eventil_admin, EventilAdmin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7pYPkRAn1XcbkO87OaqPpTHFtJbanFO3II685OOlruvPfL6Q0ikwdTbAquOIA4ty",
  render_errors: [view: EventilAdmin.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EventilAdmin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
