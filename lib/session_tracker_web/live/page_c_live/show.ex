defmodule SessionTrackerWeb.PageCLive.Show do
  use SessionTrackerWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    tab_name = get_tab_name(params)
    {:noreply, assign(socket, :current_tab_module, tab_name)}
  end

  defp get_tab_name(%{"tab" => "tab_1"}), do: SessionTrackerWeb.Tab1Component
  defp get_tab_name(%{"tab" => "tab_2"}), do: SessionTrackerWeb.Tab2Component
end
