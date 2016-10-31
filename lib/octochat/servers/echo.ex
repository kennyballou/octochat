defmodule Octochat.Echo do
  @moduledoc """
  Octochat Echo server
  """

  def serve(socket) do
    socket
      |> read_line!()
      |> write_line!(socket)

    serve(socket)
  end

  defp read_line!(socket) do
    {:ok, line} = :gen_tcp.recv(socket, 0)
    line
  end

  defp write_line!(line, socket) do
    :gen_tcp.send(socket, line)
  end

end
