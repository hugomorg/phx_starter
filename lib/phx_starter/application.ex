defmodule PhxStarter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxStarterWeb.Telemetry,
      PhxStarter.Repo,
      {DNSCluster, query: Application.get_env(:phx_starter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxStarter.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhxStarter.Finch},
      # Start a worker by calling: PhxStarter.Worker.start_link(arg)
      # {PhxStarter.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxStarterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxStarter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxStarterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
