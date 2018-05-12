defmodule Gm8.Repo.Migrations.AddUser do
  use Ecto.Migration

  def change do
    create table("users") do
      add(:email, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:picture_url, :string)
      add(:latitude, :float, default: 0.0)
      add(:longitude, :float, default: 0.0)
      add(:gender, :integer)
      add(:following, :boolean, default: false)

      timestamps()
    end
  end
end
