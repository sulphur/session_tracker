defmodule SessionTrackerWeb.PageCLive.Index do
  use SessionTrackerWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, assign_random_tab(socket)}
  end

  @impl true
  def render(assigns) do
    ~H""
  end

  defp assign_random_tab(socket) do
    tab_number = Enum.random(1..2)
    push_patch(socket, to: ~p"/page_c/tab_#{tab_number}")
  end

end
