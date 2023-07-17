defmodule Verify.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VerifyWeb.Telemetry,
      # Start the Ecto repository
      Verify.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Verify.PubSub},
      # Start Finch
      {Finch, name: Verify.Finch},
      # Start the Endpoint (http/https)
      VerifyWeb.Endpoint
      # Start a worker by calling: Verify.Worker.start_link(arg)
      # {Verify.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Verify.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VerifyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
