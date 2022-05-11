defmodule RaisinsWeb.PageController do
  use RaisinsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
