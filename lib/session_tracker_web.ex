defmodule SessionTrackerWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use SessionTrackerWeb, :controller
      use SessionTrackerWeb, :html

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router, helpers: false

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller,
        namespace: SessionTrackerWeb,
        formats: [:html, :json],
        layouts: [html: SessionTrackerWeb.Layouts]

      import Plug.Conn
      import SessionTrackerWeb.Gettext

      unquote(verified_routes())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {SessionTrackerWeb.Layouts, :app}

      unquote(html_helpers())

      def handle_event("page_loaded", params, socket) do
        {:ok, page_view} =
          SessionTrackerWeb.PageViewTracker.track_page(socket, params)
        {:noreply, assign(socket, :current_page_view, page_view)}
      end

      def handle_event("update_pageview", params, socket) do
        SessionTrackerWeb.PageViewTracker.update_page_view(socket.assigns.current_page_view, params)
        {:noreply, socket}
      end
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      # HTML escaping functionality
      import Phoenix.HTML
      # Core UI components and translation
      import SessionTrackerWeb.CoreComponents
      import SessionTrackerWeb.Gettext

      # Shortcut for generating JS commands
      alias Phoenix.LiveView.JS

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: SessionTrackerWeb.Endpoint,
        router: SessionTrackerWeb.Router,
        statics: SessionTrackerWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
