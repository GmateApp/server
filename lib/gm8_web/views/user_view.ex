defmodule Gm8Web.UserView do
  use Gm8Web, :view

  def render("auth.json", %{user: user}) do
    %{token: to_string(user.id)}
  end
end
