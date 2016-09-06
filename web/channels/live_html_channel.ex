defmodule PhoenixLiveHtml.LiveHTMLChannel do
  use Phoenix.Channel

  def join("live-html", _message, socket) do
    {:ok, socket}
  end

  # def handle_in("paint_it", %{"color" => color, "text" => text}, socket) do
  #   html = Phoenix.View.render_to_string(PhoenixLiveHtml.PageView, "#{color}.html", text: text)
  #
  #   broadcast!(socket, "live_response", %{html: html})
  #   {:noreply, socket}
  # end

  def handle_in("paint_it", %{"color" => "blue", "text" => text}, socket) do
    PhoenixLiveHtml.PageView
    |> Phoenix.View.render_to_string("blue.html", text: text)
    |> broadcast_html(socket)
  end

  def handle_in("paint_it", %{"color" => "red", "text" => text}, socket) do
    PhoenixLiveHtml.PageView
    |> Phoenix.View.render_to_string("red.html", text: text)
    |> broadcast_html(socket)
  end

  defp broadcast_html(html, socket) do
    broadcast!(socket, "live_response", %{html: html})
    {:noreply, socket}
  end
end
