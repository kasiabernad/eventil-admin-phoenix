defmodule EventilAdmin.Router do
  use EventilAdmin.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EventilAdmin do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/events", EventController, only: [:index, :show]
    resources "/agenda_sessions", AgendaSessionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EventilAdmin do
  #   pipe_through :api
  # end
end
