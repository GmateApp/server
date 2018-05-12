defmodule Gm8.Activities.Court do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courts" do
    field(:name, :string)
    field(:address, :string)
    field(:opens_at, :string)
    field(:closes_at, :string)

    timestamps()
  end

  def changeset(court, attrs) do
    court
    |> cast(attrs, [:name, :address, :opens_at, :closes_at])
    |> validate_required([:name, :address])
  end
end
