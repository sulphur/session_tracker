defmodule SessionTracker.SessionsTest do
  use SessionTracker.DataCase

  alias SessionTracker.Sessions

  describe "tracking_sessions" do
    alias SessionTracker.Sessions.TrackingSession

    import SessionTracker.SessionsFixtures

    @invalid_attrs %{browser_agent: nil, cookie_uuid: nil}

    test "list_tracking_sessions/0 returns all tracking_sessions" do
      tracking_session = tracking_session_fixture()
      assert Sessions.list_tracking_sessions() == [tracking_session]
    end

    test "get_tracking_session!/1 returns the tracking_session with given id" do
      tracking_session = tracking_session_fixture()
      assert Sessions.get_tracking_session!(tracking_session.id) == tracking_session
    end

    test "create_tracking_session/1 with valid data creates a tracking_session" do
      valid_attrs = %{browser_agent: "some browser_agent", cookie_uuid: "some cookie_uuid"}

      assert {:ok, %TrackingSession{} = tracking_session} = Sessions.create_tracking_session(valid_attrs)
      assert tracking_session.browser_agent == "some browser_agent"
      assert tracking_session.cookie_uuid == "some cookie_uuid"
    end

    test "create_tracking_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sessions.create_tracking_session(@invalid_attrs)
    end

    test "update_tracking_session/2 with valid data updates the tracking_session" do
      tracking_session = tracking_session_fixture()
      update_attrs = %{browser_agent: "some updated browser_agent", cookie_uuid: "some updated cookie_uuid"}

      assert {:ok, %TrackingSession{} = tracking_session} = Sessions.update_tracking_session(tracking_session, update_attrs)
      assert tracking_session.browser_agent == "some updated browser_agent"
      assert tracking_session.cookie_uuid == "some updated cookie_uuid"
    end

    test "update_tracking_session/2 with invalid data returns error changeset" do
      tracking_session = tracking_session_fixture()
      assert {:error, %Ecto.Changeset{}} = Sessions.update_tracking_session(tracking_session, @invalid_attrs)
      assert tracking_session == Sessions.get_tracking_session!(tracking_session.id)
    end

    test "delete_tracking_session/1 deletes the tracking_session" do
      tracking_session = tracking_session_fixture()
      assert {:ok, %TrackingSession{}} = Sessions.delete_tracking_session(tracking_session)
      assert_raise Ecto.NoResultsError, fn -> Sessions.get_tracking_session!(tracking_session.id) end
    end

    test "change_tracking_session/1 returns a tracking_session changeset" do
      tracking_session = tracking_session_fixture()
      assert %Ecto.Changeset{} = Sessions.change_tracking_session(tracking_session)
    end
  end
end
