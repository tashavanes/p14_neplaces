defmodule P14NeplacesWeb.Router do
  use P14NeplacesWeb, :router

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

  scope "/", P14NeplacesWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/visits", VisitController
  end

  # Other scopes may use custom stacks.
  # scope "/api", P14NeplacesWeb do
  #   pipe_through :api
  # end
end
