defmodule SessionTracker.SessionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SessionTracker.Sessions` context.
  """

  @doc """
  Generate a tracking_session.
  """
  def tracking_session_fixture(attrs \\ %{}) do
    {:ok, tracking_session} =
      attrs
      |> Enum.into(%{
        browser_agent: "some browser_agent",
        cookie_uuid: "some cookie_uuid"
      })
      |> SessionTracker.Sessions.create_tracking_session()

    tracking_session
  end
end
