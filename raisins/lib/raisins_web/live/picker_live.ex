defmodule RaisinsWeb.PickerLive do
  use Phoenix.LiveView

  alias Raisins.Library

  def mount(_params, _session, socket) do
    snippet = Library.first_snippet()
    {:ok, assign(socket, :snippet, snippet)}
  end

  def render(assigns) do
    ~H"""
    <pre> <%= inspect @snippet %> </pre>
    <h1>name: <%= @snippet.name %> Steps:</h1>
    <pre><%= @snippet.text %></pre>
    <button phx-click="pick">Pick</button>
    <button phx-click="next">Next</button>
    """
  end

  def handle_event("pick", _meta, socket) do
    {:noreply, push_redirect(socket, to: "/game/#{socket.assigns.snippet.id}")}
  end

  def handle_event("next", _meta, socket) do
    {:noreply, next(socket)}
  end

  defp next(socket) do
    assign(socket, :snippet, Library.next_snippet(socket.assigns.snippet))
  end
end
