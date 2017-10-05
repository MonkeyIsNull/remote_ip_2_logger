defmodule RemoteIp2Logger do
  @moduledoc """
  A plug for logging the remote_ip of the connecting client

  To use it, just plug it into the desired module:

      plug RemoteIp2Logger

  """

  require Logger
  alias Plug.Conn
  @behaviour Plug

  def init(options) do
		options
  end

  def call(conn, _opts) do
    conn |> remote_ip_to_log()
  end

  defp remote_ip_to_log(conn) do
		r_ip = Tuple.to_list(conn.remote_ip) |> Enum.join(".")  
		set_remote_ip_on_log(conn, r_ip)
  end

  defp set_remote_ip_on_log(conn, remote_ip) do
    Logger.metadata(remote_ip: remote_ip)
		conn
  end
end
