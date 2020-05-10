defmodule SdoPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :sdo_phoenix,
    adapter: Ecto.Adapters.Postgres
end
