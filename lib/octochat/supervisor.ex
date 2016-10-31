defmodule Octochat.Supervisor do
  @moduledoc """
  Octochat OTP Supervisor tree
  """

  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      supervisor(Task.Supervisor, [[name: Octochat.TaskSupervisor]]),
      worker(Task, [Octochat.Acceptor, :accept, []])
    ]

    opts = [strategy: :one_for_one]
    supervise(children, opts)
  end

end
