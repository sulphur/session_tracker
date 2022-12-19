defmodule SessionTracker.Repo.Migrations.CreatePageViews do
  use Ecto.Migration

  def change do
    create table(:page_views, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :module_name, :string
      add :additional_identity_information, :map
      add :engagement_time, :integer
      add :session_id, references(:tracking_sessions, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:page_views, [:session_id])
  end
end
