defmodule SdoPhoenixWeb.JsonController do
  use SdoPhoenixWeb, :controller

  def index(conn, _params) do
    json(conn, %{"json" => "nothing"})
  end

  def create(%{body_params: body} = conn, _params) do
    json(conn, %{"request" => body, "result" => "nothing"})
  end
end
