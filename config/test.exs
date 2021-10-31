import Config

# Configure your database
config :portal, Portal.Repo, pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :portal, PortalWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}],
  server: false

# In test we don't send emails.
config :portal, Portal.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
