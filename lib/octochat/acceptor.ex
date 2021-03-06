defmodule Octochat.Acceptor do
  @moduledoc """
  Connection/socket accpetor
  """

  @listen_port Application.get_env(:octochat, :port) || 9999

  def accept do
    {:ok, socket} = :gen_tcp.listen(
      @listen_port,
      [:binary, packet: :line, active: false, reuseaddr: true])
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    {:ok, pid} = Octochat.ServerSupervisor.start_server(client)
    :ok = :gen_tcp.controlling_process(client, pid)
    loop_acceptor(socket)
  end

end
