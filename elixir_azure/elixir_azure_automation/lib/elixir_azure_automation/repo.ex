defmodule ElixirAzureAutomation.Repo do
  use Ecto.Repo,
    otp_app: :elixir_azure_automation,
    adapter: Ecto.Adapters.Postgres
end
