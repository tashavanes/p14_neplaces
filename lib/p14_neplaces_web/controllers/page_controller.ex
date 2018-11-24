defmodule P14NeplacesWeb.PageController do
  use P14NeplacesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
