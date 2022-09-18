defmodule Mello.Repo do
  use Ecto.Repo,
    otp_app: :mello,
    adapter: Ecto.Adapters.Postgres
end
