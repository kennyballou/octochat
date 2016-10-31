defmodule Octochat.Echo do
  @moduledoc """
  Octochat Echo server
  """
  require Logger

  def serve(socket) do
    socket
      |> read_line()
      |> write_line!(socket)

    serve(socket)
  end

  defp read_line(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, line} -> line
      {:error, reason} ->
        Logger.error(reason)
        Process.exit(self, :normal)
    end
  end

  defp write_line!(line, socket) do
    :gen_tcp.send(socket, line)
  end

end
