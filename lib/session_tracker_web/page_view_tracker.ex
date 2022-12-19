defmodule SessionTrackerWeb.PageViewTracker do
  alias SessionTracker.Sessions

  def track_page(socket, params) do
    view = to_string(socket.view)
    session = Sessions.get_tracking_session!(socket.assigns.current_session.id)
    Sessions.create_page_view(%{
      session_id: session.id,
      module_name: view,
      engagement_time: 0,
      additional_identity_information: %{
        user_data: params["userData"],
        previous_page_view: nil
      }
    })
  end

  def update_page_view(page_view, params) do
    spawn( fn ->
      Sessions.update_page_view(page_view, %{
        engagement_time: params["elapsedTime"]
      })
    end)
  end
end
