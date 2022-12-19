defmodule SessionTrackerWeb.Plugs.Session do
  use Plug.Builder
  alias SessionTracker.Sessions

  @cookie_name "session_tracking_cookie"

  def call(conn, opts) do
    assign_session(conn)
  end

  defp assign_session(conn) do
    {:ok, session} = find_or_create_session(conn, conn.req_cookies())

    conn
    |> put_resp_cookie(@cookie_name, session.cookie_uuid, max_age: 30*24*60*60, signed: true)
    |> assign(:current_session, session)
    |> assign(:current_session_id, session.id)
  end

  defp find_or_create_session(conn, %{@cookie_name => cookie_val}) do
    case Sessions.get_tracking_session_by_cookie_uuid(cookie_val) do
      nil ->
        create_session(conn)
      session ->
        {:ok, session}
    end
  end
  defp find_or_create_session(conn, _), do: create_session(conn)

  defp create_session(conn) do
    new_cookie_uuid = Ecto.UUID.generate()
    user_agent = get_user_agent_name(conn)

    {:ok, session} =
      Sessions.create_tracking_session(%{
        cookie_uuid: new_cookie_uuid,
        browser_agent: user_agent
      })
  end

  defp get_user_agent_name(conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first()
    |> Browser.full_browser_name()
  end

end
