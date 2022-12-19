defmodule SessionTracker.Sessions do
  @moduledoc """
  The Sessions context.
  """

  import Ecto.Query, warn: false
  alias SessionTracker.Repo

  alias SessionTracker.Sessions.TrackingSession

  @doc """
  Returns the list of tracking_sessions.

  ## Examples

      iex> list_tracking_sessions()
      [%TrackingSession{}, ...]

  """
  def list_tracking_sessions do
    Repo.all(TrackingSession)
  end

  @doc """
  Gets a single tracking_session.

  Raises `Ecto.NoResultsError` if the Tracking session does not exist.

  ## Examples

      iex> get_tracking_session!(123)
      %TrackingSession{}

      iex> get_tracking_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tracking_session!(id), do: Repo.get!(TrackingSession, id)

  @doc """
  Creates a tracking_session.

  ## Examples

      iex> create_tracking_session(%{field: value})
      {:ok, %TrackingSession{}}

      iex> create_tracking_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tracking_session(attrs \\ %{}) do
    %TrackingSession{}
    |> TrackingSession.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tracking_session.

  ## Examples

      iex> update_tracking_session(tracking_session, %{field: new_value})
      {:ok, %TrackingSession{}}

      iex> update_tracking_session(tracking_session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tracking_session(%TrackingSession{} = tracking_session, attrs) do
    tracking_session
    |> TrackingSession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tracking_session.

  ## Examples

      iex> delete_tracking_session(tracking_session)
      {:ok, %TrackingSession{}}

      iex> delete_tracking_session(tracking_session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tracking_session(%TrackingSession{} = tracking_session) do
    Repo.delete(tracking_session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tracking_session changes.

  ## Examples

      iex> change_tracking_session(tracking_session)
      %Ecto.Changeset{data: %TrackingSession{}}

  """
  def change_tracking_session(%TrackingSession{} = tracking_session, attrs \\ %{}) do
    TrackingSession.changeset(tracking_session, attrs)
  end
end
