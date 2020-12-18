defmodule Catrello.Repo do
  use Ecto.Repo,
    otp_app: :catrello,
    adapter: Ecto.Adapters.Postgres
end
