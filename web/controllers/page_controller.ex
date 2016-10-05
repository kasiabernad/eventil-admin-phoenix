defmodule EventilAdmin.PageController do
  use EventilAdmin.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
