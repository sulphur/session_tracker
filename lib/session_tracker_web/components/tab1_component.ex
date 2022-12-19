defmodule SessionTrackerWeb.Tab1Component do
  use SessionTrackerWeb, :live_component


  def render(assigns) do
    ~H"""
    <div class="">
      <.link navigate={~p"/page_b"}>
        <.button>Visit Page B</.button>
      </.link>
    </div>
    """
  end
end
