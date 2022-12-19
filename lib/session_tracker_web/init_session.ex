defmodule SessionTrackerWeb.InitSession do
  import Phoenix.LiveView
  import Phoenix.Component

  alias SessionTracker.Sessions

  def on_mount(:default, params, session, socket) do
    %{"current_session_id" => session_id} = session
    session = Sessions.get_tracking_session!(session_id)

    {:cont, assign(socket, %{current_session: session})}
  end

end
