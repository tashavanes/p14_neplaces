defmodule P14Neplaces.Repo do
  use Ecto.Repo,
    otp_app: :p14_neplaces,
    adapter: Ecto.Adapters.Postgres
end
