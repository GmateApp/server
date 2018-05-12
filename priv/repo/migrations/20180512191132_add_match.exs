defmodule Gm8.Repo.Migrations.AddMatch do
  use Ecto.Migration

  def change do
    create table(:match_details) do
      add(:host, references(:users))
      add(:guest, references(:users))
      add(:guest_find_type, :integer, default: 0)
      add(:status, :integer, default: 0)
      add(:host_payment, :integer, default: 0)

      timestamps()
    end
  end
end
