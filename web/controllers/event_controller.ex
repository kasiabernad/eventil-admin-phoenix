defmodule EventilAdmin.EventController do
  use EventilAdmin.Web, :controller

  alias EventilAdmin.Event

  def index(conn, _params) do
    events = Repo.all(Event)
    render(conn, "index.html", events: events)
  end

  def show(conn, %{"id" => id}) do
    event = Event |> Repo.get!(id) |> Repo.preload([:agenda_sessions])
    render(conn, "show.html", event: event)
  end
end
