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

  describe "page_views" do
    alias SessionTracker.Sessions.PageView

    import SessionTracker.SessionsFixtures

    @invalid_attrs %{additional_identity_information: nil, engagement_time: nil, module_name: nil}

    test "list_page_views/0 returns all page_views" do
      page_view = page_view_fixture()
      assert Sessions.list_page_views() == [page_view]
    end

    test "get_page_view!/1 returns the page_view with given id" do
      page_view = page_view_fixture()
      assert Sessions.get_page_view!(page_view.id) == page_view
    end

    test "create_page_view/1 with valid data creates a page_view" do
      valid_attrs = %{additional_identity_information: %{}, engagement_time: 42, module_name: "some module_name"}

      assert {:ok, %PageView{} = page_view} = Sessions.create_page_view(valid_attrs)
      assert page_view.additional_identity_information == %{}
      assert page_view.engagement_time == 42
      assert page_view.module_name == "some module_name"
    end

    test "create_page_view/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sessions.create_page_view(@invalid_attrs)
    end

    test "update_page_view/2 with valid data updates the page_view" do
      page_view = page_view_fixture()
      update_attrs = %{additional_identity_information: %{}, engagement_time: 43, module_name: "some updated module_name"}

      assert {:ok, %PageView{} = page_view} = Sessions.update_page_view(page_view, update_attrs)
      assert page_view.additional_identity_information == %{}
      assert page_view.engagement_time == 43
      assert page_view.module_name == "some updated module_name"
    end

    test "update_page_view/2 with invalid data returns error changeset" do
      page_view = page_view_fixture()
      assert {:error, %Ecto.Changeset{}} = Sessions.update_page_view(page_view, @invalid_attrs)
      assert page_view == Sessions.get_page_view!(page_view.id)
    end

    test "delete_page_view/1 deletes the page_view" do
      page_view = page_view_fixture()
      assert {:ok, %PageView{}} = Sessions.delete_page_view(page_view)
      assert_raise Ecto.NoResultsError, fn -> Sessions.get_page_view!(page_view.id) end
    end

    test "change_page_view/1 returns a page_view changeset" do
      page_view = page_view_fixture()
      assert %Ecto.Changeset{} = Sessions.change_page_view(page_view)
    end
  end
end
