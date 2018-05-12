defmodule Gm8.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:picture_url, :string)
    field(:latitude, :float, default: 0.0)
    field(:longitude, :float, default: 0.0)
    field(:gender, :integer)
    field(:following, :boolean, default: false)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :email,
      :first_name,
      :last_name,
      :picture_url,
      :latitude,
      :longitude,
      :gender,
      :following
    ])
    |> validate_required([:email, :first_name, :last_name, :picture_url, :gender])
  end
end
