defmodule Octochat.ServerSupervisor do
  @moduledoc """
  Simple One-for-One Supervisor for socket connections
  """

  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Octochat.Echo, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

  def start_server(socket) do
    Supervisor.start_child(__MODULE__, [socket])
  end

end
