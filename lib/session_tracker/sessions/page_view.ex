defmodule SessionTracker.Sessions.PageView do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "page_views" do
    field :additional_identity_information, :map
    field :engagement_time, :integer
    field :module_name, :string

    belongs_to :session, SessionTracker.Session

    timestamps()
  end

  @doc false
  def changeset(page_view, attrs) do
    page_view
    |> cast(attrs, [:module_name, :additional_identity_information, :engagement_time, :session_id])
    |> validate_required([:module_name, :additional_identity_information, :engagement_time, :session_id])
  end
end
