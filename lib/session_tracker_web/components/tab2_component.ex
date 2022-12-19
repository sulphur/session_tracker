defmodule SessionTrackerWeb.Tab2Component do
  use SessionTrackerWeb, :live_component


  def render(assigns) do
    ~H"""
    <div class="">
      <.link navigate={~p"/page_a"}>
        <.button>Visit Page A</.button>
      </.link>
    </div>
    """
  end
end
