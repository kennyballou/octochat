defmodule Octochat.Application do
  @moduledoc """
  Octochat OTP application/entry point
  """

  use Application

  def start(_, _) do
    Octochat.Supervisor.start_link()
  end

end
