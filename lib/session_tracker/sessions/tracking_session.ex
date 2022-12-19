defmodule SessionTracker.Sessions.TrackingSession do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tracking_sessions" do
    field :browser_agent, :string
    field :cookie_uuid, :string

    timestamps()
  end

  @doc false
  def changeset(tracking_session, attrs) do
    tracking_session
    |> cast(attrs, [:browser_agent, :cookie_uuid])
    |> validate_required([:browser_agent, :cookie_uuid])
  end
end
