import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phx_starter, PhxStarter.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phx_starter_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_starter, PhxStarterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "jHItWBiICBjeMr0FW0jhCoOqAvBqiHmhJiLtq+TdzGcq3Sy3BBGthwgvzOEc5VID",
  server: false

# In test we don't send emails.
config :phx_starter, PhxStarter.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
