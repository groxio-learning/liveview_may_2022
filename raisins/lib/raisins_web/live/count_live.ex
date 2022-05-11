defmodule RaisinsWeb.CountLive do
  # In Phoenix v1.6+ apps, the line below should be: use MyAppWeb, :live_view
  use Phoenix.LiveView

  alias Raisins.Counter, as: Counter

  def mount(%{"count" => count}, _session, socket) do
    {:ok, assign(socket, :count, Counter.new(count))}
  end

  def render(assigns) do
    ~H"""
    <h1>
      <%= Counter.message(@count) %>
    </h1>
    <button phx-click="inc">Increment</button>
    <button phx-click="dec">Decrement</button>
    <button phx-click="clear">Clear</button>
    """
  end

  def handle_event("inc", _meta, socket) do
    {:noreply, inc(socket)}
  end

  def handle_event("dec", _meta, socket) do
    {:noreply, dec(socket)}
  end

  def handle_event("clear", _meta, socket) do
    {:noreply, clear(socket)}
  end

  defp inc(socket) do
    assign(socket, :count, Counter.inc(socket.assigns.count))
  end

  defp dec(socket) do
    assign(socket, :count, Counter.dec(socket.assigns.count))
  end

  defp clear(socket) do
    assign(socket, :count, Counter.empty())
  end
end
