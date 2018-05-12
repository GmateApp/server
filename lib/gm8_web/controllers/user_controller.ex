defmodule Gm8Web.UserController do
  use Gm8Web, :controller

  alias Gm8.Auth
  alias Gm8.Auth.User

  def index(conn, _params) do
    users = Auth.list_users()

    conn
    |> put_status(:ok)
    |> render("index.json", users: users)
  end

  def me(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("user.json", user: conn.assigns.current_user)
  end

  def update_location(conn, params) do
    with {:ok, %User{}} <- Auth.update_user(conn.assigns.current_user, params) do
      send_resp(conn, :ok, "")
    end
  end

  def show(conn, %{"id" => id}) do
    user = Auth.get_user(id)

    if user do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    else
      conn
      |> put_status(:not_found)
      |> render(Gm8Web.ErrorView, "404.json", %{})
    end
  end

  def auth(conn, %{"data" => %{"token" => access_token}}) do
    {:ok, user} = Auth.authenticate_user(access_token)

    conn
    |> put_status(:ok)
    |> render("auth.json", user: user)
  end
end
