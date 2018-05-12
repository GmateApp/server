defmodule Gm8.Activities.MatchDetails do
  use Ecto.Schema
  import Ecto.Changeset

  schema "match_details" do
    belongs_to(:host, Gm8.Auth.User)
    belongs_to(:guest, Gm8.Auth.User)
    field(:guest_find_type, :integer, default: 0)
    field(:status, :integer, default: 0)
    field(:host_payment, :integer, default: 0)

    timestamps()
  end

  def changeset(match, attrs) do
    match
    |> cast(attrs, [:start_time, :end_time])
    |> assoc_constraint(:court)
    |> assoc_constraint(:details)
  end
end
