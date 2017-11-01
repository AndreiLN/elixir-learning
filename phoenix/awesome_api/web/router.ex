defmodule AwesomeApi.Router do
  use AwesomeApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AwesomeApi do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
