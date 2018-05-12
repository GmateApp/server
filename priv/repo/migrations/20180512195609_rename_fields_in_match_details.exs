defmodule Gm8.Repo.Migrations.RenameFieldsInMatchDetails do
  use Ecto.Migration

  def change do
    rename table(:match_details), :host, to: :host_id
    rename table(:match_details), :guest, to: :guest_id
  end
end
