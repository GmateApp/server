defmodule Gm8.Activities do
  import Ecto.Query, warn: false

  alias Gm8.Repo
  alias Gm8.Activities.Court

  def list_courts() do
    Repo.all(Court)
  end

  def get_court!(id) do
    Repo.get!(Court, id)
  end

  def create_court(attrs \\ %{}) do
    %Court{}
    |> Court.changeset(attrs)
    |> Repo.insert()
  end

  def delete_court(court) do
    Repo.delete(court)
  end
end
