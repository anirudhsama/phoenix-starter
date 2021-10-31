import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.

c = Vapor.load!(Portal.Config)

# Configure the DB credentials
config :portal, Portal.Repo,
  url: c.db.url,
  pool_size: c.db.pool_size,
  ssl: c.db.enable_ssl,
  ssl_opts: [cacertfile: c.db.cert_file_path]

# Configure the endpoint
config :portal, PortalWeb.Endpoint,
  http: [port: c.web.port],
  secret_key_base: c.web.secret_key_base

# The block below contains prod specific runtime configuration.
if config_env() == :prod do
  config :portal, PortalWeb.Endpoint,
    http: [ip: {0, 0, 0, 0, 0, 0, 0, 0}],
    server: true,
    transport_options: [socket_opts: [:inet6]]

  # ## Using releases
  #
  # If you are doing OTP releases, you need to instruct Phoenix
  # to start each relevant endpoint:
  #
  #     config :portal, PortalWeb.Endpoint, server: true
  #
  # Then you can assemble a release by calling `mix release`.
  # See `mix help release` for more information.

  # ## Configuring the mailer
  #
  # In production you need to configure the mailer to use a different adapter.
  # Also, you may need to configure the Swoosh API client of your choice if you
  # are not using SMTP. Here is an example of the configuration:
  #
  #     config :portal, Portal.Mailer,
  #       adapter: Swoosh.Adapters.Mailgun,
  #       api_key: System.get_env("MAILGUN_API_KEY"),
  #       domain: System.get_env("MAILGUN_DOMAIN")
  #
  # For this example you need include a HTTP client required by Swoosh API client.
  # Swoosh supports Hackney and Finch out of the box:
  #
  #     config :swoosh, :api_client, Swoosh.ApiClient.Hackney
  #
  # See https://hexdocs.pm/swoosh/Swoosh.html#module-installation for details.
end
