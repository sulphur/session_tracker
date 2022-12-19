defmodule SessionTracker.Repo.Migrations.CreateTrackingSessions do
  use Ecto.Migration

  def change do
    create table(:tracking_sessions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :browser_agent, :string
      add :cookie_uuid, :string

      timestamps()
    end
  end
end
