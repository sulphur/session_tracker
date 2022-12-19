defmodule SessionTrackerWeb.Plugs.Session do
  use Plug.Builder
  alias SessionTracker.Sessions

  @cookie_name "session_tracking_cookie"

  def call(conn, opts) do
    assign_session(conn)
  end

  defp assign_session(conn) do
    case conn.req_cookies() do
      %{@cookie_name => cookie_val} ->
        :ok
        conn
      _ ->
        new_cookie_uuid = Ecto.UUID.generate()
        user_agent = get_user_agent_name(conn)

        {:ok, session} =
          Sessions.create_tracking_session(%{
            cookie_uuid: new_cookie_uuid,
            browser_agent: user_agent
          })

        conn
        |> put_resp_cookie(@cookie_name, new_cookie_uuid, max_age: 30*24*60*60, signed: true)
        |> assign(:current_session, session)
    end
  end

  defp get_user_agent_name(conn) do
    conn
    |> Plug.Conn.get_req_header("user-agent")
    |> List.first()
    |> Browser.full_browser_name()
  end
end
