defmodule ElixirAzureAutomationWeb.PageController do
  use ElixirAzureAutomationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
