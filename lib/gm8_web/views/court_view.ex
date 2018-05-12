defmodule Gm8Web.CourtView do
  use Gm8Web, :view
  alias Gm8Web.CourtView

  def render("index.json", %{courts: courts}) do
    %{data: render_many(courts, CourtView, "court.json"), totalElements: length(courts)}
  end

  def render("court.json", %{court: court}) do
    %{
      id: court.id,
      name: court.name,
      address: court.address,
      opensAt: court.opens_at,
      closesAt: court.closes_at
    }
  end
end
