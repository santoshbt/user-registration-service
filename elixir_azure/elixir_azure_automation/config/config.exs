# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_azure_automation,
  ecto_repos: [ElixirAzureAutomation.Repo]

# Configures the endpoint
config :elixir_azure_automation, ElixirAzureAutomationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qpx/Iwqt5sh5EY9ZPUjlOgyzrExwSwkBdqjUnqFbh9uUvGv6AD+1Ac6qXqGmSovg",
  render_errors: [view: ElixirAzureAutomationWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirAzureAutomation.PubSub,
  live_view: [signing_salt: "pxgJbPTR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
