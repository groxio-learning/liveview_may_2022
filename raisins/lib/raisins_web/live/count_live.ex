defmodule RaisinsWeb.CountLive do
  # In Phoenix v1.6+ apps, the line below should be: use MyAppWeb, :live_view
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 42)}
  end

  def render(assigns) do
    ~H"""
    Current temperature: <%= @temperature %>
    """
  end
end