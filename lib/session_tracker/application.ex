defmodule SessionTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SessionTrackerWeb.Telemetry,
      # Start the Ecto repository
      SessionTracker.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SessionTracker.PubSub},
      # Start Finch
      {Finch, name: SessionTracker.Finch},
      # Start the Endpoint (http/https)
      SessionTrackerWeb.Endpoint
      # Start a worker by calling: SessionTracker.Worker.start_link(arg)
      # {SessionTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SessionTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SessionTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
