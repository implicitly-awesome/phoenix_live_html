defmodule PhoenixLiveHtml.PageController do
  use PhoenixLiveHtml.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
