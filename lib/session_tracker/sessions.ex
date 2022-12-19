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

  def get_tracking_session_by_cookie_uuid(uuid) do
    Repo.get_by(TrackingSession, cookie_uuid: uuid)
  end

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

  alias SessionTracker.Sessions.PageView

  @doc """
  Returns the list of page_views.

  ## Examples

      iex> list_page_views()
      [%PageView{}, ...]

  """
  def list_page_views do
    Repo.all(PageView)
  end

  @doc """
  Gets a single page_view.

  Raises `Ecto.NoResultsError` if the Page view does not exist.

  ## Examples

      iex> get_page_view!(123)
      %PageView{}

      iex> get_page_view!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page_view!(id), do: Repo.get!(PageView, id)

  @doc """
  Creates a page_view.

  ## Examples

      iex> create_page_view(%{field: value})
      {:ok, %PageView{}}

      iex> create_page_view(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page_view(attrs \\ %{}) do
    %PageView{}
    |> PageView.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a page_view.

  ## Examples

      iex> update_page_view(page_view, %{field: new_value})
      {:ok, %PageView{}}

      iex> update_page_view(page_view, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_page_view(%PageView{} = page_view, attrs) do
    page_view
    |> PageView.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a page_view.

  ## Examples

      iex> delete_page_view(page_view)
      {:ok, %PageView{}}

      iex> delete_page_view(page_view)
      {:error, %Ecto.Changeset{}}

  """
  def delete_page_view(%PageView{} = page_view) do
    Repo.delete(page_view)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page_view changes.

  ## Examples

      iex> change_page_view(page_view)
      %Ecto.Changeset{data: %PageView{}}

  """
  def change_page_view(%PageView{} = page_view, attrs \\ %{}) do
    PageView.changeset(page_view, attrs)
  end
end
