defmodule Gm8.Auth do
  import Ecto.Query, warn: false

  alias Gm8.Repo
  alias Gm8.Auth.User
  alias Gm8.Facebook

  def get_user(id) do
    Repo.get(User, id)
  end

  def list_users do
    Repo.all(User)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user_by_email(email) do
    from(u in User, where: u.email == ^email)
    |> Repo.one()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def authenticate_user(access_token) do
    Facebook.fetch_user(access_token)
    |> verify_user()
  end

  defp verify_user({:ok, user_data}) do
    case get_user_by_email(user_data["email"]) do
      nil -> create_user(user_data)
      user -> {:ok, user}
    end
  end
end
