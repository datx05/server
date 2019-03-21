# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :thesis, ThesisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Uqz3utAOWmiwz3MsYCCB4QKjKg7bReiKg1wj4z5ryAEHCQMHioxz6JtQTlULGPtm",
  render_errors: [view: ThesisWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Thesis.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "YOUR_SECRET"
  ],
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$},
      ~r{web/live/.*(ex)$}
    ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :plug_lti,
  lti_key: "test",
  lti_secret: "secret"

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
