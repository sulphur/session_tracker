defmodule SessionTrackerWeb.Router do
  use SessionTrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SessionTrackerWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SessionTrackerWeb.Plugs.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SessionTrackerWeb do
    pipe_through :browser

    get "/", PageController, :home


    live_session :default, on_mount: SessionTrackerWeb.InitSession do
      live "/page_a", PageALive.Index, :index
      live "/page_b", PageBLive.Index, :index
      live "/page_c", PageCLive.Index, :index
      live "/page_c/:tab", PageCLive.Show, :show
    end

  end

  # Other scopes may use custom stacks.
  # scope "/api", SessionTrackerWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:session_tracker, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SessionTrackerWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
