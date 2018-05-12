defmodule Gm8Web.UserView do
  use Gm8Web, :view
  alias Gm8Web.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user_short.json"), totalElements: length(users)}
  end

  def render("auth.json", %{user: user}) do
    %{token: to_string(user.id)}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      firstName: user.first_name,
      lastName: user.last_name,
      pictureUrl: user.picture_url,
      gender: user.gender,
      following: user.following,
      location: %{
        latitude: user.latitude,
        longitude: user.longitude
      }
    }
  end

  def render("user_short.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      firstName: user.first_name,
      lastName: user.last_name,
      pictureUrl: user.picture_url
    }
  end
end
