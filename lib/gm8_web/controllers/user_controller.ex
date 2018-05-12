defmodule Gm8Web.UserController do
  use Gm8Web, :controller

  alias Gm8.Auth

  def index(conn, _params) do
    users = Auth.list_users()

    conn
    |> put_status(:ok)
    |> render("index.json", users: users)
  end

  def auth(conn, %{"data" => %{"token" => access_token}}) do
    {:ok, user} = Auth.authenticate_user(access_token)

    conn
    |> put_status(:ok)
    |> render("auth.json", user: user)
  end
end
