use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :p14_neplaces, P14NeplacesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :p14_neplaces, P14Neplaces.Repo,
  username: "postgres",
  password: "postgres",
  database: "p14_neplaces_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
