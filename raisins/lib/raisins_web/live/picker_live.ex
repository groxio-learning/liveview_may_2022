defmodule RaisinsWeb.PickerLive do
  use Phoenix.LiveView

  alias Raisins.Picker

  def mount(_params, _session, socket) do
    output = Picker.new()
    {:ok, assign(socket, :output, output)}
  end

  def render(assigns) do
    snippet = Picker.show(assigns.output)

    ~H"""
    <pre> <%= inspect snippet %> </pre>
    <h1>name: <%= snippet.snippet.name %> Steps:</h1>
    <pre><%= snippet.snippet.text %></pre>
    <button phx-click="pick">Pick</button>
    <button phx-click="next">Next</button>
    """
  end

  def handle_event("pick", _meta, socket) do
    snippet = Picker.show(socket.assigns.output)
    {:noreply, push_redirect(socket, to: "/game/#{snippet.index}")}
  end

  def handle_event("next", _meta, socket) do
    {:noreply, next(socket)}
  end

  defp next(socket) do
    assign(socket, :output, Picker.next(socket.assigns.output))
  end
end
