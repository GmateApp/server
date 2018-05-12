defmodule Gm8.Activities.Match do
  use Ecto.Schema
  import Ecto.Changeset

  schema "matches" do
    field(:start_time, :utc_datetime)
    field(:end_time, :utc_datetime)
    belongs_to(:court, Gm8.Activities.Court)
    belongs_to(:details, Gm8.Activities.MatchDetails)

    timestamps()
  end

  def changeset(match, attrs) do
    match
    |> cast(attrs, [:start_time, :end_time])
    |> assoc_constraint(:court)
    |> assoc_constraint(:details)
  end
end
