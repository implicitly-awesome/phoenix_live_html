defmodule PhoenixLiveHtml.UserSocket do
  use Phoenix.Socket

  channel "live-html", PhoenixLiveHtml.LiveHTMLChannel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
