defmodule RaisinsWeb.GameLive do
  use Phoenix.LiveView

  alias Raisins.Eraser
  alias Raisins.Picker

  def mount(%{"snippet_id" => snippet_id}, _session, socket) do
    snippet = Picker.get(snippet_id)
    output = Eraser.new(snippet.text, snippet.steps)

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
