defmodule MelloWeb.PageController do
  use MelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
