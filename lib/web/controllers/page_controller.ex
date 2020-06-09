defmodule SdoPhoenix.Web.PageController do
  use SdoPhoenix.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
