defmodule Octochat.Echo do
  @moduledoc """
  Octochat Echo server
  """
  use GenServer
  require Logger

  def start_link(socket) do
    GenServer.start_link(__MODULE__, socket)
  end

  def init(socket) do
    :ok = :inet.setopts(socket, active: true)
    {:ok, %{socket: socket}}
  end

  def handle_info({:tcp, _, msg}, state = %{socket: socket}) do
    msg
      |> String.trim()
      |> String.reverse()
      |> (fn (line) -> line <> "\n" end).()
      |> write_line!(socket)
    {:noreply, state}
  end

  def handle_info({:tcp_closed, _}, state) do
    Logger.info("#{__MODULE__}: Connection closing")
    {:stop, :normal, %{}}
  end

  defp write_line!(line, socket) do
    :gen_tcp.send(socket, line)
  end

end
