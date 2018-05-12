defmodule Gm8.Repo.Migrations.AddCourt do
  use Ecto.Migration

  def change do
    create table(:courts) do
      add(:name, :string)
      add(:address, :string)
      add(:opens_at, :string)
      add(:closes_at, :string)

      timestamps()
    end
  end
end
