defmodule Catrello.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Catrello.Repo,
      # Start the Telemetry supervisor
      CatrelloWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Catrello.PubSub},
      # Start the Endpoint (http/https)
      CatrelloWeb.Endpoint
      # Start a worker by calling: Catrello.Worker.start_link(arg)
      # {Catrello.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Catrello.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CatrelloWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
