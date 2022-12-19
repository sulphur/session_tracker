defmodule SessionTracker.Repo do
  use Ecto.Repo,
    otp_app: :session_tracker,
    adapter: Ecto.Adapters.Postgres
end
