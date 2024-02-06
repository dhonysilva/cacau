defmodule Cacau.Repo do
  use Ecto.Repo,
    otp_app: :cacau,
    adapter: Ecto.Adapters.Postgres
end
