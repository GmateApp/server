defmodule Gm8.Repo.Migrations.AddMatchModel do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add(:start_time, :utc_datetime)
      add(:end_time, :utc_datetime)
      add(:court, references(:courts))
      add(:details_id, references(:match_details))

      timestamps()
    end
  end
end
