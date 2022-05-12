defmodule RaisinsWeb.GameLive do
  use Phoenix.LiveView

  alias Raisins.Eraser

  def mount(_params, _session, socket) do
    output = Eraser.new("Hello World", 3)
    {:ok, assign(socket, :output, output)}
  end

  def render(assigns) do
    ~H"""
    <pre><%= Eraser.show(@output) %></pre>
    <button phx-click="erase">Erase</button>
    """
  end

  def handle_event("erase", _meta, socket) do
    {:noreply, erase(socket)}
  end

  defp erase(socket) do
    assign(socket, :output, Eraser.erase(socket.assigns.output))
  end
end
