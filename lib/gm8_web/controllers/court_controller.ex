defmodule Gm8Web.CourtController do
  use Gm8Web, :controller

  alias Gm8.Activities
  # alias Gm8.Activities.Court

  def index(conn, _params) do
    courts = Activities.list_courts()
    conn
    |> put_status(:ok)
    |> render("index.json", courts: courts)
  end
end
