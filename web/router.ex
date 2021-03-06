defmodule Fishbowl.Router do
  use Fishbowl.Web, :router

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

  scope "/", Fishbowl do
    pipe_through :browser # Use the default browser stack
    resources "/registrations", RegistrationController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Fishbowl do
  #   pipe_through :api
  # end
end
