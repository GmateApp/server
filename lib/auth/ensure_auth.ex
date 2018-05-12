defmodule Gm8.Auth.EnsureAuth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> Phoenix.Controller.render(Gm8Web.ErrorView, "401.json", message: "Unauthenticated user.")
      |> halt()
    end
  end
end
