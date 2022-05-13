defmodule RaisinsWeb.GameLive do
  use Phoenix.LiveView

  alias Raisins.Eraser
  alias Raisins.Picker

  def mount(%{"snippet_id" => snippet_id}, _session, socket) do
    snippet = Picker.get(snippet_id)
    eraser = Eraser.new(snippet.text, snippet.steps)

    {:ok, assign(socket, :eraser, eraser)}
  end

  def render(assigns) do
    ~H"""
    <pre><%= Eraser.show(@eraser) %></pre>
    <button phx-click="erase">Erase</button>
    """
  end

  def handle_event("erase", _meta, socket) do
    {:noreply, erase(socket)}
  end

  defp erase(socket) do
    assign(socket, :eraser, Eraser.erase(socket.assigns.eraser))
  end
end
