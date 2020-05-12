defmodule SdoPhoenix.Release do
  @app :sdo_phoenix

  def migrate() do
    Application.load(@app)
    SdoPhoenix.Repo
    |> Ecto.Migrator.with_repo(&Ecto.Migrator.run(&1, :up, all: true))
  end
end
