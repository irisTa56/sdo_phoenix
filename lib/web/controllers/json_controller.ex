defmodule SdoPhoenixWeb.JsonController do
  use SdoPhoenixWeb, :controller

  def index(conn, _params) do
    resp_body =
      SdoPhoenix.Repo.query!("SELECT * FROM pg_tables")
      |> Map.from_struct()
    json(conn, resp_body)
  end

  def create(%{body_params: body} = conn, _params) do
    json(conn, %{"request" => body, "result" => "nothing"})
  end
end
