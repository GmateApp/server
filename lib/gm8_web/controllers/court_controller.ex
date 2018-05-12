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

  def create(conn, params) do
    params = Gm8.Util.snake_case_keys(params)
    {:ok, court} = Activities.create_court(params)

    conn
    |> put_status(:ok)
    |> render("court.json", court: court)
  end

  def show(conn, %{"id" => id}) do
    court = Activities.get_court!(id)

    conn
    |> put_status(:ok)
    |> render("court.json", court: court)
  end

  def update(conn, %{"id" => id} = params) do
    court = Activities.get_court!(id)
    {:ok, court} = Activities.update_court(court, params)

    conn
    |> put_status(:ok)
    |> render("court.json", court: court)
  end

  def delete(conn, %{"id" => id}) do
    court = Activities.get_court!(id)

    Activities.delete_court(court)
    send_resp(conn, :ok, "")
  end
end
