defmodule Raisins.Repo do
  use Ecto.Repo,
    otp_app: :raisins,
    adapter: Ecto.Adapters.Postgres
end
