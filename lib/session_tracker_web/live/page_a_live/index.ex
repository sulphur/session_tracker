defmodule SessionTrackerWeb.PageALive.Index do
  use SessionTrackerWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply,
      socket
      |> assign(:page_title, "Page A")
    }
  end
end
