defmodule Gm8.Activities do
  import Ecto.Query, warn: false

  alias Gm8.Repo
  alias Gm8.Activities.Court

  def list_courts() do
    Repo.all(Court)
  end

  def create_court(attrs \\ %{}) do
    %Court{}
    |> Court.changeset(attrs)
    |> Repo.insert()
  end
end
